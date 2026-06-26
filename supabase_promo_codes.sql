-- Lacrosse Shootout — promo codes / QR redemption for free credits (coins)
-- Run ONCE in the Supabase dashboard: SQL Editor -> New query -> paste -> Run.
-- The game redeems a code via the redeem_code() RPC (manual entry or a ?code= link / QR).

-- 1) the codes you hand out (in store ads, on QR signs, etc.)
create table if not exists public.promo_codes (
  code        text primary key,            -- what players type, e.g. 'GREEN50' (store uppercase)
  coins       integer not null default 50, -- credits awarded per redemption
  max_uses    integer,                     -- total redemptions allowed; NULL = unlimited
  used        integer not null default 0,  -- redemptions so far
  active      boolean not null default true,
  created_at  timestamptz default now()
);

-- 2) one row per redemption: blocks the same device redeeming a code twice + is your audit trail
create table if not exists public.code_redemptions (
  id           bigint generated always as identity primary key,
  code         text references public.promo_codes(code),
  session      text not null,              -- anonymous per-device id
  redeemed_at  timestamptz default now(),
  unique (code, session)                   -- one redemption per device per code
);

-- 3) redeem: returns coins awarded (>0), 0 = invalid/expired/maxed, -1 = already redeemed on this device
create or replace function public.redeem_code(p_code text, p_session text)
returns integer language plpgsql security definer set search_path = public as $$
declare v_coins integer;
begin
  p_code := upper(btrim(p_code));
  select coins into v_coins from public.promo_codes
    where code = p_code and active = true and (max_uses is null or used < max_uses);
  if v_coins is null then return 0; end if;            -- no such active/available code
  begin
    insert into public.code_redemptions (code, session) values (p_code, p_session);
  exception when unique_violation then
    return -1;                                          -- this device already redeemed it
  end;
  update public.promo_codes set used = used + 1 where code = p_code;
  update public.promo_codes set active = false
    where code = p_code and max_uses is not null and used >= max_uses;   -- retire at the cap
  return v_coins;
end; $$;

-- 4) access for the anonymous (publishable) key the game uses
alter table public.promo_codes      enable row level security;
alter table public.code_redemptions enable row level security;
-- no direct table read/write for players; only the security-definer RPC touches these
grant execute on function public.redeem_code(text, text) to anon;

-- ============================================================================
-- MAKE A CODE (e.g. a dispensary hands out 'GREEN50' worth 50 coins, 500 redemptions):
-- insert into public.promo_codes (code, coins, max_uses) values ('GREEN50', 50, 500);
-- unlimited uses: leave max_uses null ->
-- insert into public.promo_codes (code, coins) values ('GRANDOPEN', 100);

-- QR CODE: point it at  https://michaeltholland.github.io/agent-mode/?code=GREEN50
-- (scanning opens the game and auto-redeems; players can also type GREEN50 in REDEEM CODE)

-- REDEMPTION REPORT (proof / counts):
-- select code, count(*) as redemptions, min(redeemed_at) first, max(redeemed_at) last
-- from public.code_redemptions group by code order by redemptions desc;

-- REMAINING per code:
-- select code, coins, used, max_uses, (max_uses - used) as remaining, active from public.promo_codes;
-- ============================================================================
