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

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Three nights this week.
Thu · Fri · Sat · Doors 8pm

📍 710 N Clark · River North',
'',
'Story (9:16). Bold text over a warm crowd shot — the room mid-evening, tables full. Countdown sticker to Thursday.',
'2026-03-11', '16:00');

-- ── POST 02 · Twitter/X Tweet · Mar 11 · Score 3.0 · (010) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'three nights this week. thursday, friday, saturday. stardust chicago. 710 n clark.',
'', '', '2026-03-11', '08:00');

-- ── POST 04 · TikTok Video · Mar 12 · Score 3.2 · (020) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday karaoke at stardust. nobody comes here to be bad at it.',
'',
'Thursday energy — the room warming up, regulars and newcomers mixed. Quick cuts, raw footage. On-screen: "STARDUST · EVERY THURSDAY"',
'Script: "thursday karaoke at stardust. nobody comes here to be bad at it."

0:00 · 3s — Handheld POV walking through the door — the room opening up in front of you
0:03 · 2s — Someone studying the songbook, finger running down the list
0:05 · 2s — Regulars arriving — that specific nod of recognition
0:07 · 2s — First singer of the night steps up, no hesitation
0:09 · 2s — Crowd turning toward the stage — the room orienting itself
0:11 · 3s — Singer mid-song, eyes closed, meaning every word
0:14 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~18s',
'2026-03-12', '10:00');

-- ── POST 05 · Instagram Story · Mar 13 · Score 4.0 · (010) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The mic has been waiting all week.

📍 710 N Clark · Doors 8pm · Open till 4am',
'',
'Story (9:16). Close on the mic stand, warm stage wash, empty room — the anticipation before doors. Countdown sticker to 8pm.',
'2026-03-13', '16:00');

-- ── POST 06 · TikTok Video · Mar 13 · Score 4.0 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night starts at stardust. 710 n clark. open till 4am.',
'',
'The room going from quiet to alive — one continuous arc across a Friday night. On-screen: "STARDUST CHICAGO · EVERY FRIDAY".',
'Script: "friday night starts at stardust."

0:00 · 3s — Empty stage, one light on the mic. Room dead quiet.
0:03 · 2s — Cut: doors open, first people spilling in
0:05 · 2s — Bar starting to move — first round ordered
0:07 · 2s — Someone picks up the tablet, scrolls to their song
0:09 · 2s — First singer — nervous, good energy, crowd leaning in
0:11 · 3s — Room half-full now, volume already rising
0:14 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~18s',
'2026-03-13', '10:00');

-- ── POST 07 · Instagram Story · Mar 14 · Score 4.0 · (000) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday night. The one that goes till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story format (9:16). Bold text over a wide crowd shot — people mid-song, the room completely alive. Countdown sticker to 8pm.',
'2026-03-14', '16:00');

-- ── POST 09 · Instagram Feed Post · Mar 16 · Score 3.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The weekend happened. The songs are still stuck in our heads.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #karaokenight #312 #thingstodoinchicago',
'Single strong image — the room at full Saturday energy, crowd deep in it. Portrait orientation.',
'2026-03-16', '11:00');

-- ── POST 10 · TikTok Video · Mar 16 · Score 3.0 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'some people come for one song. most of them stay till 2. back thursday.',
'',
'Best uncut moment from the weekend — one clip, raw sound, no edits. The kind of thing that makes someone feel like they missed something. On-screen at the end: "STARDUST · THU FRI SAT".',
'Script: (no spoken words — let the clip do the work)

0:00 · 20s — One uncut clip: a singer mid-song, the crowd completely in it. No edits. Raw audio. The room at the exact moment everything is working.
0:20 · 3s  — End card: STARDUST · THU FRI SAT · 710 N CLARK
Total: ~23s
Note: Pattern A. Choose the clip that needs no explanation.',
'2026-03-16', '10:00');

-- ── POST 11 · Instagram Feed Post · Mar 18 · Score 3.0 · (010) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The stage has been quiet for two days.

Not for long.

Thu · Fri · Sat · Doors 8pm · 710 N Clark',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #wednesday #thingstodoinchicago #chicagobar #karaokelife',
'The mic stand, empty and lit. Nothing else in frame. Let the stillness do the work. Portrait orientation.',
'2026-03-18', '11:00');

-- ── POST 12 · Twitter/X Tweet · Mar 18 · Score 3.0 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday at stardust. tomorrow night. doors at 8. 710 n clark.',
'', '', '2026-03-18', '08:00');

-- ── POST 13 · Instagram Story · Mar 19 · Score 3.0 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'It''s Thursday.
The list is already filling up.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm stage light, mic in frame. The Thursday regulars energy — not hype, just certainty.',
'2026-03-19', '16:00');

-- ── POST 17 · Facebook Post · Mar 20 · Score 3.0 · (020) ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

No setlist. No theme. No wrong songs.

Whatever''s been playing on repeat in your head this week — tonight is the room to sing it in.

710 N Clark · River North · Doors 8pm · Open till 4am · Free to sing',
'',
'3–5 candid shots from a previous Friday night — different singers, different moments, all of them real.',
'2026-03-20', '13:00');

-- ── POST 19 · Facebook Event · Mar 21 · Score 3.0 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Saturday at Stardust Chicago

River North. Saturday night. Open mic, no cover, open till 5am.

One mic. A room full of people who came to actually sing.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Wide crowd shot as cover — the room deep into the night, packed.',
'2026-03-21', '13:00');

-- ── POST 20 · Instagram Feed Post · Mar 23 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'River North, Saturday night.

📍 710 N Clark',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #312 #karaokelife #chicago',
'The strongest single frame from the weekend — the photo that needs no caption. Portrait orientation.',
'2026-03-23', '11:00');

-- ── POST 21 · Twitter/X Tweet · Mar 23 · Score 4.0 · (010) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'full room all weekend at stardust. back thursday. 710 n clark.',
'', '', '2026-03-23', '08:00');

-- ── POST 22 · Instagram Feed Post · Mar 25 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing early mood tease — ATMOSPHERE ONLY. Single image: something warm and slightly out of time. A texture, a shadow, a geometry. No people. No genre. No event info. The ornament is the only caption.',
'2026-03-25', '11:00');

-- ── POST 23 · Twitter/X Tweet · Mar 25 · Score 3.5 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'something is taking shape at stardust. more soon.',
'', '', '2026-03-25', '08:00');

-- ── POST 24 · Instagram Story · Mar 26 · Score 3.3 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The mic is waiting.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm, intimate Thursday atmosphere — the bar settling in for the night, the room before it peaks. Bold text, clean.',
'2026-03-26', '16:00');

-- ── POST 25 · Instagram Reel · Mar 27 · Score 3.5 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Friday of March.

📍 710 N Clark · River North · Doors 8pm',
'#stardustchicago #karaoke #karaokenight #friday #chicagonightlife #rivernorth #chicagobar #312 #thingstodoinchicago',
'Quick cuts as the room fills up. The last Friday of March deserves a sendoff. On-screen: "LAST FRIDAY OF MARCH · STARDUST CHICAGO"',
'Script: "last friday of march."

0:00 · 2s — Bar still quiet, stools half-full, the early window
0:02 · 2s — First wave of people through the door, energy arriving
0:04 · 2s — Someone grabs the mic — the night starts for real
0:06 · 2s — Crowd turning, voices joining
0:08 · 3s — Wide shot — the room doing what it does on a Friday
0:11 · 2s — Close on a face mid-song — absolutely in it
0:13 · 4s — End card: LAST FRIDAY OF MARCH · STARDUST CHICAGO · 710 N CLARK
Total: ~17s',
'2026-03-27', '11:00');

-- ── POST 26 · TikTok Video · Mar 27 · Score 3.1 · (010) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'what stardust looks like before the doors open. 710 n clark.',
'',
'Behind-the-scenes before doors — mics checked, lights up, bar set. Unhurried. The quiet before the room fills. On-screen: "getting stardust ready for tonight".',
'Script: "what stardust looks like before doors."

0:00 · 3s — Empty room, house lights still up — the space in its before state
0:03 · 2s — Mic being handled — checked, adjusted, placed
0:05 · 2s — Stage lights switching from white to warm wash
0:07 · 2s — Bottles lined up, bar set
0:09 · 2s — QR cards placed on tables — small, deliberate
0:11 · 2s — Final look at the room — doors about to open
0:13 · 4s — End card: STARDUST CHICAGO · TONIGHT · 710 N CLARK
Total: ~17s
Note: Pattern C (empty → ready). No music needed — room tone.',
'2026-03-27', '10:00');

-- ── POST 27 · Instagram Story · Mar 28 · Score 4.0 · (000) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Last Saturday of March.

📍 710 N Clark · Doors 8pm · Open till 5am',
'',
'Story (9:16). The room at peak Saturday — crowd shot, warm and loud. Countdown sticker to doors.',
'2026-03-28', '16:00');

-- ── POST 29 · Instagram Feed Post · Mar 30 · Score 4.0 · (020) ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'March closed the way it should.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #weekendrecap #312 #karaokelife',
'End-of-month — the best single frame from March 28. Something that feels like a proper closing shot.',
'2026-03-30', '11:00');

-- ── POST 30 · Instagram Feed Post · Apr 2 · Score 4.0 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing Week 1 teaser — MOOD ONLY. Different image from Mar 25. If that was wide and atmospheric, this should be a close detail: a texture, a shape, something slightly wrong for the current era. No people. No genre. No explanation.',
'2026-04-02', '11:00');

-- ── POST 31 · TikTok Video · Apr 2 · Score 4.0 · (010) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust chicago',
'',
'Atmosphere-only teaser. A different angle from any previous video — slow, close, unhurried. 10 seconds. Ambient audio only. No text except the logo at the end.',
'Script: (no spoken words — ambient audio only)

0:00 · 4s — Extreme close-up: a candle flame, nothing moving, warm and still
0:04 · 3s — Bar top in low light — a glass, a reflection, the grain of the wood
0:07 · 2s — Stage in near-darkness — one practical light catching the mic stand
0:09 · 2s — Slow fade to black
0:11 · 3s — End card: STARDUST CHICAGO (logo only)
Total: ~14s
Note: Pattern E. No music. No voice. Room tone only.',
'2026-04-02', '10:00');

-- ── POST 32 · Instagram Story · Apr 3 · Score 3.4 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Doors are open.

📍 710 N Clark · Till 4am',
'',
'Story (9:16). Room already alive — stage lit, people filling in. Bold text. Countdown or poll sticker.',
'2026-04-03', '16:00');

-- ── POST 33 · TikTok Video · Apr 3 · Score 3.4 · (020) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday at stardust. the room fills up faster than you think. 710 n clark.',
'',
'The room filling — quick cuts, phone footage, real energy. The arrival arc on a Friday. On-screen: "STARDUST CHICAGO · OPEN TONIGHT"',
'Script: "friday at stardust. the room fills up faster than you think."

0:00 · 2s — Wide room, mostly empty — the early window
0:02 · 2s — People arriving in a wave, the energy shifting
0:04 · 2s — Bar three-deep, the night accelerating
0:06 · 2s — Someone mid-song already, crowd pulling toward the stage
0:08 · 2s — A face singing along — not the performer, just someone in the crowd
0:10 · 2s — Wide shot — the room halfway there and climbing
0:12 · 4s — End card: STARDUST CHICAGO · OPEN TONIGHT · 710 N CLARK
Total: ~16s',
'2026-04-03', '10:00');

-- ── POST 34 · Facebook Event · Apr 3 · Score 3.0 · (020) ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

The one where you stop waiting for the right night and just go.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Friday Facebook Event. Warm performer or crowd photo as cover image.',
'2026-04-03', '13:00');

-- ── POST 35 · Instagram Feed Post · Apr 4 · Score 3.5 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Something is arriving at Stardust.

📍 710 N Clark · River North',
'#stardustchicago #stardust #chicago #rivernorth #comingsoon',
'Electro Swing Week 1 continuation. A different detail from previous teasers — art deco geometry, a vintage texture, something out of its era. No people. No genre named. The mystery continues.',
'2026-04-04', '11:00');

-- ── POST 37 · Instagram Feed Post · Apr 6 · Score 3.0 · (010) ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Another weekend that closed well.

See you Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #weekendrecap #chicagobar #312',
'Best image from the Apr 3–4 weekend. Crowd energy preferred — the room at its most alive.',
'2026-04-06', '11:00');

-- ── POST 38 · Instagram Reel · Apr 8 · Score 3.65 · (020) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The swing era never ended.
It just got louder.

Coming soon to Stardust Chicago.
📍 710 N Clark · River North',
'#stardustchicago #electroswing #caravanpalace #parovstelar #chicago #rivernorth #chicagonightlife #vintagestyle #jazzvibes #speakeasy #electrojazz',
'Genre reveal. Drop straight into Caravan Palace or Parov Stelar — the 15 seconds that hits hardest, no intro. Art deco visuals, warm amber throughout. On-screen copy builds slowly.',
'Script: "The swing era never ended. It just got louder."

0:00 · 3s — Cold open: music hits first. No title card. Warm amber, a single art deco image.
0:03 · 2s — A vintage detail — 1920s geometry, sharp and warm
0:05 · 2s — On-screen: "imagine jazz."
0:07 · 2s — On-screen: "but it makes you move."
0:09 · 2s — Wider art deco image — the full aesthetic, unhurried
0:11 · 2s — On-screen: "electro swing"
0:13 · 4s — End card: COMING SOON · STARDUST CHICAGO · 710 N CLARK
Total: ~17s
Note: Audio must be Caravan Palace or Parov Stelar — let the strongest 17 seconds play uncut.',
'2026-04-08', '11:00');

-- ── POST 39 · TikTok Video · Apr 8 · Score 5.0 · (010) ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the swing era never ended. it just got louder. coming to stardust chicago.',
'',
'Cold open on audio — no title card, just the music. Let it play three full seconds before any text appears. The reveal lands without warning.',
'Script: "the swing era never ended. it just got louder."

0:00 · 3s — Cold open: Caravan Palace drops. No title. Nothing but the music and a warm amber image.
0:03 · 2s — On-screen: "imagine jazz."
0:05 · 2s — On-screen: "but it grooves like house."
0:07 · 3s — Art deco visual — warm amber, sharp geometry
0:10 · 2s — On-screen: "electro swing is coming to stardust chicago."
0:12 · 4s — End card: STARDUST CHICAGO (logo)
Total: ~16s
Note: Audio runs uninterrupted. Do not cut the music.',
'2026-04-08', '10:00');

-- ── POST 40 · Facebook Post · Apr 8 · Score 3.8 · (020) ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Something new is arriving at Stardust Chicago — and it sounds like nothing else in River North right now.

It''s called electro swing. The energy of the jazz age, rebuilt for tonight''s dancefloor. Think Caravan Palace. Think Parov Stelar. Think the sound that makes you want to move before you know why.

Coming soon. 710 N Clark · River North · stardustchi.com',
'',
'Art-deco inspired graphic or atmospheric photo. Link to "Lone Digger" by Caravan Palace on YouTube in the post.',
'2026-04-08', '13:00');

-- ── POST 41 · Twitter/X Tweet · Apr 8 · Score 3.7 · (020) ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'the swing era never ended. it just got louder. electro swing is coming to stardust. 710 n clark.',
'', '', '2026-04-08', '08:00');

-- ── POST 42 · Instagram Story · Apr 9 · Score 4.0 · (010) ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The room is ready.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm bar detail or close stage shot — the intimate Thursday feeling, not the Saturday energy. Bold text.',
'2026-04-09', '16:00');

-- ── POST 43 · Instagram Story · Apr 10 · Score 3.75 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The weekend opens tonight.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Stage lit, crowd already building — the Friday arrival energy. Bold text overlay.',
'2026-04-10', '16:00');

-- ── POST 44 · Facebook Event · Apr 10 · Score 3.55 · (020) ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

River North. Late night. The mic is open and the list has room for one more name.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Friday Facebook Event. High-energy crowd or performer photo as cover image.',
'2026-04-10', '13:00');

-- ── POST 45 · Twitter/X Tweet · Mar 13 · Friday night-of ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday at stardust. the room fills up fast. somewhere around midnight things get interesting. 710 n clark.',
'', '', '2026-03-13', '08:00');

-- ── POST 46 · Twitter/X Tweet · Mar 14 · Saturday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday at stardust. open till 5am. 710 n clark, river north.',
'', '', '2026-03-14', '08:00');

-- ── POST 47 · Facebook Event · Mar 14 · Saturday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

Saturday night in River North belongs to whoever shows up and takes the mic.

One room. No setlist. A crowd that came to actually listen. Whatever you''ve been holding back — tonight is the night.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. The room mid-performance as cover — wide, loud, real.',
'2026-03-14', '13:00');

-- ── POST 48 · Facebook Post · Mar 16 · Weekend recap ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Three nights at Stardust. Hundreds of songs. The room delivered every time.

Thursday through Saturday — packed, loud, and full of people who showed up ready. The kind of weekend that makes you want to put the next one in your calendar right now.

Back Thursday. 710 N Clark · River North · Doors 8pm',
'',
'Best photo from the weekend — a performer mid-song or a crowd shot that captures the room at its best. Warm and candid.',
'2026-03-16', '13:00');

-- ── POST 49 · Twitter/X Tweet · Mar 19 · Thursday promo ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday at stardust. the week''s best hours are still ahead. 710 n clark.',
'', '', '2026-03-19', '08:00');

-- ── POST 50 · Facebook Event · Mar 19 · Thursday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Thursday night at Stardust. Put your name on the list and let the room take it from there.

The best part of the week starts at 8pm.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar atmosphere as cover — intimate over hype.',
'2026-03-19', '13:00');

-- ── POST 51 · Twitter/X Tweet · Mar 26 · Thursday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke is going at stardust. list is growing. 710 n clark.',
'', '', '2026-03-26', '08:00');

-- ── POST 52 · Facebook Event · Mar 26 · Thursday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Second-to-last Thursday of March. The room has been remarkable every week — tonight is no different.

Put your name on the list. Sing the one you''ve been saving.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar photo — intimacy over energy for the Thursday feel.',
'2026-03-26', '13:00');

-- ── POST 53 · Twitter/X Tweet · Mar 28 · Saturday night-of ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'last saturday of march at stardust. room''s incredible tonight. open till 5am. 710 n clark.',
'', '', '2026-03-28', '08:00');

-- ── POST 54 · Facebook Post · Mar 28 · Last Saturday of March ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Last Saturday of March — Tonight at Stardust Chicago

March has been a good month. Full rooms, late nights, and performances that made people stay well past when they planned to leave.

Tonight is the closing chapter. Come put your name on the list and give March the send-off it deserves.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Something that reads as a finale — crowd shot or wide room, the room in full swing. Not just another Saturday photo.',
'2026-03-28', '13:00');

-- ── POST 55 · Instagram Carousel · Mar 30 · March recap ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'March at Stardust.

Nine nights. The room showed up every time.

April is next.

📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #312 #chicago #karaokelife',
'5–7 slide carousel. Best moments from March — crowd shots, performers, close bar details. Warm and candid throughout. Last slide: "April." with the Stardust logo.',
'2026-03-30', '11:00');

-- ── POST 56 · Facebook Event · Apr 2 · Thursday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

First Thursday of April. New month, same room that keeps delivering.

There''s also something new on the horizon at Stardust — stay tuned for what''s arriving later this month.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar detail or stage shot as cover.',
'2026-04-02', '13:00');

-- ── POST 57 · Twitter/X Tweet · Apr 4 · Saturday + teaser ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday karaoke at stardust. also: something new is coming to river north this month. 710 n clark.',
'', '', '2026-04-04', '08:00');

-- ── POST 58 · Facebook Event · Apr 4 · Saturday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

April is here, and Saturday night in River North starts at 710 N Clark.

Come in, put your name on the list, sing the one you''ve been rehearsing in your head.

Also: watch this space — something is arriving at Stardust later this month.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover.',
'2026-04-04', '13:00');

-- ── POST 59 · Twitter/X Tweet · Apr 6 · Weekend recap ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'good weekend at stardust. back thursday. 710 n clark.',
'', '', '2026-04-06', '08:00');

-- ── POST 60 · Facebook Post · Apr 6 · Weekend recap ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'April started exactly the way it should at Stardust Chicago.

Thursday and Saturday — the room packed, the singing loud, and the crowd staying well past when they planned to leave.

Back Thursday. And if you''ve been watching this week''s posts — yes, something is arriving at Stardust very soon. Details coming.

710 N Clark · River North',
'',
'Best image from the Apr 3–4 weekend — crowd or standout performer. Warm and real.',
'2026-04-06', '13:00');

-- ── POST 61 · Twitter/X Thread · Apr 8 · Electro Swing reveal ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Thread', 'draft',
'thread: what is electro swing, and why is it coming to stardust?

1/ electro swing is exactly what it sounds like: jazz-age energy rebuilt for a modern dancefloor. think caravan palace. think parov stelar. think the song that makes you move before you know what it is.

2/ we''ve been building something at stardust for a while. the room, the late nights, the crowd that keeps showing up and surprising us. it was always going to lead somewhere like this.

3/ electro swing night is coming to 710 n clark, river north, chicago. late april. the date drops this week.',
'', '', '2026-04-08', '08:00');

-- ── POST 62 · Instagram Carousel · Apr 8 · Electro Swing reveal ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'The swing era never ended.
It just got louder.

Electro swing is coming to Stardust Chicago.

📍 710 N Clark · River North',
'#stardustchicago #electroswing #caravanpalace #parovstelar #chicago #rivernorth #chicagonightlife #jazzvibes #speakeasy #electrojazz',
'5-slide carousel reveal. Slide 1: art deco atmospheric still, title card. Slide 2: "The jazz age had the best energy." Slide 3: "Someone rebuilt it for a modern dancefloor." Slide 4: "It''s called electro swing." Slide 5: Stardust logo + "Coming soon · 710 N Clark · River North". Warm amber and black throughout.',
'2026-04-08', '11:00');

-- ── POST 63 · Twitter/X Tweet · Apr 9 · Thursday night-of ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday at stardust. room is warm, the list is already moving. 710 n clark.',
'', '', '2026-04-09', '08:00');

-- ── POST 64 · Facebook Event · Apr 9 · Thursday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

The list fills up fast on Thursdays. The room gets loud. Something about this night makes people perform like they actually mean it.

Come early. Stay late.

Also: electro swing is arriving at Stardust very soon. Details this week.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm, intimate bar photo as cover.',
'2026-04-09', '13:00');

-- ── POST 65 · Twitter/X Tweet · Apr 10 · Friday night-of ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday at stardust. karaoke tonight, electro swing next week. 710 n clark. open till 4am.',
'', '', '2026-04-10', '08:00');

-- ════════════════════════════════════════════════════════════════════════════
-- BATCH 100 — Apr 11 – May 10, 2026 (karaoke-first, ES featured not centered)
-- ════════════════════════════════════════════════════════════════════════════

-- ── POST 66 · Instagram Story · Apr 11 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Open till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). The room deep into a Saturday night — crowd at peak, lights up, energy fully built. Bold text. Countdown sticker.',
'2026-04-11', '16:00');

-- ── POST 67 · TikTok Video · Apr 11 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust on a saturday goes till 5am. 710 n clark, river north.',
'',
'Raw Saturday footage — the room wall-to-wall, different voices, different songs. The unedited version of a great night. On-screen: "STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM"',
'Script: "stardust on a saturday goes till 5am."

0:00 · 2s — Wide room: every table full, wall-to-wall people
0:02 · 2s — Singer mid-song — voice strong, crowd turning toward them
0:04 · 2s — From the back looking toward the stage — a sea of people
0:06 · 2s — Close on faces in the crowd — three people mid-singalong
0:08 · 2s — Different singer — completely different song, same energy
0:10 · 2s — Bar three-deep — drinks in every hand
0:12 · 2s — Wide again — the room at its best
0:14 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~18s',
'2026-04-11', '10:00');

-- ── POST 68 · Twitter/X Tweet · Apr 11 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday at stardust. 710 n clark, river north. doors at 8, open till 5am.',
'', '', '2026-04-11', '08:00');

-- ── POST 69 · Facebook Event · Apr 11 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

The kind of Saturday night that stretches to 5am and still feels like it ended too soon. A room full of songs you know, people you don''t, and one mic that goes to whoever wants it next.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Packed crowd photo as cover — the room at full energy.',
'2026-04-11', '13:00');

-- ── POST 70 · Instagram Feed Post · Apr 13 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'✦',
'#stardustchicago #stardust #chicago #rivernorth',
'Electro Swing mood reveal — one image, no copy beyond the ornament. Something warm, slightly vintage. A detail that doesn''t belong to now. No genre, no date, no explanation. Let the image work on its own.',
'2026-04-13', '11:00');

-- ── POST 71 · Twitter/X Tweet · Apr 14 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'april 25. stardust. electro swing night.',
'', '', '2026-04-14', '08:00');

-- ── POST 72 · Facebook Post · Apr 14 ────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'On Saturday, April 25, Stardust Chicago presents its first-ever Electro Swing Night.

The energy of a 1920s speakeasy, rebuilt for tonight''s dancefloor. Think Caravan Palace. Think Parov Stelar. Think the sound you didn''t know you were missing, played loud in a room that knows how to hold a late night.

One night. One sound. River North.

710 N Clark St · Doors 8pm · Open till 5am · No cover',
'',
'Art deco inspired graphic — warm amber tones, geometric shapes. Formal announcement, feels like a proper reveal.',
'2026-04-14', '13:00');

-- ── POST 73 · Instagram Story · Apr 16 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The room is warmed up.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm, intimate Thursday atmosphere — bar and stage, the room settling in for the night. Bold text. Countdown sticker.',
'2026-04-16', '16:00');

-- ── POST 74 · Twitter/X Tweet · Apr 16 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. doors at 8. 710 n clark.',
'', '', '2026-04-16', '08:00');

-- ── POST 75 · Facebook Event · Apr 16 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

River North''s best Thursday night. Pick a song. Take the mic. The room is ready for whatever you''ve been carrying around all week.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar or performer photo as cover image.',
'2026-04-16', '13:00');

-- ── POST 76 · Instagram Story · Apr 17 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Open tonight till 4am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Stage lit, mic in frame — the moment before the room fills. Bold text overlay. Countdown sticker to 8pm.',
'2026-04-17', '16:00');

-- ── POST 77 · TikTok Video · Apr 17 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday at stardust chicago. 710 n clark. open till 4am.',
'',
'The arc of a Friday night at stardust — quiet to loud in under 20 seconds. On-screen: "STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM"',
'Script: "friday at stardust chicago."

0:00 · 3s — Stage lit, empty room — one light on the mic stand
0:03 · 2s — Doors open: first people, still in their coats
0:05 · 2s — First drinks ordered, bar coming to life
0:07 · 2s — Someone scanning the songbook, finger hovering
0:09 · 2s — First singer — nervous energy, crowd orienting
0:11 · 3s — Room half-full, voices overlapping
0:14 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~18s
Note: Pattern G — handheld, moves through the space.',
'2026-04-17', '10:00');

-- ── POST 78 · Twitter/X Tweet · Apr 17 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday night. stardust. karaoke till 4am. 710 n clark.',
'', '', '2026-04-17', '08:00');

-- ── POST 79 · Instagram Story · Apr 18 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
The night that goes till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Saturday crowd at full tilt — the room completely alive, bold text over it. Countdown sticker.',
'2026-04-18', '16:00');

-- ── POST 80 · TikTok Video · Apr 18 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'there''s always one person who owns the room. tonight it was three of them. stardust chicago.',
'',
'One uncut Saturday moment — the clip that makes someone feel like they were there, or wish they had been. Raw audio, no edits. On-screen at the end only.',
'Script: (no spoken words — clip does the work)

0:00 · 20s — One uncut clip: a singer mid-performance, the crowd completely in it. Raw audio. Saturday energy. The camera holds still. No edits.
0:20 · 4s  — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~24s
Note: Pattern A. Choose the single clip where the room and the singer are both at their peak.',
'2026-04-18', '10:00');

-- ── POST 81 · Twitter/X Tweet · Apr 18 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday night karaoke at stardust. open till 5am. 710 n clark, river north.',
'', '', '2026-04-18', '08:00');

-- ── POST 82 · Facebook Event · Apr 18 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

You walk in planning to stay for one song. You leave at 5am wondering where the night went.

One mic. A room full of people who felt the same way.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Packed crowd — the room at full capacity.',
'2026-04-18', '13:00');

-- ── POST 83 · Instagram Feed Post · Apr 20 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'The stage has been quiet since Saturday.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #weekendrecap #312 #chicago',
'Single strong image from the Apr 18 Saturday — performer or crowd at peak. Portrait orientation.',
'2026-04-20', '11:00');

-- ── POST 84 · Twitter/X Tweet · Apr 20 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday at stardust was a good one. back thursday. 710 n clark.',
'', '', '2026-04-20', '08:00');

-- ── POST 85 · Instagram Story · Apr 23 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
Mic''s yours.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm stage shot, mic close, the intimate Thursday feeling. Bold text. No Electro Swing mention.',
'2026-04-23', '16:00');

-- ── POST 86 · Twitter/X Tweet · Apr 23 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. 710 n clark. doors at 8, open till 4am.',
'', '', '2026-04-23', '08:00');

-- ── POST 87 · Instagram Story · Apr 24 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight: karaoke.
Tomorrow: something entirely different.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Friday night-of — stage lit, the room warm. The "tonight is great, tomorrow is something else" energy. Bold text. No full ES explanation.',
'2026-04-24', '16:00');

-- ── POST 88 · Twitter/X Tweet · Apr 24 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'electro swing night at stardust is tomorrow. 710 n clark. doors at 8.',
'', '', '2026-04-24', '08:00');

-- ── POST 89 · Facebook Post · Apr 24 ────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Tomorrow night at Stardust Chicago — Electro Swing Night.

April 25. Caravan Palace. Parov Stelar. The jazz age meets the modern dancefloor in River North, open till 5am.

This is the one.

Doors 8pm · 710 N Clark St · River North · No cover',
'',
'Best art deco graphic from the campaign — warm amber, sharp geometry. Short and direct.',
'2026-04-24', '13:00');

-- ── POST 90 · Instagram Story · Apr 25 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight. Electro Swing Night at Stardust.

📍 710 N Clark · Doors 8pm · Open till 5am',
'',
'Story (9:16). Bold text over a warm, electric image — the room dressed for the night. Countdown sticker to 8pm.',
'2026-04-25', '16:00');

-- ── POST 91 · TikTok Video · Apr 25 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'electro swing night at stardust. tonight. 710 n clark.',
'',
'Cold open on audio — no intro, just the music. The room being set up, dressed for a different kind of night. Quick cuts. On-screen: "TONIGHT · ELECTRO SWING NIGHT · STARDUST CHICAGO"',
'Script: "electro swing night at stardust. tonight."

0:00 · 2s — Caravan Palace drops — no title card, just the music and the room
0:02 · 2s — Warm amber light fills the space as the rig warms up
0:04 · 2s — Bar being set: bottles, glassware, the art deco details
0:06 · 2s — Stage lit and dressed — transformed from any other night
0:08 · 2s — A close detail that signals the night: a glass, a geometric prop
0:10 · 2s — On-screen: "TONIGHT"
0:12 · 4s — End card: ELECTRO SWING NIGHT · STARDUST CHICAGO · 710 N CLARK
Total: ~16s
Note: Caravan Palace or Parov Stelar audio runs uninterrupted throughout.',
'2026-04-25', '10:00');

-- ── POST 92 · Facebook Event · Apr 25 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Electro Swing Night — Saturday, April 25 at Stardust Chicago

Tonight is the night. Stardust Chicago''s first-ever Electro Swing Night — the energy of the 1920s rebuilt for a modern dancefloor in the heart of River North.

Caravan Palace. Parov Stelar. A room you won''t forget. Open till 5am.

Doors 8pm · Open till 5am · 710 N Clark St · River North
No cover · 21+',
'',
'Electro Swing Night Facebook Event. Best art deco graphic as cover — warm, geometric, electric.',
'2026-04-25', '13:00');

-- ── POST 93 · Instagram Feed Post · Apr 27 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Saturday was a different kind of night.

Thank you, River North.
710 N Clark',
'#stardustchicago #electroswing #chicago #rivernorth #chicagonightlife #saturday #caravanpalace',
'Best single image from Electro Swing Night — the room at peak energy. Portrait orientation. Warm, complete. One post, then we move on.',
'2026-04-27', '11:00');

-- ── POST 94 · Twitter/X Tweet · Apr 27 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'electro swing night at stardust was something. back to karaoke thursday. 710 n clark.',
'', '', '2026-04-27', '08:00');

-- ── POST 95 · Instagram Story · Apr 30 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
Back to the mic.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Back to karaoke — warm, intimate Thursday energy. Bold text. Countdown sticker. No Electro Swing reference.',
'2026-04-30', '16:00');

-- ── POST 96 · Twitter/X Tweet · Apr 30 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'thursday karaoke at stardust. 710 n clark. doors at 8, open till 4am.',
'', '', '2026-04-30', '08:00');

-- ── POST 97 · Facebook Event · Apr 30 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

Thursday is back. Pick any song. Take the mic. The room fills up fast on Thursdays — and it always delivers.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Warm bar photo — the room in its karaoke element.',
'2026-04-30', '13:00');

-- ── POST 98 · Instagram Story · May 1 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'First Friday of May.
Stardust. 8pm.

📍 710 N Clark · Open till 4am',
'',
'Story (9:16). Stage lit, mic in frame — the first Friday of the month, ready. Bold text. Countdown sticker.',
'2026-05-01', '16:00');

-- ── POST 99 · TikTok Video · May 1 ──────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first friday of may at stardust chicago. 710 n clark. karaoke till 4am.',
'',
'First Friday of May — the room with that fresh-start energy. Quick cuts, real footage. On-screen: "STARDUST CHICAGO · FIRST FRIDAY OF MAY · TILL 4AM"',
'Script: "first friday of may at stardust chicago."

0:00 · 2s — Wide room, early Friday energy — the month starting fresh
0:02 · 2s — People arriving, coats still on, already looking for seats
0:04 · 2s — Bar coming to life — first round of May
0:06 · 2s — First singer steps up — the month''s first voice on the mic
0:08 · 2s — Crowd starting to turn, the room orienting
0:10 · 2s — Wide shot — a full room on the first Friday of May
0:12 · 4s — End card: STARDUST CHICAGO · FIRST FRIDAY OF MAY · TILL 4AM
Total: ~16s',
'2026-05-01', '10:00');

-- ── POST 100 · Twitter/X Tweet · May 1 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'first friday of may at stardust. 710 n clark. doors at 8, open till 4am.',
'', '', '2026-05-01', '08:00');

-- ── POST 101 · Instagram Story · May 2 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'First Saturday of May.
Open till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). The first Saturday of May — packed and electric, that fresh-month energy. Bold text overlay.',
'2026-05-02', '16:00');

-- ── POST 102 · Facebook Event · May 2 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — First Saturday of May at Stardust Chicago

May opens at Stardust Chicago. Late-night karaoke in River North — the kind of room that takes care of you till 5am.

Come for the song. Stay for the night.

Doors 8pm · Open till 5am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd photo as cover — fresh May framing.',
'2026-05-02', '13:00');

-- ── POST 103 · Instagram Feed Post · May 4 ───────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Feed Post', 'draft',
'Someone sang something last Saturday that the room didn''t forget.

Back Thursday.
📍 710 N Clark · River North',
'#stardustchicago #karaoke #chicagonightlife #rivernorth #chicagobar #312 #karaokenight #weekendrecap',
'Best image from the May 1–2 weekend — a moment with weight. Portrait orientation.',
'2026-05-04', '11:00');

-- ── POST 104 · Twitter/X Tweet · May 4 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'good weekend at stardust. back thursday. 710 n clark.',
'', '', '2026-05-04', '08:00');

-- ── POST 105 · Instagram Story · May 7 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday at Stardust.
The room knows the drill.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Warm Thursday bar atmosphere — the room that knows itself. Bold text. Countdown sticker.',
'2026-05-07', '16:00');

-- ── POST 106 · Facebook Event · May 7 ───────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Thursday at Stardust Chicago

River North''s most consistent Thursday night. The mic is out, the room is warm, and whatever song has been living in your head all week — tonight is the night for it.

Doors 8pm · Open till 4am · 710 N Clark St · River North
Free to sing · No cover',
'',
'Recurring Thursday Facebook Event. Intimate Thursday bar photo as cover.',
'2026-05-07', '13:00');

-- ── POST 107 · Instagram Story · May 8 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Doors 8pm. Till 4am.

📍 710 N Clark',
'',
'Story (9:16). The quiet confidence of a Friday that knows what it is — stage shot, warm light, mic waiting. Bold text. Countdown sticker.',
'2026-05-08', '16:00');

-- ── POST 108 · Twitter/X Tweet · May 8 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke at stardust. 710 n clark. doors at 8.',
'', '', '2026-05-08', '08:00');

-- ── POST 109 · Instagram Story · May 9 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
We go till 5am.

📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Saturday late-night energy — bold text, the room fully alive, the night wide open. Countdown sticker.',
'2026-05-09', '16:00');

-- ── POST 110 · TikTok Video · May 9 ─────────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the 2am crowd at stardust is a different religion. 710 n clark, river north.',
'',
'Late Saturday footage — the room past midnight, the people who stayed. The feeling of a night that delivered. On-screen: "STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM"',
'Script: "the 2am crowd at stardust is a different religion."

0:00 · 3s — Wide room deep into the night — past midnight, still full, somehow louder
0:03 · 2s — Singer at the mic — late-night voice, the room completely with them
0:05 · 2s — Faces in the crowd: the people who stayed, all of them glad they did
0:07 · 2s — Close on two people singing along — not even pretending not to
0:09 · 2s — Bar still moving — 2am energy, no one checking their phone
0:11 · 2s — Someone in the crowd absolutely losing it on a chorus
0:13 · 2s — Wide room — the "we stayed and it was worth it" shot
0:15 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~19s
Note: Pattern H — late night only. This is the 1am/2am crowd.',
'2026-05-09', '10:00');

-- ── POST 111 · Twitter/X Tweet · May 9 ──────────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday karaoke at stardust. 710 n clark, river north. open till 5am.',
'', '', '2026-05-09', '08:00');

END $$;
