-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Supabase Schema
-- Single-pass setup for a fresh project. Safe to re-run: tables use
-- CREATE TABLE IF NOT EXISTS; policies are dropped and recreated.
--
-- Run in: Supabase Dashboard → SQL Editor → New query
-- ─────────────────────────────────────────────────────────────────────────────

-- ── Notes ─────────────────────────────────────────────────────────────────────
-- User-generated notes. Tags: general, karaoke, electro-swing, dj, marketing,
-- sound, log, setlist, incident

create table if not exists notes (
  id          uuid        default gen_random_uuid() primary key,
  user_id     uuid        references auth.users(id),
  title       text        not null default '',
  content     text        default '',
  tag         text        default 'general',
  date        text        default '',
  pinned      boolean     default false,
  created_at  timestamptz default now(),
  updated_at  timestamptz default now()
);

-- ── Posts ─────────────────────────────────────────────────────────────────────
-- Social media content calendar. Platforms: Instagram, TikTok, Facebook, Twitter/X
-- Status workflow: idea → draft → scheduled → posted

create table if not exists posts (
  id           uuid        default gen_random_uuid() primary key,
  user_id      uuid        references auth.users(id),
  platform     text        default 'Instagram',
  post_type    text        default '',
  status       text        default 'idea',
  content      text        default '',
  hashtags     text        default '',
  media_notes  text        default '',
  video_script text        default '',
  date         text        default '',
  post_time    text        default '',
  created_at   timestamptz default now(),
  updated_at   timestamptz default now()
);

-- ── Content ───────────────────────────────────────────────────────────────────
-- Key/value store for long-form docs and shared state.
-- Reserved keys: showbible, karaoke, djsets, planning, sound, contacts,
--                role-map, checklist-YYYY-MM-DD, checklist-logged-YYYY-MM-DD

create table if not exists content (
  id          uuid        default gen_random_uuid() primary key,
  key         text        unique not null,
  value       text        default '',
  updated_at  timestamptz default now()
);

-- ── Row Level Security ────────────────────────────────────────────────────────
-- Role enforcement is handled in the app layer. At the DB layer, any
-- authenticated user can read and write all rows.

alter table notes   enable row level security;
alter table posts   enable row level security;
alter table content enable row level security;

-- Drop and recreate policies so this script is safely re-runnable

drop policy if exists "Authenticated read notes"   on notes;
drop policy if exists "Authenticated write notes"  on notes;
drop policy if exists "Authenticated read posts"   on posts;
drop policy if exists "Authenticated write posts"  on posts;
drop policy if exists "Authenticated read content" on content;
drop policy if exists "Authenticated write content" on content;

create policy "Authenticated read notes"    on notes   for select using (auth.role() = 'authenticated');
create policy "Authenticated write notes"   on notes   for all    using (auth.role() = 'authenticated');
create policy "Authenticated read posts"    on posts   for select using (auth.role() = 'authenticated');
create policy "Authenticated write posts"   on posts   for all    using (auth.role() = 'authenticated');
create policy "Authenticated read content"  on content for select using (auth.role() = 'authenticated');
create policy "Authenticated write content" on content for all    using (auth.role() = 'authenticated');
