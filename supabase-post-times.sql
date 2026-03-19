-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Post Time Migration
-- Adds post_time to all existing posts that don't have one set.
-- Run AFTER the schema migration: alter table posts add column if not exists post_time text default '';
-- Safe to run multiple times — only updates rows where post_time is empty.
-- ─────────────────────────────────────────────────────────────────────────────

-- Step 1: Make sure the column exists
ALTER TABLE posts ADD COLUMN IF NOT EXISTS post_time text DEFAULT '';

-- Step 2: TikTok — 10:00 AM (peak engagement window)
UPDATE posts SET post_time = '10:00'
WHERE platform = 'TikTok' AND (post_time IS NULL OR post_time = '');

-- Step 3: Instagram Reels, Feed Posts, Carousels — 11:00 AM
UPDATE posts SET post_time = '11:00'
WHERE platform = 'Instagram' AND post_type != 'Story' AND (post_time IS NULL OR post_time = '');

-- Step 4: Instagram Stories — 4:00 PM (day-of, pre-evening)
UPDATE posts SET post_time = '16:00'
WHERE platform = 'Instagram' AND post_type = 'Story' AND (post_time IS NULL OR post_time = '');

-- Step 5: Facebook — 1:00 PM
UPDATE posts SET post_time = '13:00'
WHERE platform = 'Facebook' AND (post_time IS NULL OR post_time = '');

-- Step 6: Twitter/X — 8:00 AM
UPDATE posts SET post_time = '08:00'
WHERE platform = 'Twitter/X' AND (post_time IS NULL OR post_time = '');
