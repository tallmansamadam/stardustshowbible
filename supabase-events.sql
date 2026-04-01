-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Events & Bookings Table
-- Run in: Supabase Dashboard → SQL Editor → New query
-- Run AFTER supabase-schema.sql
-- ─────────────────────────────────────────────────────────────────────────────

-- ── Events ────────────────────────────────────────────────────────────────────
-- Venue bookings, private events, DJ sets, photo shoots, maintenance, etc.
-- Types: booking | private-event | dj-set | photo-shoot | maintenance | other
-- Dates are YYYY-MM-DD text. end_date is optional (defaults to start_date).

create table if not exists events (
  id          uuid        default gen_random_uuid() primary key,
  user_id     uuid        references auth.users(id),
  title       text        not null default '',
  type        text        default 'booking',
  start_date  text        not null default '',
  end_date    text        default '',
  notes       text        default '',
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
);

alter table events enable row level security;

drop policy if exists "Authenticated read events"  on events;
drop policy if exists "Authenticated write events" on events;

create policy "Authenticated read events"  on events for select using (auth.role() = 'authenticated');
create policy "Authenticated write events" on events for all    using (auth.role() = 'authenticated');
