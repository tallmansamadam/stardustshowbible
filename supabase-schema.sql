-- Run this in your Supabase SQL editor (Dashboard → SQL Editor → New query)
-- https://supabase.com/dashboard → your project → SQL Editor

-- Notes table
create table if not exists notes (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id),
  title text not null default '',
  content text default '',
  tag text default 'general',
  date text default '',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Posts table
create table if not exists posts (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references auth.users(id),
  platform text default 'Instagram',
  post_type text default '',
  status text default 'idea',
  content text default '',
  hashtags text default '',
  media_notes text default '',
  date text default '',
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

-- Migration: add new columns to existing posts table
alter table posts add column if not exists post_type text default '';
alter table posts add column if not exists hashtags text default '';
alter table posts add column if not exists media_notes text default '';

-- Long-form content (strategy, karaoke, djsets, planning, sound)
create table if not exists content (
  id uuid default gen_random_uuid() primary key,
  key text unique not null,
  value text default '',
  updated_at timestamptz default now()
);

-- Enable Row Level Security
alter table notes enable row level security;
alter table posts enable row level security;
alter table content enable row level security;

-- RLS Policies: authenticated users can read everything
create policy "Authenticated read notes" on notes for select using (auth.role() = 'authenticated');
create policy "Authenticated read posts" on posts for select using (auth.role() = 'authenticated');
create policy "Authenticated read content" on content for select using (auth.role() = 'authenticated');

-- Authenticated users can insert/update/delete (role enforcement is in the app)
create policy "Authenticated write notes" on notes for all using (auth.role() = 'authenticated');
create policy "Authenticated write posts" on posts for all using (auth.role() = 'authenticated');
create policy "Authenticated write content" on content for all using (auth.role() = 'authenticated');
