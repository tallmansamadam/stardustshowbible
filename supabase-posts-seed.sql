-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Social Posts Seed
-- Date range: March 11 – May 10, 2026
-- Source: Best mix from batches 000/010/020 (Mar 11–Apr 10) + full Batch 100 (Apr 11–May 10)
-- Run in Supabase SQL Editor (Authentication → bypass RLS as service role)
--
-- BEFORE RUNNING: Replace 'YOUR_USER_ID_HERE' with your actual Supabase user ID.
-- Find it in: Supabase → Authentication → Users → click your email → copy User UID
-- ─────────────────────────────────────────────────────────────────────────────

DO $$
DECLARE
  uid uuid := 'YOUR_USER_ID_HERE';
BEGIN

-- ── Clear existing posts ───────────────────────────────────────────────────────
DELETE FROM posts;


-- ── POST 01 · Instagram Story · Mar 11 · Score 3.0 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Three nights this week at Stardust.
Thu · Fri · Sat · Doors 8pm

📍 710 N Clark · River North',
'',
'Story (9:16). Bold text over a warm crowd shot — the room alive, not empty. Countdown sticker to Thursday.',
'2026-03-11');

-- ── POST 02 · Twitter/X Tweet · Mar 11 · Score 3.0 · (010) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'three nights of karaoke this week at stardust. thursday, friday, saturday. 710 n clark, river north.',
'', '', '2026-03-11');

-- ── POST 04 · TikTok Video · Mar 12 · Score 3.2 · (020) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday karaoke at stardust hits different. 710 n clark, river north, chicago. doors at 8.',
'',
'Thursday energy — the room warming up, regulars and newcomers. Quick cuts, raw footage. On-screen: "STARDUST · EVERY THURSDAY"',
'Script: "thursday karaoke at stardust just hits different."

0:00 · 2s — Wide room, lights warming up, night just starting
0:02 · 2s — From back of crowd toward stage — first singer, room half-full
0:04 · 2s — Regulars arriving — coats off, drinks ordered
0:06 · 2s — Someone mid-song, crowd leaning in
0:08 · 2s — Bar in motion, the room getting busy
0:10 · 2s — Wide again, energy climbing
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-12');

-- ── POST 05 · Instagram Story · Mar 13 · Score 4.0 · (010) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday starts at the mic.

📍 710 N Clark · Doors 8pm · Open till 4am',
'',
'Story (9:16). Bold text over stage shot — mic stand, warm stage wash, no people yet. Countdown sticker to doors.',
'2026-03-13');

-- ── POST 06 · TikTok Video · Mar 13 · Score 4.0 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night starts at stardust. 710 n clark, river north, chicago. karaoke till 4am.',
'',
'The moment the room starts filling up — people arriving, coats off, drinks in hand, the energy building. On-screen: "STARDUST CHICAGO · EVERY FRIDAY".',
'Script: "friday night starts at stardust."

0:00 · 2s — Empty stage, mic stand lit, room waiting
0:02 · 2s — Doors open — first people through, coats still on
0:04 · 2s — First drinks poured at the bar
0:06 · 2s — First singer at the mic — nervous, good energy
0:08 · 2s — Room half-full, volume rising
0:10 · 2s — Wide shot — Friday energy taking hold
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-03-13');

-- ── POST 07 · Instagram Story · Mar 14 · Score 4.0 · (000) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday starts at the mic.

📍 710 N Clark · Doors 8pm · Open till 5am',
'',
'Story format (9:16). Bold text overlay on atmospheric bar photo. Add countdown sticker to 8pm.',
'2026-03-14');

-- ── POST 09 · Instagram Feed Post · Mar 16 · Score 3.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Weekend''s done. The songs are still stuck in our heads.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #karaokelife #312',
'Single strong image — the room at peak energy from the weekend. Portrait orientation.',
'2026-03-16');

-- ── POST 10 · TikTok Video · Mar 16 · Score 3.0 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'this is what stardust looks like on a karaoke night. we''re back thursday. 710 n clark, river north, chicago.',
'',
'Best uncut clip from the weekend — one moment, no edits, real sound. The kind of clip that makes someone feel like they missed something. On-screen at the end: "STARDUST · THU FRI SAT".',
'Script: "this is what stardust looks like on a karaoke night."

0:00 · 20s — One uncut clip: room at peak, someone mid-song, crowd fully in it. Raw audio. No edits.
0:20 · 3s  — End card: STARDUST · THU FRI SAT · 710 N CLARK
Total: ~23s',
'2026-03-16');

-- ── POST 11 · Instagram Feed Post · Mar 18 · Score 3.0 · (010) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The stage has been quiet for two days.

Not for long.

Thu · Fri · Sat · 710 N Clark · River North · Doors 8pm',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #wednesday #weekendplans #thingstodoinchicago #chicagoweekend #karaokenight #chicagobar',
'Atmospheric — the stage empty and lit. Just the mic stand in the wash. No people. Portrait orientation. Let the emptiness create anticipation.',
'2026-03-18');

-- ── POST 12 · Twitter/X Tweet · Mar 18 · Score 3.0 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'tomorrow night at stardust. karaoke. 710 n clark, river north. doors at 8.',
'', '', '2026-03-18');

-- ── POST 13 · Instagram Story · Mar 19 · Score 3.0 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'It''s Thursday.
You already know what that means.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm stage shot, bold text. The knowing Thursday regular energy.',
'2026-03-19');

-- ── POST 17 · Facebook Post · Mar 20 · Score 3.0 · (020) ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

No theme. No restrictions. No wrong answers.

Whatever song has been living rent-free in your head this week — tonight''s the night.

710 N Clark · River North · Doors 8pm · Open till 4am · Free to sing',
'',
'Photo album — 3-5 candid shots from a previous karaoke night. Different performers, different songs, different energy.',
'2026-03-20');

-- ── POST 19 · Facebook Event · Mar 21 · Score 3.0 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Saturday at Stardust Chicago

River North, late night, open mic, no cover. Saturday night done right.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover image.',
'2026-03-21');

-- ── POST 20 · Instagram Feed Post · Mar 23 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #karaokelife #312',
'Strongest single image from the weekend — let the photo do all the talking. No caption needed beyond the location tag.',
'2026-03-23');

-- ── POST 21 · Twitter/X Tweet · Mar 23 · Score 4.0 · (010) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'full room this weekend at stardust. back thursday. 710 n clark, river north.',
'', '', '2026-03-23');

-- ── POST 22 · Instagram Feed Post · Mar 25 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing early mood tease — ATMOSPHERE ONLY. Single image: something slightly out of time, warm and mysterious. No people. No genre. No event info.',
'2026-03-25');

-- ── POST 23 · Twitter/X Tweet · Mar 25 · Score 3.5 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'something is taking shape at stardust. more soon.',
'', '', '2026-03-25');

-- ── POST 24 · Instagram Story · Mar 26 · Score 3.3 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm and intimate — the Thursday feeling. Bold text, simple and clean.',
'2026-03-26');

-- ── POST 25 · Instagram Reel · Mar 27 · Score 3.5 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Friday of March.
Don''t waste it.

📍 710 N Clark · River North · Doors 8pm',
'#stardustchicago #karaoke #karaokenight #friday #fridaynight #chicagonightlife #rivernorth #chicagobar #livekaraoke #312 #thingstodoinchicago #weekendplans',
'The room coming alive — lights up, first people arriving, energy building. Quick cuts. On-screen: "LAST FRIDAY OF MARCH · STARDUST CHICAGO"',
'Script: "Last Friday of March. Don''t waste it."

0:00 · 2s — Bar lit, stools mostly empty — room still early
0:02 · 2s — First people arriving, energy starting to build
0:04 · 2s — Lights up full — the room transformed
0:06 · 2s — Someone grabbing the mic — the night beginning
0:08 · 2s — Crowd filling in — drinks raised, voices joining
0:10 · 3s — Wide shot — the last Friday of March, room alive
0:13 · 4s — End card: LAST FRIDAY OF MARCH · STARDUST CHICAGO
Total: ~17s',
'2026-03-27');

-- ── POST 26 · TikTok Video · Mar 27 · Score 3.1 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'getting stardust ready for the last friday of march. 710 n clark, river north. karaoke till 4am.',
'',
'POV behind-the-scenes — mics being checked, lights coming up, bar being set. Quick cuts. Raw footage. On-screen: "getting stardust ready for tonight".',
'Script: "getting stardust ready for tonight."

0:00 · 2s — Empty room, house lights still up
0:02 · 2s — Mics being checked — held up, tapped, tested
0:04 · 2s — QR cards placed on tables — hands doing the work
0:06 · 2s — Lights switching from house to stage wash
0:08 · 2s — Bar being set — bottles lined up, glasses polished
0:10 · 2s — Final wide shot — room ready, doors about to open
0:12 · 4s — End card: STARDUST CHICAGO · TONIGHT · 710 N CLARK
Total: ~16s',
'2026-03-27');

-- ── POST 27 · Instagram Story · Mar 28 · Score 4.0 · (000) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Last Saturday of March. Make it count.

📍 710 N Clark · Doors 8pm · Open till 5am',
'',
'Story (9:16) — strong performer photo or bar ambience. Poll sticker: "Are you coming tonight?" or countdown to doors.',
'2026-03-28');

-- ── POST 29 · Instagram Feed Post · Mar 30 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'March closed on a high note.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #karaokelife #312',
'End-of-month — best image from the March 28 weekend. Something that feels like a closing frame.',
'2026-03-30');

-- ── POST 30 · Instagram Feed Post · Apr 2 · Score 4.0 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing Week 1 teaser — MOOD ONLY. Different image from Mar 25. If Mar 25 was a wide atmospheric shot, this should be a close detail. Something that feels slightly out of time. No genre. No people. No event info. Just the ornament as caption.',
'2026-04-02');

-- ── POST 31 · TikTok Video · Apr 2 · Score 4.0 · (010) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust chicago',
'',
'Atmosphere-only teaser video. Different angle from any previous teaser — try a slow close-up of a single lit detail (a candle, the bar edge, a glass). 10 seconds. Ambient audio only. No on-screen text except the Stardust logo at the very end.',
'Script: (no spoken words — ambient audio only)

0:00 · 3s — Extreme close-up: a candle flame, warm and still
0:03 · 3s — Bar edge in low light — a glass, a soft reflection
0:06 · 2s — Stage in near-darkness, one practical light source
0:08 · 2s — Slow fade to black
0:10 · 3s — End card: STARDUST CHICAGO (logo only)
Total: ~13s
Note: No music, no text, no voice. Room tone only.',
'2026-04-02');

-- ── POST 32 · Instagram Story · Apr 3 · Score 3.4 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The mic is live.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). High energy — packed room, stage lit. Bold text. Countdown sticker.',
'2026-04-03');

-- ── POST 33 · TikTok Video · Apr 3 · Score 3.4 · (020) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'it''s friday. stardust chicago is open. 710 n clark, river north. karaoke till 4am.',
'',
'The room filling up — energy building, people arriving. Quick cuts, phone footage. On-screen: "STARDUST CHICAGO · OPEN TONIGHT"',
'Script: "it''s friday. stardust chicago is open."

0:00 · 2s — Exterior: 710 N Clark, neon on, doors open
0:02 · 2s — Room filling — people through the door, energy starting
0:04 · 2s — Bar busy — drinks ordered, the room getting loud
0:06 · 2s — From back of crowd toward stage — singer in the distance
0:08 · 2s — Close on a face singing along — completely in it
0:10 · 2s — Wide room — fuller, louder, lights bright
0:12 · 4s — End card: STARDUST CHICAGO · OPEN TONIGHT · 710 N CLARK
Total: ~16s',
'2026-04-03');

-- ── POST 34 · Facebook Event · Apr 3 · Score 3.0 · (020) ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

The one where you finally sing that song you''ve been thinking about all week.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Friday Facebook Event. High-energy performer or crowd photo as cover image.',
'2026-04-03');

-- ── POST 35 · Instagram Feed Post · Apr 4 · Score 3.5 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Something new is arriving at Stardust.

📍 710 N Clark · River North',
'#stardustchicago #stardust #chicago #rivernorth #comingsoon',
'Electro Swing Week 1 continuation. A different detail from previous teasers — art deco geometry, a vintage texture, something that doesn''t quite fit the current era. No people. No genre. The mystery continues.',
'2026-04-04');

-- ── POST 37 · Instagram Feed Post · Apr 6 · Score 3.0 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The weekend closed with a full room.

See you Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #312',
'Best image from the Apr 3-4 weekend. Crowd energy preferred.',
'2026-04-06');

-- ── POST 38 · Instagram Reel · Apr 8 · Score 3.65 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The swing era never ended.
It just got louder.

Coming soon to Stardust Chicago.
📍 710 N Clark · River North',
'#stardustchicago #electroswing #swingmusic #caravanpalace #parovstelar #chicago #rivernorth #chicagonightlife #vintagestyle #jazzvibes #speakeasy #electrojazz #comingsoon',
'Electro Swing Week 2 — genre reveal. Drop straight into audio (Caravan Palace or Parov Stelar — pick the 15 seconds that hits hardest). Art deco visuals, warm amber. On-screen: "electro swing is coming to stardust chicago"',
'Script: "The swing era never ended. It just got louder."

0:00 · 3s — Cold open: Caravan Palace audio, no title card. Art deco image, warm amber.
0:03 · 2s — A vintage detail — 1920s texture, something out of time
0:05 · 2s — On-screen: "imagine jazz."
0:07 · 2s — On-screen: "but it grooves like house."
0:09 · 2s — Wider art deco image — the full aesthetic
0:11 · 2s — On-screen: "electro swing"
0:13 · 4s — End card: COMING SOON · STARDUST CHICAGO · 710 N CLARK
Total: ~17s
Note: Audio must be Caravan Palace or Parov Stelar — let the 15 strongest seconds play uncut.',
'2026-04-08');

-- ── POST 39 · TikTok Video · Apr 8 · Score 5.0 · (010) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the swing era never ended. it just got louder. electro swing is coming to stardust chicago. 710 n clark, river north.',
'',
'Open cold on audio — no title card, just the music. Let it play for 3 seconds before any text appears. On-screen: "imagine jazz." → pause → "but it makes you want to dance." → "electro swing is coming to stardust chicago." End with logo.',
'Script: "the swing era never ended. it just got louder."

0:00 · 3s — Cold open: Caravan Palace audio hits first. No title. Just the music.
0:03 · 2s — On-screen: "imagine jazz."
0:05 · 2s — On-screen: "but it grooves like house."
0:07 · 3s — Art deco visual — warm amber, sharp geometry, the Stardust aesthetic
0:10 · 2s — On-screen: "electro swing is coming to stardust chicago."
0:12 · 4s — End card: STARDUST CHICAGO (logo)
Total: ~16s
Note: Do not cut the music. Audio is the whole video.',
'2026-04-08');

-- ── POST 40 · Facebook Post · Apr 8 · Score 3.8 · (020) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Something new is coming to River North — and it sounds like nothing else in Chicago right now.

It''s called electro swing. The energy of the jazz age, rebuilt for tonight''s dancefloor. Think Caravan Palace. Think Parov Stelar. Think the sound you didn''t know you were missing.

Coming soon to Stardust Chicago.
📍 710 N Clark · River North · stardustchi.com',
'',
'Art-deco inspired graphic or atmospheric photo. Link to "Lone Digger" by Caravan Palace on YouTube in the post.',
'2026-04-08');

-- ── POST 41 · Twitter/X Tweet · Apr 8 · Score 3.7 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'the swing era never ended. it just got louder. electro swing is coming to stardust chicago. 710 n clark, river north.',
'', '', '2026-04-08');

-- ── POST 42 · Instagram Story · Apr 9 · Score 4.0 · (010) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The mic is live.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm bar detail or stage shot. Simple text. Intimate Thursday energy.',
'2026-04-09');

-- ── POST 43 · Instagram Story · Apr 10 · Score 3.75 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The weekend starts now.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). High-energy Friday feel — stage lit, crowd building. Bold text overlay.',
'2026-04-10');

-- ── POST 44 · Facebook Event · Apr 10 · Score 3.55 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

River North. Late night. Free to sing. No excuses.

Doors 8pm · Open till 4am · 710 N Clark St · River North',
'',
'Recurring Friday Facebook Event. High-energy crowd or performer photo as cover image.',
'2026-04-10');

-- ── POST 45 · Twitter/X Tweet · Mar 13 · Friday night-of ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday night at stardust — the room fills up fast, the singing gets louder, and somewhere around midnight someone always does something you wouldn''t believe. 710 n clark.',
'', '', '2026-03-13');

-- ── POST 46 · Twitter/X Tweet · Mar 14 · Saturday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday night at stardust. open till 5am. you have no excuse. 710 n clark, river north.',
'', '', '2026-03-14');

-- ── POST 47 · Facebook Event · Mar 14 · Saturday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

Saturday night in River North, and there is exactly one place to be.

One mic. An endlessly patient crowd. A songbook that doesn''t judge. Whatever you''ve been holding back all week — tonight is the night to let it out.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover — the room at its loudest and most alive.',
'2026-03-14');

-- ── POST 48 · Facebook Post · Mar 16 · Weekend recap ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Three nights. Hundreds of songs. An extraordinary weekend at Stardust.

Thursday through Saturday, the room was exactly what a late-night karaoke bar in River North should be — packed, loud, and full of people who showed up ready to actually sing.

We''ll be back Thursday. Put it in your calendar.

📍 710 N Clark · River North · Doors 8pm',
'',
'Best photo from the weekend — crowd energy or a performer mid-song. Warm, candid, and real.',
'2026-03-16');

-- ── POST 49 · Twitter/X Tweet · Mar 19 · Thursday promo ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday at stardust. the week isn''t over — it''s just getting to the good part. 710 n clark, river north.',
'', '', '2026-03-19');

-- ── POST 50 · Facebook Event · Mar 19 · Thursday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

It''s Thursday. The week isn''t over, but the best part of it starts tonight.

Come in, put your name on the list, and let the room take it from there.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm, intimate atmosphere photo as cover — the Thursday feeling, not the Saturday energy.',
'2026-03-19');

-- ── POST 51 · Twitter/X Tweet · Mar 26 · Thursday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke is already going strong at stardust. get here before the list fills up. 710 n clark.',
'', '', '2026-03-26');

-- ── POST 52 · Facebook Event · Mar 26 · Thursday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Second-to-last Thursday of March. The room has been remarkable every single night this month — tonight is no exception.

Put your name on the list. Sing the one you''ve been saving.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar photo — intimacy over energy for the Thursday feel.',
'2026-03-26');

-- ── POST 53 · Twitter/X Tweet · Mar 28 · Saturday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'last saturday of march at stardust. the room is extraordinary tonight. open till 5am. 710 n clark, river north.',
'', '', '2026-03-28');

-- ── POST 54 · Facebook Post · Mar 28 · Last Saturday of March ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Last Saturday of March — Tonight at Stardust Chicago

March has been an incredible month. Full rooms, unforgettable performances, and enough extraordinary late nights to carry you well into April.

Tonight is the closing chapter. Come in, put your name on the list, and give March the send-off it deserves.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Strong atmospheric or crowd photo — something that feels like a proper finale, not just another night.',
'2026-03-28');

-- ── POST 55 · Instagram Carousel · Mar 30 · March recap ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'March at Stardust.

Nine nights. Hundreds of songs. A room that showed up every single time.

April is going to be even better.

📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #monthlyrecap #chicagobar #karaokelife #312 #chicago',
'5–7 slide carousel. Best moments from March: crowd shots, performer moments, atmospheric bar details. Warm and candid throughout. Last slide: "See you in April." with the Stardust logo and address.',
'2026-03-30');

-- ── POST 56 · Facebook Event · Apr 2 · Thursday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

First Thursday of April. New month, same exceptional Thursday energy.

There''s also something new on the horizon at Stardust — stay tuned for what''s coming later this month.

In the meantime: come sing. The mic is live, the bar is ready, and the room will do the rest.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar detail or stage shot as cover.',
'2026-04-02');

-- ── POST 57 · Twitter/X Tweet · Apr 4 · Saturday + teaser ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday night karaoke at stardust. also: something remarkable is coming to river north later this month. 710 n clark.',
'', '', '2026-04-04');

-- ── POST 58 · Facebook Event · Apr 4 · Saturday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

April is here, and Saturday night in River North belongs to Stardust.

Come in early, stay late, and sing the song you''ve been rehearsing in your head all week.

Also: watch this space — something extraordinary is coming to Stardust later this month.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover.',
'2026-04-04');

-- ── POST 59 · Twitter/X Tweet · Apr 6 · Weekend recap ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'incredible weekend at stardust. back thursday. 710 n clark, river north.',
'', '', '2026-04-06');

-- ── POST 60 · Facebook Post · Apr 6 · Weekend recap ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'An incredible start to April at Stardust.

Thursday and Saturday, the room was exactly what a late-night karaoke bar should be — warm, packed, and alive with people who came ready to perform.

We''re back Thursday.

And if you''ve been paying attention to this week''s teasers — yes, something genuinely exciting is arriving at Stardust very soon. Details coming shortly.

📍 710 N Clark · River North',
'',
'Best image from the Apr 3–4 weekend — crowd energy or a standout performer moment. Warm and candid.',
'2026-04-06');

-- ── POST 61 · Twitter/X Thread · Apr 8 · Electro Swing reveal ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Thread', 'draft',
'thread: what is electro swing, and why is it coming to stardust chicago?

1/ electro swing is exactly what it sounds like. jazz-age energy rebuilt for a modern dancefloor. think caravan palace. think parov stelar. think the sound you didn''t know you were missing.

2/ we''ve been building something at stardust for a while now. the room, the late nights, the crowd that keeps showing up and surprising us. it was always going to lead somewhere like this.

3/ electro swing night is coming to 710 n clark, river north, chicago. late april. the date drops this week. stay tuned.',
'', '', '2026-04-08');

-- ── POST 62 · Instagram Carousel · Apr 8 · Electro Swing reveal ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'The swing era never ended.
It just got louder.

Electro swing is coming to Stardust Chicago.

📍 710 N Clark · River North',
'#stardustchicago #electroswing #swingmusic #caravanpalace #parovstelar #chicago #rivernorth #chicagonightlife #vintagestyle #jazzvibes #speakeasy #electrojazz #comingsoon',
'5-slide carousel reveal. Slide 1: art deco atmospheric still with title card. Slide 2: "The jazz age had the best energy." Slide 3: "Someone rebuilt it for a modern dancefloor." Slide 4: "It''s called electro swing." Slide 5: Stardust logo + "Coming soon · 710 N Clark · River North". Warm amber and black throughout.',
'2026-04-08');

-- ── POST 63 · Twitter/X Tweet · Apr 9 · Thursday night-of ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday at stardust. the room is warm, the mics are live, and the list is already growing. 710 n clark.',
'', '', '2026-04-09');

-- ── POST 64 · Facebook Event · Apr 9 · Thursday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Thursday night at Stardust. The list fills up fast, the room gets loud, and something about Thursdays here makes people perform like they actually mean it.

Come early. Stay late.

Also: electro swing is arriving at Stardust very soon. Stay tuned for the announcement.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm, intimate bar photo — the Thursday feeling, not the Saturday energy.',
'2026-04-09');

-- ── POST 65 · Twitter/X Tweet · Apr 10 · Friday night-of ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday night at stardust. last karaoke night before electro swing arrives. 710 n clark, river north. open till 4am.',
'', '', '2026-04-10');

-- ════════════════════════════════════════════════════════════════════════════
-- BATCH 100 — Apr 11 – May 10, 2026 (karaoke-first, ES featured not centered)
-- ════════════════════════════════════════════════════════════════════════════

-- ── POST 66 · Instagram Story · Apr 11 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Open till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Packed Saturday crowd — room fully alive, lights up, energy at its peak. Bold text overlay. Countdown sticker to doors.',
'2026-04-11');

-- ── POST 67 · TikTok Video · Apr 11 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night at stardust goes till 5am. 710 n clark, river north, chicago. karaoke all night.',
'',
'Raw Saturday footage — the room at full capacity, different voices, different songs, the crowd fully in it. Quick cuts. On-screen: "STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM"',
'Script: "saturday night at stardust goes till 5am."

0:00 · 2s — Wide room at full capacity — every table, wall-to-wall
0:02 · 2s — Singer mid-song, fully committed
0:04 · 2s — From back of crowd toward stage — sea of people, singer in the distance
0:06 · 2s — Close on crowd — multiple faces, everyone locked in
0:08 · 2s — Different singer — totally different song, same energy
0:10 · 2s — Bar packed — drinks in every hand
0:12 · 2s — Wide again — the room at absolute peak
0:14 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~18s',
'2026-04-11');

-- ── POST 68 · Twitter/X Tweet · Apr 11 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday night at stardust. 710 n clark, river north. doors at 8, open till 5am.',
'', '', '2026-04-11');

-- ── POST 69 · Facebook Event · Apr 11 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

The kind of Saturday night that stretches all the way to 5am — and still feels too short. An extraordinary room full of songs you know, people you don''t, and one mic that belongs to whoever wants it next.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Packed crowd photo as cover image — the room at its most alive.',
'2026-04-11');

-- ── POST 70 · Instagram Feed Post · Apr 13 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing mood reveal — one image, no copy beyond the ornament. Something warm, slightly vintage, a detail that doesn''t belong to now. No genre, no date, no explanation. Let the image and comments do the work.',
'2026-04-13');

-- ── POST 71 · Twitter/X Tweet · Apr 14 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'april 25. stardust chicago. electro swing night.',
'', '', '2026-04-14');

-- ── POST 72 · Facebook Post · Apr 14 ────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'On Saturday, April 25, Stardust Chicago presents its first-ever Electro Swing Night — an extraordinary evening in River North where the jazz age meets the modern dancefloor.

Think Caravan Palace. Think Parov Stelar. Think the energy of a 1920s speakeasy rebuilt for tonight, turned up loud, and open till 5am.

One night. One sound. One room in River North you won''t forget.

📍 710 N Clark St · River North · Doors 8pm · Open till 5am · No cover',
'',
'Art deco inspired graphic — warm amber tones, geometric shapes, a vintage-modern tension. Formal announcement; should feel like a proper reveal.',
'2026-04-14');

-- ── POST 73 · Instagram Story · Apr 16 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
You already know what that means.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm, intimate Thursday atmosphere — bar shot, stage lit, the room settling in. Bold text. Countdown sticker.',
'2026-04-16');

-- ── POST 74 · Twitter/X Tweet · Apr 16 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. 710 n clark, river north. doors at 8.',
'', '', '2026-04-16');

-- ── POST 75 · Facebook Event · Apr 16 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

River North''s best Thursday night continues. Pick any song. Take the mic. The room is ready for whatever you''ve been holding onto all week.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar or performer photo as cover image.',
'2026-04-16');

-- ── POST 76 · Instagram Story · Apr 17 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The weekend starts now.

📍 710 N Clark · Doors 8pm · Open till 4am',
'',
'Story (9:16). Stage lit, mic in frame, the room just starting to fill. Bold text overlay. Countdown sticker to 8pm.',
'2026-04-17');

-- ── POST 77 · TikTok Video · Apr 17 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. 710 n clark, river north. open till 4am.',
'',
'The room coming alive on a Friday — first people arriving, coats off, first drinks, the energy building fast. Quick cuts. On-screen: "STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM"',
'Script: "friday night karaoke at stardust chicago."

0:00 · 2s — Stage lit, mic in frame, room still empty — the promise
0:02 · 2s — Doors opening — first people through, coats on
0:04 · 2s — First drinks at the bar, the room coming alive
0:06 · 2s — First singer of the night at the mic
0:08 · 2s — Room half-full, volume picking up fast
0:10 · 2s — Someone in the crowd already singing along
0:12 · 2s — Wide shot — the Friday crowd building
0:14 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~18s',
'2026-04-17');

-- ── POST 78 · Twitter/X Tweet · Apr 17 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday night. stardust chicago. karaoke till 4am. 710 n clark, river north.',
'', '', '2026-04-17');

-- ── POST 79 · Instagram Story · Apr 18 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Open till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). High-energy Saturday crowd — packed and electric, the room at full tilt. Bold text. Countdown sticker.',
'2026-04-18');

-- ── POST 80 · TikTok Video · Apr 18 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust on a saturday is something you have to see in person. 710 n clark, river north, chicago. open till 5am.',
'',
'Best uncut Saturday footage — one continuous moment, raw audio, the room doing exactly what it does. The clip that makes someone feel like they missed something important. On-screen at the end: "STARDUST · EVERY SATURDAY · TILL 5AM"',
'Script: "stardust on a saturday is something you have to see in person."

0:00 · 18s — One uncut clip, no edits, raw audio: the room at full Saturday energy. Whoever is on the mic, the crowd doing exactly what it does. The shot that makes someone feel like they missed something important.
0:18 · 4s  — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~22s',
'2026-04-18');

-- ── POST 81 · Twitter/X Tweet · Apr 18 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday night karaoke at stardust. 710 n clark, river north. doors at 8, open till 5am.',
'', '', '2026-04-18');

-- ── POST 82 · Facebook Event · Apr 18 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

An incredible Saturday night in River North — the kind where you walk in planning to stay an hour and leave at 5am wondering where the time went. One mic, every song you know, and a room full of people who feel exactly the same way.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Packed crowd photo — high energy, the room completely full.',
'2026-04-18');

-- ── POST 83 · Instagram Feed Post · Apr 20 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The stage has been quiet since Saturday.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #karaokelife #312',
'Single strong image from the Apr 18 Saturday — crowd at peak energy or a performer mid-song. Portrait orientation. Let the weekend speak.',
'2026-04-20');

-- ── POST 84 · Twitter/X Tweet · Apr 20 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'big saturday at stardust. back thursday. 710 n clark, river north.',
'', '', '2026-04-20');

-- ── POST 85 · Instagram Story · Apr 23 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The mic is yours.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Pure karaoke — warm stage shot, mic in frame, intimate Thursday energy. Bold text. No Electro Swing mention.',
'2026-04-23');

-- ── POST 86 · Twitter/X Tweet · Apr 23 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. 710 n clark, river north. doors at 8, open till 4am.',
'', '', '2026-04-23');

-- ── POST 87 · Instagram Story · Apr 24 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight: karaoke.
Tomorrow: something different.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Friday night-of — stage lit, warm. The "tonight is great, and tomorrow is going to be something else" energy. Bold text. No full ES explanation.',
'2026-04-24');

-- ── POST 88 · Twitter/X Tweet · Apr 24 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'tomorrow night. electro swing at stardust. 710 n clark, river north. doors at 8.',
'', '', '2026-04-24');

-- ── POST 89 · Facebook Post · Apr 24 ────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Tomorrow night at Stardust Chicago — Electro Swing Night.

April 25. Caravan Palace. Parov Stelar. The jazz age meets the modern dancefloor in River North, open till 5am.

Doors 8pm · 710 N Clark St · River North · No cover',
'',
'Best art deco graphic from the Electro Swing campaign — warm amber, sharp geometry. Short, direct final call.',
'2026-04-24');

-- ── POST 90 · Instagram Story · Apr 25 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight. Electro Swing Night.

📍 710 N Clark · Doors 8pm · Open till 5am',
'',
'Story (9:16). Bold text over a warm, electric image — the room already alive. Countdown sticker to 8pm.',
'2026-04-25');

-- ── POST 91 · TikTok Video · Apr 25 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'electro swing night at stardust chicago. tonight. 710 n clark, river north. doors at 8.',
'',
'Open cold on audio — Caravan Palace or Parov Stelar, no intro. Show the room being set up: lights, bar, details. Quick cuts. On-screen: "TONIGHT · ELECTRO SWING NIGHT · STARDUST CHICAGO · 710 N CLARK"',
'Script: "electro swing night at stardust chicago. tonight."

0:00 · 2s — Cold open: Caravan Palace audio, no intro. Room still being set up.
0:02 · 2s — Lights being adjusted — warm amber filling the space
0:04 · 2s — Bar being stocked — bottles, glassware, the details
0:06 · 2s — Stage lit and ready — the space transformed
0:08 · 2s — A close art deco detail — something that signals the night
0:10 · 2s — On-screen: "TONIGHT"
0:12 · 4s — End card: ELECTRO SWING NIGHT · STARDUST CHICAGO · 710 N CLARK
Total: ~16s
Note: Caravan Palace or Parov Stelar audio runs uninterrupted throughout.',
'2026-04-25');

-- ── POST 92 · Facebook Event · Apr 25 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Electro Swing Night — Saturday, April 25 at Stardust Chicago

The night has arrived. Stardust Chicago presents its first-ever Electro Swing Night — an extraordinary evening where the energy of the 1920s meets the modern dancefloor in the heart of River North.

Think Caravan Palace. Think Parov Stelar. Think the most electric Saturday night of the spring.

Doors 8pm · Open till 5am · 710 N Clark St · River North
No cover · 21+',
'',
'Electro Swing Night Facebook Event. Best art deco graphic as cover image — warm, geometric, electric. This is the main event page.',
'2026-04-25');

-- ── POST 93 · Instagram Feed Post · Apr 27 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Saturday was extraordinary.

Thank you, River North.
📍 710 N Clark',
'#stardustchicago #electroswing #chicago #rivernorth #chicagonightlife #saturday',
'Best single image from Electro Swing Night — the room at peak energy. Portrait orientation. Warm and complete. One post, then we move on.',
'2026-04-27');

-- ── POST 94 · Twitter/X Tweet · Apr 27 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'electro swing night at stardust was something else. back to karaoke thursday.',
'', '', '2026-04-27');

-- ── POST 95 · Instagram Story · Apr 30 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The stage is live.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Back to karaoke — warm, intimate Thursday energy. Bold text. Countdown sticker. No Electro Swing reference.',
'2026-04-30');

-- ── POST 96 · Twitter/X Tweet · Apr 30 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. 710 n clark, river north. doors at 8, open till 4am.',
'', '', '2026-04-30');

-- ── POST 97 · Facebook Event · Apr 30 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Thursday is back at Stardust Chicago. Pick any song. Take the mic. The room fills up fast on Thursdays — and it always delivers.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar photo — the room in its karaoke element.',
'2026-04-30');

-- ── POST 98 · Instagram Story · May 1 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'First Friday of May.
Stardust. 8pm.

📍 710 N Clark · Open till 4am',
'',
'Story (9:16). Stage lit, mic in frame — the milestone of the month''s first Friday. Bold text. Countdown sticker.',
'2026-05-01');

-- ── POST 99 · TikTok Video · May 1 ──────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first friday of may at stardust chicago. 710 n clark, river north. karaoke till 4am.',
'',
'The room coming alive on the first Friday of May — fresh energy, people arriving ready for the month ahead. Quick cuts, real footage. On-screen: "STARDUST CHICAGO · FIRST FRIDAY OF MAY · TILL 4AM"',
'Script: "first friday of may at stardust chicago."

0:00 · 2s — Wide room, fresh Friday energy — the first of the month
0:02 · 2s — People arriving ready — coats off fast, drinks ordered immediately
0:04 · 2s — From back of crowd toward stage — the room building
0:06 · 2s — First singer of May at the mic — committing fully
0:08 · 2s — Bar busy — the whole room in motion
0:10 · 2s — Wide shot — a full room on the first Friday of May
0:12 · 4s — End card: STARDUST CHICAGO · FIRST FRIDAY OF MAY · TILL 4AM
Total: ~16s',
'2026-05-01');

-- ── POST 100 · Twitter/X Tweet · May 1 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'first friday of may at stardust. 710 n clark, river north. doors at 8, open till 4am.',
'', '', '2026-05-01');

-- ── POST 101 · Instagram Story · May 2 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'First Saturday of May.
Open till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Packed and electric Saturday crowd — first of the month energy. Bold text overlay.',
'2026-05-02');

-- ── POST 102 · Facebook Event · May 2 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — First Saturday of May at Stardust Chicago

The first Saturday of May arrives at Stardust Chicago. Late night karaoke in River North — the kind of room that takes care of you till 5am. Come for the song, stay for the night.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover image. Fresh May framing.',
'2026-05-02');

-- ── POST 103 · Instagram Feed Post · May 4 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Someone sang something last Saturday the room didn''t forget.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #karaokelife #312',
'Best image from the May 1–2 weekend — crowd or performer, a moment that carries weight. Portrait orientation.',
'2026-05-04');

-- ── POST 104 · Twitter/X Tweet · May 4 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'the room was packed all weekend. back thursday. stardust chicago, 710 n clark.',
'', '', '2026-05-04');

-- ── POST 105 · Instagram Story · May 7 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
You already know.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm Thursday bar atmosphere — intimate, familiar, the room that knows itself. Bold text. Countdown sticker.',
'2026-05-07');

-- ── POST 106 · Facebook Event · May 7 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

River North''s most reliable Thursday night. The mic is out, the room is warm, and whatever song has been living in your head all week — tonight is the night.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Intimate Thursday bar photo as cover image.',
'2026-05-07');

-- ── POST 107 · Instagram Story · May 8 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Doors 8pm. Till 4am.

📍 710 N Clark',
'',
'Story (9:16). The quiet confidence of a regular Friday — stage shot, warm light, mic waiting. Bold text. Countdown sticker.',
'2026-05-08');

-- ── POST 108 · Twitter/X Tweet · May 8 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke at stardust. 710 n clark, river north. doors at 8.',
'', '', '2026-05-08');

-- ── POST 109 · Instagram Story · May 9 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
The stage goes till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Saturday late-night energy — bold text, the room fully alive, the night still ahead. Countdown sticker.',
'2026-05-09');

-- ── POST 110 · TikTok Video · May 9 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday karaoke at stardust hits different when you stay till 5am. 710 n clark, river north, chicago.',
'',
'Late Saturday footage — the room deep into the night, past midnight, voices still strong. The "we stayed and it was worth it" feeling. On-screen: "STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM"',
'Script: "saturday karaoke at stardust hits different when you stay till 5am."

0:00 · 2s — Wide room deep into the night — past midnight, still packed
0:02 · 2s — Singer at mic — late in the night, voice still strong
0:04 · 2s — From back of crowd toward stage — the people who stayed, all of them
0:06 · 2s — Close on faces — that "we should leave but we''re not leaving" look
0:08 · 2s — Bar still going — 1am, 2am energy
0:10 · 2s — Someone absolutely losing it on a song — the late-night peak
0:12 · 2s — Wide room — the "we stayed and it was worth it" shot
0:14 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~18s',
'2026-05-09');

-- ── POST 111 · Twitter/X Tweet · May 9 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday karaoke at stardust. 710 n clark, river north. doors at 8, open till 5am.',
'', '', '2026-05-09');

END $$;
