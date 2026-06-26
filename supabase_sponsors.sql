-- Lacrosse Shootout — sponsor ads + proof-of-display tracking
-- Run this ONCE in the Supabase dashboard: SQL Editor -> New query -> paste -> Run.
-- The game (index.html) reads the `sponsors` table and calls log_impression() per ad view.

-- 1) sponsors: the ad creative + how many impressions are paid for
create table if not exists public.sponsors (
  id          bigint generated always as identity primary key,
  name        text    not null,          -- big line on the ad card
  tag         text    default '',        -- second line (e.g. "NOW OPEN IN BASOM")
  sub         text    default '',         -- small description line
  color       text    default '#37c66b', -- brand accent color (hex)
  paid        integer not null default 100, -- impressions purchased ($10 = 100)
  served      integer not null default 0,   -- impressions delivered so far
  active      boolean not null default true,-- auto-flips false when served >= paid
  created_at  timestamptz default now()
);

-- 2) ad_impressions: an immutable log = the proof each ad was shown (>=3s view)
create table if not exists public.ad_impressions (
  id           bigint generated always as identity primary key,
  sponsor_id   bigint references public.sponsors(id),
  sponsor_name text,
  shown_at     timestamptz default now(),
  session      text                       -- anonymous per-device id
);
create index if not exists ad_impr_sponsor_idx on public.ad_impressions (sponsor_id, shown_at);

-- 3) atomic: log one impression, bump the counter, retire the sponsor at its cap
create or replace function public.log_impression(p_sponsor_id bigint, p_session text)
returns void language plpgsql security definer set search_path = public as $$
begin
  insert into public.ad_impressions (sponsor_id, sponsor_name, session)
    select id, name, p_session from public.sponsors where id = p_sponsor_id;
  update public.sponsors set served = served + 1 where id = p_sponsor_id;
  update public.sponsors set active = false where id = p_sponsor_id and served >= paid;
end; $$;

-- 4) access for the anonymous (publishable) key the game uses
alter table public.sponsors       enable row level security;
alter table public.ad_impressions enable row level security;
-- players may read active sponsors; they may NOT read/write the impression log or edit sponsors
create policy sponsors_read on public.sponsors for select to anon using (active = true);
grant select on public.sponsors to anon;
grant execute on function public.log_impression(bigint, text) to anon;

-- ============================================================================
-- ADD A PAID SPONSOR (run for each booking; $10 = 100 impressions):
-- insert into public.sponsors (name, tag, sub, color, paid) values
--   ('GREEN LEAF DISPENSARY', 'NOW OPEN IN BASOM', 'TONAWANDA SENECA NATION - 21+', '#37c66b', 100);

-- PROOF OF DISPLAY (per sponsor: how many shown, first/last time):
-- select sponsor_name, count(*) as impressions, min(shown_at) as first_shown, max(shown_at) as last_shown
-- from public.ad_impressions group by sponsor_name order by impressions desc;

-- REMAINING BUDGET per sponsor:
-- select name, served, paid, paid - served as remaining, active from public.sponsors order by created_at;
-- ============================================================================
