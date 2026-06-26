-- ============================================================================
-- Lacrosse Shootout — COMPLETE backend setup (sponsors + promo codes)
-- Run this ONCE: Supabase dashboard -> SQL Editor -> New query -> paste -> Run.
-- This is the ONLY required setup step. After it runs, the live game's ad slot,
-- impression proof, and code/QR redemption all start working automatically.
-- (Replaces the two separate files supabase_sponsors.sql + supabase_promo_codes.sql.)
-- ============================================================================

-- ========================= SPONSOR ADS =========================

create table if not exists public.sponsors (
  id          bigint generated always as identity primary key,
  name        text    not null,
  tag         text    default '',
  sub         text    default '',
  color       text    default '#37c66b',
  paid        integer not null default 100,   -- impressions purchased ($10 = 100)
  served      integer not null default 0,
  active      boolean not null default true,
  created_at  timestamptz default now()
);

create table if not exists public.ad_impressions (
  id           bigint generated always as identity primary key,
  sponsor_id   bigint references public.sponsors(id),
  sponsor_name text,
  shown_at     timestamptz default now(),
  session      text
);
create index if not exists ad_impr_sponsor_idx on public.ad_impressions (sponsor_id, shown_at);

create or replace function public.log_impression(p_sponsor_id bigint, p_session text)
returns void language plpgsql security definer set search_path = public as $$
begin
  insert into public.ad_impressions (sponsor_id, sponsor_name, session)
    select id, name, p_session from public.sponsors where id = p_sponsor_id;
  update public.sponsors set served = served + 1 where id = p_sponsor_id;
  update public.sponsors set active = false where id = p_sponsor_id and served >= paid;
end; $$;

alter table public.sponsors       enable row level security;
alter table public.ad_impressions enable row level security;
create policy sponsors_read on public.sponsors for select to anon using (active = true);
grant select on public.sponsors to anon;
grant execute on function public.log_impression(bigint, text) to anon;

-- ========================= PROMO CODES =========================

create table if not exists public.promo_codes (
  code        text primary key,
  coins       integer not null default 50,
  max_uses    integer,                     -- NULL = unlimited
  used        integer not null default 0,
  active      boolean not null default true,
  created_at  timestamptz default now()
);

create table if not exists public.code_redemptions (
  id           bigint generated always as identity primary key,
  code         text references public.promo_codes(code),
  session      text not null,
  redeemed_at  timestamptz default now(),
  unique (code, session)
);

create or replace function public.redeem_code(p_code text, p_session text)
returns integer language plpgsql security definer set search_path = public as $$
declare v_coins integer;
begin
  p_code := upper(btrim(p_code));
  select coins into v_coins from public.promo_codes
    where code = p_code and active = true and (max_uses is null or used < max_uses);
  if v_coins is null then return 0; end if;
  begin
    insert into public.code_redemptions (code, session) values (p_code, p_session);
  exception when unique_violation then
    return -1;
  end;
  update public.promo_codes set used = used + 1 where code = p_code;
  update public.promo_codes set active = false
    where code = p_code and max_uses is not null and used >= max_uses;
  return v_coins;
end; $$;

alter table public.promo_codes      enable row level security;
alter table public.code_redemptions enable row level security;
grant execute on function public.redeem_code(text, text) to anon;

-- ============================================================================
-- AFTER SETUP — quick reference (run any of these as needed):
--
--   Add a paid sponsor ($10 = 100 ad views):
--     insert into public.sponsors (name, tag, sub, color, paid)
--     values ('GREEN LEAF DISPENSARY','NOW OPEN IN BASOM','TONAWANDA SENECA NATION - 21+','#37c66b',100);
--
--   Create a promo code (50 coins, 500 redemptions; leave max_uses out for unlimited):
--     insert into public.promo_codes (code, coins, max_uses) values ('GREEN50', 50, 500);
--   QR link for it:  https://michaeltholland.github.io/agent-mode/?code=GREEN50
--
--   Proof an ad was shown / a code was used:
--     select sponsor_name, count(*) impressions, max(shown_at) last from public.ad_impressions group by sponsor_name;
--     select code, count(*) redemptions, max(redeemed_at) last from public.code_redemptions group by code;
-- ============================================================================
