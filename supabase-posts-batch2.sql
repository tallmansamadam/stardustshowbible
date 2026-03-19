-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Social Posts Batch 2
-- Date range: May 11 – June 14, 2026
-- Reel-heavy. Every Video/Reel/Stitch post includes a full video_script.
-- All posts include post_time based on platform best practices.
-- Run AFTER supabase-posts-seed.sql (does NOT delete existing posts).
--
-- BEFORE RUNNING: Replace 'YOUR_USER_ID_HERE' with your actual Supabase user ID.
-- Find it in: Supabase → Authentication → Users → click your email → copy User UID
-- ─────────────────────────────────────────────────────────────────────────────

DO $$
DECLARE
  uid uuid := 'YOUR_USER_ID_HERE';
BEGIN

-- ── POST 111 · Instagram Reel · May 11 · Week preview ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Three nights this week. Same room. Different energy every time.

Thu · Fri · Sat · Doors 8pm
📍 710 N Clark, River North',
'#karaokechicago #stardustchicago #riverNorth #chicagonightlife #thingstodoinchicago',
'Quick montage: Thursday crowd building, Friday singer at mic, Saturday wall-to-wall. Each clip 2–3s. End card with the three nights.',
'Script: "three nights. same room. different every time."

0:00 · 2s — Thursday crowd, early energy building
0:02 · 2s — Friday singer at mic, fully committed
0:04 · 2s — Saturday — wall-to-wall, absolute peak
0:06 · 2s — Bar in motion, drinks everywhere
0:08 · 2s — Wide Saturday room — the payoff
0:10 · 4s — End card: THU · FRI · SAT · STARDUST CHICAGO · 710 N CLARK
Total: ~14s',
'2026-05-11', '11:00');

-- ── POST 112 · TikTok Video · May 12 · Tuesday hype for the week ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'karaoke is thursday friday and saturday at stardust chicago. 710 n clark. doors at 8.',
'',
'2-second cuts of the best crowd reactions and singers from recent weeks. Energy ramp: quiet start → full room.',
'Script: "karaoke three nights a week. stardust chicago."

0:00 · 1.5s — Empty stage, mic lit, the anticipation
0:01 · 1.5s — First singer up — nervous, good
0:03 · 1.5s — Crowd reaction — someone loving it
0:04 · 1.5s — Different singer, totally different vibe
0:06 · 1.5s — Bar busy, room filling fast
0:07 · 1.5s — Wide shot — the room at capacity
0:09 · 1.5s — Close on a face singing along
0:10 · 2s — On-screen: "EVERY THU FRI SAT"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-12', '10:00');

-- ── POST 113 · Twitter/X Tweet · May 13 · Wednesday countdown ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'karaoke starts tomorrow at stardust. thursday night, 710 n clark. be there.',
'', '', '2026-05-13', '08:00');

-- ── POST 114 · Instagram Story · May 14 · Thursday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight. Stardust Chicago.
Thursday karaoke · 8pm
📍 710 N Clark',
'',
'Story (9:16). Warm crowd photo, tonight energy. Countdown sticker if available. Text: "TONIGHT · 8PM".',
'2026-05-14', '16:00');

-- ── POST 115 · TikTok Video · May 14 · Thursday POV ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday night karaoke at stardust chicago. this is what it looks like.',
'',
'POV-style: camera moves through the room as the night builds. Handheld, raw, natural audio.',
'Script: "thursday night at stardust. this is what it looks like."

0:00 · 2s — Walk-in: front door, neon, the entrance
0:02 · 2s — Room coming into view — half-full, warming up
0:04 · 2s — Approach the bar — energy, drinks, faces
0:06 · 2s — Turn toward stage — singer in distance, crowd between
0:08 · 2s — Push through crowd — closer to stage
0:10 · 2s — Singer fills frame — mid-song, completely in it
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-05-14', '10:00');

-- ── POST 116 · Facebook Post · May 14 · Thursday event post ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Thursday karaoke is tonight at Stardust Chicago.

Doors at 8pm · 710 N Clark, River North
Open till 2am

Come sing. Come watch. Come be loud.',
'',
'Warm crowd photo from a recent Thursday. Room full, stage lit.',
'2026-05-14', '13:00');

-- ── POST 117 · Instagram Reel · May 15 · Friday night open ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'friday night at stardust chicago. open till 4am.

710 n clark · river north',
'#karaokechicago #fridaynight #chicagobar #stardustchicago #latenightchicago',
'Friday arrival sequence — empty to full in one reel. Raw energy, quick cuts.',
'Script: "it''s friday. stardust chicago is open till 4am."

0:00 · 2s — Stage lit, empty room — the promise of the night
0:02 · 2s — Doors open, first people through
0:04 · 2s — First drink poured at the bar
0:06 · 2s — First singer of the night at the mic
0:08 · 2s — Room filling fast — the Friday crowd arriving
0:10 · 2s — Wide shot — the energy taking hold
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-05-15', '11:00');

-- ── POST 118 · TikTok Video · May 15 · Friday fast cut ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. 710 n clark. till 4am.',
'',
'Fast cut — 1–1.5s per shot. Raw crowd energy, no narration, on-screen text at end only.',
'Script: "friday night. stardust chicago."

0:00 · 1s — Neon sign exterior
0:01 · 1s — Room wide, still early
0:02 · 1s — Singer approaching mic
0:03 · 1s — First note — the crowd reacts
0:04 · 1s — Bar slammed, drinks going out
0:05 · 1s — Crowd packed in, mid-song
0:06 · 1s — Face in crowd, fully locked in
0:07 · 1s — Wide room — wall to wall
0:08 · 1s — Singer at peak moment
0:09 · 1s — Someone in crowd singing along
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-15', '10:00');

-- ── POST 119 · Twitter/X Tweet · May 15 · Friday post ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust chicago is open tonight. friday karaoke. 710 n clark. till 4am.',
'', '', '2026-05-15', '08:00');

-- ── POST 120 · TikTok Video · May 16 · Saturday uncut ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust chicago. open till 5am.',
'',
'One uncut clip, no edits. The room at peak Saturday energy. Raw audio. The shot that makes you feel like you missed out.',
'Script: "saturday at stardust. you kind of have to see it."

0:00 · 20s — One uncut clip, no edits, raw audio: the room at full Saturday energy. Whoever is on the mic, the crowd doing exactly what it does. The shot that makes someone feel like they missed something.
0:20 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~24s',
'2026-05-16', '10:00');

-- ── POST 121 · Instagram Reel · May 16 · Saturday crowd ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago. Till 5am.

710 N Clark · River North',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #riverNorth',
'Peak Saturday crowd footage. Full room, multiple singers, crowd reactions. Energy montage.',
'Script: "saturday night at stardust. we go till 5am."

0:00 · 2s — Wide room at full capacity
0:02 · 2s — Singer mid-song, completely committed
0:04 · 2s — Crowd reaction — multiple faces, all in
0:06 · 2s — Bar packed, drinks in every hand
0:08 · 2s — Different singer — different energy, same room
0:10 · 2s — Wide again — the room at absolute peak
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-05-16', '11:00');

-- ── POST 122 · Facebook Post · May 17 · Weekend recap ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Three nights done. Three more coming next week.

Stardust Chicago · Thu · Fri · Sat
Doors 8pm · 710 N Clark, River North',
'',
'Recap collage or single strong crowd shot from the weekend.',
'2026-05-17', '13:00');

-- ── POST 123 · Instagram Carousel · May 19 · Venue feature ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'The room that makes it happen.

Slide 1: Stage lit, empty
Slide 2: Mic up close
Slide 3: Bar detail
Slide 4: Room filling in
Slide 5: Full capacity

710 N Clark · River North · Thu Fri Sat',
'#stardustchicago #karaokebar #chicagobar #riverNorth #karaokechicago #chicagonightlife',
'5-slide carousel: venue beauty shots. Empty-to-full sequence. Golden hour bar detail. Stage close-up.',
'2026-05-19', '11:00');

-- ── POST 124 · TikTok Video · May 21 · Thursday setup BTS ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'getting stardust ready for thursday night. 710 n clark.',
'',
'Behind the scenes setup: mics, lights, bar, QR cards on tables. Room transformation. Doors-about-to-open energy.',
'Script: "getting stardust ready for tonight."

0:00 · 2s — Empty room, house lights up — before the night
0:02 · 2s — Mics being tested — held up, tapped, checked
0:04 · 2s — Lights switching from house to stage wash
0:06 · 2s — QR cards placed on tables — the little details
0:08 · 2s — Bar being set — bottles lined, glasses clean
0:10 · 2s — Final wide shot — room ready, doors about to open
0:12 · 4s — End card: STARDUST CHICAGO · TONIGHT · 710 N CLARK
Total: ~16s',
'2026-05-21', '10:00');

-- ── POST 125 · Instagram Story · May 21 · Thursday countdown ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust.
Thursday karaoke · Doors 8pm
📍 710 N Clark',
'',
'Story. Dark bar with warm lighting. Countdown sticker to 8pm.',
'2026-05-21', '16:00');

-- ── POST 126 · Instagram Reel · May 22 · Crowd singing along ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The best part of karaoke isn''t the singer. It''s the room.

Stardust Chicago · 710 N Clark',
'#karaokechicago #stardustchicago #fridaynight #chicagonightlife #singalong',
'Crowd-focused footage: multiple faces singing along, arms around each other, total investment. Singer in background.',
'Script: "the best part of karaoke isn''t the singer."

0:00 · 2s — Stage in background, crowd in foreground — they''re the story
0:02 · 2s — Close on a face singing every word
0:04 · 2s — Two people, arms around each other, belting it out
0:06 · 2s — Pan across crowd — everyone in
0:08 · 2s — Singer glances back at crowd — the exchange
0:10 · 2s — Wide room — the whole thing together
0:12 · 4s — End card: STARDUST CHICAGO · THE ROOM · 710 N CLARK
Total: ~16s',
'2026-05-22', '11:00');

-- ── POST 127 · TikTok Video · May 22 · Friday night open ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. doors at 8. till 4am.',
'',
'Friday arrival — doors opening, first people through, first drinks, first singer. The night starting.',
'Script: "friday night. stardust chicago is open."

0:00 · 2s — Exterior: 710 N Clark, neon on, doors opening
0:02 · 2s — First people through — coats on, ready
0:04 · 2s — Bar: first round being ordered
0:06 · 2s — Stage lit, mic in frame — the invitation
0:08 · 2s — First singer of Friday night — committing fully
0:10 · 2s — Room building — the crowd finding their night
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-05-22', '10:00');

-- ── POST 128 · Twitter/X Tweet · May 22 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke at stardust chicago. open now. 710 n clark.',
'', '', '2026-05-22', '20:00');

-- ── POST 129 · TikTok Video · May 23 · Saturday peak ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night at stardust chicago goes till 5am. 710 n clark.',
'',
'Peak Saturday — full room, multiple singers, crowd at maximum. Fast cuts, raw energy.',
'Script: "saturday at stardust hits different at 2am."

0:00 · 1.5s — Wide room, past midnight, still packed
0:01 · 1.5s — Singer mid-song, voice still strong late in the night
0:03 · 1.5s — Close on faces — the "we''re not leaving" look
0:04 · 1.5s — Bar still going — 1am, 2am energy
0:06 · 1.5s — Different singer — totally different song, same commitment
0:07 · 1.5s — Crowd reaction — peak Saturday moment
0:09 · 1.5s — Wide again — the room that stayed
0:10 · 2s — On-screen: "TILL 5AM"
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · 710 N CLARK
Total: ~16s',
'2026-05-23', '10:00');

-- ── POST 130 · Instagram Reel · May 23 · Saturday late night ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust goes till 5am. Some of us are just getting started.

710 N Clark · River North',
'#saturdaynight #latenightchicago #karaokechicago #stardustchicago #till5am',
'Late-night Saturday footage — past midnight, room still full. The people who stayed.',
'Script: "saturday night at stardust. we''re just getting started."

0:00 · 2s — Clock detail or on-screen "12:47 AM"
0:02 · 2s — Room still wall-to-wall — not going anywhere
0:04 · 2s — Singer completely giving it everything at 1am
0:06 · 2s — Crowd cheering like it''s 9pm
0:08 · 2s — Bar still pouring, the room still moving
0:10 · 2s — Wide shot — the late Saturday room at full energy
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-05-23', '11:00');

-- ── POST 131 · Instagram Carousel · May 26 · Karaoke culture post ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'This is what karaoke actually looks like.

Not polished. Not perfect.
Just people getting up and going for it.

Stardust Chicago · Thu Fri Sat · 710 N Clark',
'#karaokeculture #stardustchicago #karaokechicago #chicagonightlife #getup',
'5 slides of real karaoke moments: nervous first-timers, veteran regulars, crowd reactions, mic close-up, end card.',
'2026-05-26', '11:00');

-- ── POST 132 · TikTok Video · May 28 · Thursday first-timer ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first time at stardust chicago. thursday karaoke. 710 n clark.',
'',
'First-timer POV: walk in, look around, find a table, eventually get to the mic. Authentic, a little nervous.',
'Script: "what it looks like the first time you walk into stardust."

0:00 · 2s — Exterior: the door, the sign — the decision
0:02 · 2s — Walk in — room opens up, a little overwhelming
0:04 · 2s — Find a table — look around, take it in
0:06 · 2s — The songbook or QR code — the choice
0:08 · 2s — Watch someone else go up — the courage building
0:10 · 2s — Approach the mic — it''s your turn
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-05-28', '10:00');

-- ── POST 133 · Facebook Post · May 28 · Thursday reminder ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Thursday karaoke is tonight at Stardust Chicago.

It doesn''t matter if you can sing. The room doesn''t care. Come anyway.

Doors at 8pm · 710 N Clark, River North',
'',
'Warm bar photo, inviting energy. Could be a candid of someone laughing mid-song.',
'2026-05-28', '13:00');

-- ── POST 134 · Instagram Reel · May 29 · Singer spotlight ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The mic belongs to everyone. This is what it looks like when someone takes it.

Stardust Chicago · 710 N Clark',
'#karaokechicago #stardustchicago #takethemic #fridaynight #chicagonightlife',
'One singer, one song — from the moment they take the mic to the crowd reaction at the end. Minimal cuts.',
'Script: "the mic belongs to everyone."

0:00 · 2s — The microphone in frame — the invitation
0:02 · 3s — Someone walking up — the decision made
0:05 · 4s — Mid-song — fully in it, no looking back
0:09 · 3s — Crowd reaction building — the room responding
0:12 · 4s — End card: STARDUST CHICAGO · TAKE THE MIC · 710 N CLARK
Total: ~16s',
'2026-05-29', '11:00');

-- ── POST 135 · TikTok Video · May 29 · Friday fast cut ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday karaoke at stardust chicago. open till 4am. 710 n clark.',
'',
'Fast-cut Friday montage. 1-second shots. Chaos energy, raw audio, on-screen text at end only.',
'Script: "friday night. stardust."

0:00 · 1s — Exterior neon
0:01 · 1s — Crowd at bar
0:02 · 1s — Singer takes mic
0:03 · 1s — First note lands
0:04 · 1s — Crowd reacts
0:05 · 1s — Different singer, different song
0:06 · 1s — Two people singing along together
0:07 · 1s — Wide room — completely packed
0:08 · 1s — Mic closeup, someone absolutely going for it
0:09 · 1s — Crowd at peak
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-29', '10:00');

-- ── POST 136 · Twitter/X Tweet · May 29 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust chicago is open tonight. friday karaoke till 4am. 710 n clark, river north. doors at 8.',
'', '', '2026-05-29', '08:00');

-- ── POST 137 · TikTok Video · May 30 · Saturday uncut moment ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust chicago saturday night. you kind of just have to be there.',
'',
'One uncut clip. The room at max. No editing, no music overlay, just the room doing what it does.',
'Script: "stardust on a saturday. no edits needed."

0:00 · 22s — One uncut clip. Raw audio. The room at full Saturday peak — whoever is on the mic, however the crowd is responding. The moment that makes someone think "I need to be there."
0:22 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~26s',
'2026-05-30', '10:00');

-- ── POST 138 · Instagram Reel · May 30 · Memorial Day weekend ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Memorial Day weekend. Stardust is open Saturday night.

See you at 710 N Clark.',
'#memorialdayweekend #chicagonightlife #karaokechicago #stardustchicago #saturdaynight',
'Saturday Memorial Day weekend energy — the room knowing it''s a holiday weekend. Extra energy, fuller crowd.',
'Script: "memorial day weekend. stardust is open."

0:00 · 2s — The room setting up — holiday weekend anticipation
0:02 · 2s — Early crowd arriving — it''s a big night
0:04 · 2s — Stage lit, energy in the air
0:06 · 2s — First singer — the weekend beginning
0:08 · 2s — Crowd building — holiday energy
0:10 · 2s — Wide room — a big Saturday
0:12 · 4s — End card: STARDUST CHICAGO · MEMORIAL DAY WEEKEND · 710 N CLARK
Total: ~16s',
'2026-05-30', '11:00');

-- ── POST 139 · Instagram Story · May 30 · Saturday tonight ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Memorial Day Weekend 🎤
Stardust Chicago · Tonight · 8pm
710 N Clark',
'',
'Story with holiday energy. Crowd photo or venue shot with warm lighting. "TONIGHT" text overlay.',
'2026-05-30', '16:00');

-- ── POST 140 · Facebook Post · Jun 2 · June opening announcement ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'June at Stardust Chicago starts this week.

Karaoke every Thursday, Friday, and Saturday.
Doors at 8pm · 710 N Clark, River North

Summer is the best time to sing.',
'',
'Warm summer-toned venue photo. Inviting. The room ready for June.',
'2026-06-02', '13:00');

-- ── POST 141 · Twitter/X Tweet · Jun 2 · June week preview ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'june at stardust chicago. karaoke thursday friday saturday. 710 n clark. doors at 8.',
'', '', '2026-06-02', '08:00');

-- ── POST 142 · TikTok Video · Jun 4 · Thursday summer vibes ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday night karaoke at stardust chicago. june edition. 710 n clark.',
'',
'First Thursday of June — reference the season without being corny. Energy is summer-warm.',
'Script: "june karaoke starts tonight at stardust chicago."

0:00 · 2s — Wide room, warm light, summer Thursday beginning
0:02 · 2s — People arriving, lighter clothes, summer energy
0:04 · 2s — Bar in motion — the Thursday crowd finding their seats
0:06 · 2s — First singer of June at the mic
0:08 · 2s — Crowd building — the warm-weather karaoke night
0:10 · 2s — Wide shot — a Thursday that knows it''s summer
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-04', '10:00');

-- ── POST 143 · Instagram Reel · Jun 5 · Friday summer night ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Summer Friday at Stardust Chicago.

Open till 4am. 710 N Clark, River North.',
'#summernightschicago #fridaynight #karaokechicago #stardustchicago #chicagonightlife',
'Friday night with summer energy — lighter clothes, windows open if applicable, the warm-season crowd.',
'Script: "summer friday at stardust chicago."

0:00 · 2s — Exterior: warm evening light on 710 N Clark
0:02 · 2s — Inside — the summer crowd arriving
0:04 · 2s — Drinks at the bar — the Friday night starting
0:06 · 2s — Singer at mic, crowd around them
0:08 · 2s — Energy building — a warm-weather Friday
0:10 · 2s — Wide room — summer Friday at full capacity
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-05', '11:00');

-- ── POST 144 · TikTok Video · Jun 5 · Friday night ───────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'summer friday karaoke at stardust chicago. 710 n clark. till 4am.',
'',
'Fast-cut summer Friday. Raw crowd energy, natural audio. The room in June.',
'Script: "summer fridays at stardust chicago."

0:00 · 1.5s — Exterior warm evening, the door open
0:01 · 1.5s — First crowd through the door
0:03 · 1.5s — Bar busy, summer drinks
0:04 · 1.5s — Stage lit, mic ready
0:06 · 1.5s — Singer up — summer Friday energy
0:07 · 1.5s — Crowd singing along
0:09 · 1.5s — Wide room — packed summer Friday
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-06-05', '10:00');

-- ── POST 145 · Instagram Story · Jun 5 · Friday tonight ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Summer Friday. Stardust is open.
Doors 8pm · Till 4am
📍 710 N Clark',
'',
'Story. Warm summer evening outside, or warm bar inside. "TONIGHT" text overlay.',
'2026-06-05', '16:00');

-- ── POST 146 · TikTok Video · Jun 6 · Saturday summer peak ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust chicago. open till 5am. 710 n clark.',
'',
'Peak summer Saturday. The room at maximum. Raw, unfiltered energy.',
'Script: "saturday night at stardust chicago. summer edition."

0:00 · 2s — Wide room, Saturday at full capacity — summer crowd
0:02 · 2s — Singer at peak moment, completely in it
0:04 · 2s — Crowd — every single person locked in
0:06 · 2s — Bar packed — summer Saturday drinks going everywhere
0:08 · 2s — Different singer — different energy, same intensity
0:10 · 2s — Wide again — the room at absolute peak
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-06', '10:00');

-- ── POST 147 · Instagram Reel · Jun 6 · Saturday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago.

The summer version. Same mic. Warmer crowd.

710 N Clark · River North · Till 5am',
'#saturdaynight #summernightschicago #karaokechicago #stardustchicago #latenightchicago',
'Summer Saturday at peak. Full room, warm light, the crowd fully activated.',
'Script: "saturday at stardust in the summer."

0:00 · 2s — Wide room — summer Saturday, full and warm
0:02 · 2s — Singer mid-song, leaning into it
0:04 · 2s — Crowd up close — summer energy, people in their element
0:06 · 2s — Bar shot — summer drinks, the room in motion
0:08 · 2s — Someone in the crowd going for every word
0:10 · 2s — Wide shot — the summer Saturday at full heat
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-06', '11:00');

-- ── POST 148 · Facebook Post · Jun 7 · Weekend recap + next week preview ─────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Great first summer weekend at Stardust Chicago.

Back at it Thursday. Karaoke every Thu · Fri · Sat.
Doors 8pm · 710 N Clark, River North',
'',
'Weekend recap photo — crowd, singer, or bar. Warm summer tone.',
'2026-06-07', '13:00');

-- ── POST 149 · Instagram Carousel · Jun 9 · Karaoke how-to ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'How karaoke at Stardust works.

Slide 1: Scan the QR code at your table
Slide 2: Pick any song — there are thousands
Slide 3: Wait for your name to be called
Slide 4: Get up, grab the mic
Slide 5: The room is already on your side

See you at 710 N Clark.',
'#karaoke101 #stardustchicago #karaokechicago #firsttimer #chicagonightlife',
'5-slide how-to carousel. Illustrative, friendly, demystifying. Each slide with a simple visual and clear text.',
'2026-06-09', '11:00');

-- ── POST 150 · TikTok Video · Jun 11 · Wednesday hype ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'karaoke thursday friday saturday at stardust chicago. 710 n clark. this week.',
'',
'Midweek hype. Quick highlights from recent weeks. Countdown energy.',
'Script: "karaoke is three nights this week at stardust chicago."

0:00 · 2s — Best recent Thursday crowd moment
0:02 · 2s — Best recent Friday singer moment
0:04 · 2s — Best recent Saturday crowd reaction
0:06 · 2s — On-screen: "THIS THURSDAY"
0:08 · 2s — On-screen: "THIS FRIDAY"
0:10 · 2s — On-screen: "THIS SATURDAY"
0:12 · 4s — End card: STARDUST CHICAGO · THU FRI SAT · 710 N CLARK
Total: ~16s',
'2026-06-11', '10:00');

-- ── POST 151 · Twitter/X Tweet · Jun 11 · Week preview ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'three nights of karaoke this week at stardust chicago. thursday friday saturday. 710 n clark.',
'', '', '2026-06-11', '08:00');

-- ── POST 152 · TikTok Video · Jun 12 · Thursday POV ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday night karaoke at stardust chicago. 710 n clark. doors at 8.',
'',
'POV walk-in and settle-in. The Thursday experience from first step through first song.',
'Script: "thursday karaoke at stardust chicago."

0:00 · 2s — Front door — the decision to come in
0:02 · 2s — The room opens up — warm, full of people
0:04 · 2s — Bar — the first drink, the room taking shape
0:06 · 2s — Someone else singing — watching, feeling it
0:08 · 2s — QR code in hand — the choice being made
0:10 · 2s — Wide shot — a Thursday in full swing
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-12', '10:00');

-- ── POST 153 · Instagram Reel · Jun 12 · Thursday crowd energy ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday karaoke at Stardust Chicago. The room does the work.

710 N Clark · River North · Every Thursday',
'#thursdaynight #karaokechicago #stardustchicago #riverNorth #chicagonightlife',
'Thursday crowd energy — regulars and newcomers, the room working together.',
'Script: "thursday at stardust. the room does the work."

0:00 · 2s — Room building — early Thursday, energy climbing
0:02 · 2s — Regular in their element — the room knowing itself
0:04 · 2s — Newcomer getting up for first time — the courage
0:06 · 2s — The crowd cheering them on
0:08 · 2s — Singer at mic, crowd behind them — the support
0:10 · 2s — Wide room — Thursday at its best
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-12', '11:00');

-- ── POST 154 · Instagram Story · Jun 12 · Thursday tonight ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust.
Thursday karaoke · Doors 8pm
📍 710 N Clark',
'',
'Story. Warm bar shot. "TONIGHT · THURSDAY" text overlay.',
'2026-06-12', '16:00');

-- ── POST 155 · TikTok Video · Jun 13 · Friday night ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. till 4am. 710 n clark.',
'',
'Friday energy from arrival to peak. The night in full motion.',
'Script: "friday night at stardust chicago. open till 4am."

0:00 · 2s — Doors opening, first wave of Friday crowd
0:02 · 2s — Bar filling up, summer Friday energy
0:04 · 2s — Stage lit — the room ready
0:06 · 2s — Singer up — the night officially starting
0:08 · 2s — Crowd at peak Friday energy
0:10 · 2s — Wide shot — the Friday room at full capacity
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-13', '10:00');

-- ── POST 156 · Instagram Reel · Jun 13 · Friday late night ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Late night Friday at Stardust Chicago.

710 N Clark · River North · Till 4am',
'#fridaynight #latenightchicago #karaokechicago #stardustchicago #chicagonightlife',
'Late Friday — past midnight, the room still at full energy, the people who stayed.',
'Script: "late night friday at stardust."

0:00 · 2s — Clock or on-screen "1:15 AM" — the hour that matters
0:02 · 2s — Room still absolutely full — nobody left
0:04 · 2s — Singer at mic — the late Friday commitment
0:06 · 2s — Two people fully singing along — lost in it
0:08 · 2s — Bar still running — 1am Friday is still early here
0:10 · 2s — Wide room — late Friday at full energy
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-13', '11:00');

-- ── POST 157 · Twitter/X Tweet · Jun 13 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke at stardust chicago. open tonight. 710 n clark. till 4am.',
'', '', '2026-06-13', '08:00');

-- ── POST 158 · TikTok Video · Jun 14 · Saturday season closer vibe ──────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust chicago. this is the one. 710 n clark.',
'',
'The final Saturday of the batch — the room at its highest. One big uncut moment, no edits needed.',
'Script: "saturday night at stardust chicago. every week."

0:00 · 20s — One uncut clip. The room at full Saturday peak. Raw audio. No edits. The moment that says everything about what Stardust is on a Saturday night.
0:20 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM · 710 N CLARK
Total: ~24s',
'2026-06-14', '10:00');

-- ── POST 159 · Instagram Reel · Jun 14 · Saturday season statement ──────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'This is Stardust Chicago on a Saturday night.

Every Saturday. Till 5am.
📍 710 N Clark, River North',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #till5am',
'The definitive Saturday statement reel. Peak energy, best crowd footage, the room at its most itself.',
'Script: "this is stardust chicago on a saturday night."

0:00 · 2s — Wide room, Saturday, full capacity — the establishing shot
0:02 · 2s — Singer who owns the moment — mid-peak
0:04 · 2s — Crowd completely activated — the people
0:06 · 2s — The bar — the room in full motion
0:08 · 2s — Late night — still packed, still going
0:10 · 2s — Wide final shot — the room that stays till 5am
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-14', '11:00');

END $$;
