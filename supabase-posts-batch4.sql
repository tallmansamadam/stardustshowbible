-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Social Posts Batch 4
-- Date range: July 20 – September 7, 2026
-- Covers: Peak summer → Last weekend of August → Labor Day send-off
-- Schedule update: Karaoke Fri/Sat only · Doors 6pm · Happy Hour 5–8pm daily
-- Reel/Video posts include full video_script.
-- Run AFTER supabase-posts-batch3.sql (does NOT delete existing posts).
--
-- BEFORE RUNNING: Replace 'YOUR_USER_ID_HERE' with your actual Supabase user ID.
-- ─────────────────────────────────────────────────────────────────────────────

DO $$
DECLARE
  uid uuid := 'YOUR_USER_ID_HERE';
BEGIN

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 1 · Jul 20–26 · Peak summer — the hottest nights
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 253 · Twitter/X Tweet · Jul 20 · Monday recap ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'saturday at stardust went till 5am. the last singer didn''t finish until 4:50. back friday.',
'', '', '', '2026-07-20', '08:00');

-- ── POST 254 · Instagram Feed Post · Jul 22 · Midweek tease ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'Friday is two days away.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #weekendplans #thingstodoinchicago #chicagobar #312',
'Midweek tease — the stage empty and lit, mic stand in the wash. Portrait orientation. Let the anticipation build.',
'', '2026-07-22', '11:00');

-- ── POST 255 · Instagram Story · Jul 24 · Friday night ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Happy Hour till 8 · Mic opens at 6
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). Warm bar detail — golden hour energy inside, the room just starting. Text overlay clean. Countdown sticker to 6pm.',
'', '2026-07-24', '14:00');

-- ── POST 256 · TikTok Video · Jul 24 · Friday summer heat ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'chicago in july. stardust is open. 710 n clark, river north. karaoke till 4am.',
'',
'Friday in the middle of summer — the kind of night Chicago is made for. Shoot the exterior warm, then move inside fast. Sweat and neon and the room filling. Raw energy.',
'Script: "chicago in july. this is what friday looks like."

0:00 · 2s — Exterior: 710 N Clark in summer heat, people heading toward the door
0:02 · 2s — The bar: condensation on every glass, warm glow, the room already going
0:04 · 2s — Stage: mic live, first singer of the night stepping up
0:06 · 2s — Crowd: hands up, someone already fully in it
0:08 · 2s — Two strangers sharing a mic — didn''t plan it, happened anyway
0:10 · 2s — Wide room: summer Friday at peak energy
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · DOORS 6PM
Total: ~16s',
'2026-07-24', '10:00');

-- ── POST 257 · Instagram Reel · Jul 24 · Friday peak summer ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Chicago in July is a specific kind of feeling.

Stardust has the room for it.

Fri · Sat · Doors 6pm · Happy Hour till 8
📍 710 N Clark, River North',
'#stardustchicago #karaokechicago #summerchicago #chicagonightlife #riverNorth #fridaynight #thingstodoinchicago #chicagobar',
'Peak summer Friday reel. Exterior warm evening light → interior full energy. Quick cuts, real sound. The kind of night that only exists in July.',
'Script: "there are about six perfect chicago summer nights a year. this is one of them."

0:00 · 2s — Clark St at dusk: golden light, people moving
0:02 · 2s — The door: it opens, the sound pours out
0:04 · 2s — Bar: full, warm, alive — every seat taken
0:06 · 2s — Performer: fully committed, the crowd locked in
0:08 · 2s — Crowd reaction: the moment when the whole room knows the chorus
0:10 · 2s — Late in the night: 1am energy still climbing
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · 710 N CLARK
Total: ~16s',
'2026-07-24', '11:00');

-- ── POST 258 · Facebook Event · Jul 24 · Friday karaoke ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

Chicago in July. The bar is cold, the room is warm, and the mic is live.

Happy Hour 5–8pm · Doors 6pm · Open till 4am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Recurring Friday Facebook Event. Peak-summer crowd shot as cover — the room at full capacity on a warm night.',
'', '2026-07-24', '09:00');

-- ── POST 259 · Instagram Story · Jul 25 · Saturday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Happy Hour till 8 · Open till 5am
📍 710 N Clark',
'',
'Story (9:16). Saturday crowd energy — the room at its fullest, warm light. Bold text, clean layout. Poll sticker: "Are you coming tonight?"',
'', '2026-07-25', '15:00');

-- ── POST 260 · TikTok Video · Jul 25 · Saturday peak ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night at stardust chicago. 710 n clark, river north. till 5am.',
'',
'Saturday at full summer capacity. The room at its loudest. No staging — just the real thing. One great uncut clip of the room completely alive.',
'Script: "saturday at stardust. the whole room knows the words."

0:00 · 3s — The room: Saturday at capacity, every person in it
0:03 · 2s — Stage: performer holding the mic like they own it
0:05 · 2s — The crowd coming in on the chorus — unplanned, unstoppable
0:07 · 2s — Close-up: someone singing with their eyes closed
0:09 · 2s — Wide: the Saturday room at 11pm
0:11 · 2s — The moment after the song: the room loud
0:13 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~17s',
'2026-07-25', '10:00');

-- ── POST 261 · Facebook Event · Jul 25 · Saturday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

The room is full. The mic is live. Chicago summer is still going.

Happy Hour 5–8pm · Doors 6pm · Open till 5am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Late-night Saturday crowd as cover image — the room past midnight, fully alive.',
'', '2026-07-25', '09:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 2 · Jul 27–Aug 2 · Last Friday of July / First of August
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 262 · Twitter/X Tweet · Jul 27 · Monday recap ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust this weekend: two nights, full rooms, someone hit a note on saturday that stopped the room cold. back friday.',
'', '', '', '2026-07-27', '08:00');

-- ── POST 263 · Instagram Feed Post · Jul 29 · Midweek ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'Last Friday of July.
Last Saturday of July.

Both of them at Stardust.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #weekendplans #thingstodoinchicago #chicagobar #lastfridayofjuly',
'Atmospheric midweek post — empty stage, lit warm. Something about the end of July feels like an invitation. Portrait orientation.',
'', '2026-07-29', '11:00');

-- ── POST 264 · Instagram Story · Jul 31 · Last Friday of July ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Last Friday of July.
The mic is live at 6.
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). High energy — stage lit, crowd filling in. Countdown sticker to 6pm. Bold text over a warm bar or stage shot.',
'', '2026-07-31', '14:00');

-- ── POST 265 · TikTok Video · Jul 31 · Last Friday of July ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'last friday of july at stardust chicago. 710 n clark, river north. karaoke till 4am.',
'',
'End-of-month energy — last chance for this version of summer. Quick cuts, the room building from early to packed. The month''s last night out deserves it.',
'Script: "last friday of july. stardust chicago. the mic doesn''t care what month it is."

0:00 · 2s — Bar at 6pm: early arrivals, happy hour, the room warming up
0:02 · 2s — First singer of the night — no crowd yet, pure intent
0:04 · 2s — 9pm: room filling, energy climbing
0:06 · 2s — 11pm: capacity, someone on stage completely locked in
0:08 · 2s — 1am: the room at its best — this is why you came
0:10 · 2s — Closing: the last song, the night that used July right
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · DOORS 6PM
Total: ~16s',
'2026-07-31', '10:00');

-- ── POST 266 · Instagram Reel · Jul 31 · Last Friday of July ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Friday of July.

You know what that means.

📍 710 N Clark · River North · Doors 6pm · Till 4am',
'#stardustchicago #karaokechicago #lastfridayofjuly #chicagonightlife #riverNorth #thingstodoinchicago #chicagobar #312 #fridaynight',
'The end-of-month feeling. Quick cuts from arrival to late night. The arc of a full Friday at Stardust, compressed to 15 seconds.',
'Script: "last friday of july. make it a good one."

0:00 · 2s — Empty stage, pre-doors: the calm before
0:02 · 2s — Doors open: first people through, happy hour in full swing
0:04 · 2s — The room at 9pm: filling fast, energy up
0:06 · 2s — A performer hitting their moment: the crowd leans in
0:08 · 2s — Midnight: fully packed, the kind of night you stay for
0:10 · 2s — Closing shot: the last song, the room giving it everything
0:12 · 4s — End card: STARDUST CHICAGO · LAST FRIDAY OF JULY · 710 N CLARK
Total: ~16s',
'2026-07-31', '11:00');

-- ── POST 267 · Instagram Story · Aug 1 · First of August ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'First Saturday of August.
Stardust is open.
📍 710 N Clark · Doors 6pm · Till 5am',
'',
'Story (9:16). Saturday night energy — warm room, the crowd that showed up for the first August weekend. Bold text. Countdown sticker.',
'', '2026-08-01', '15:00');

-- ── POST 268 · TikTok Video · Aug 1 · First Saturday of August ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first saturday of august at stardust chicago. 710 n clark, river north. till 5am.',
'',
'New month, same room. Shoot the transition — from the last light outside to the full-dark inside. August has a specific late-summer energy that''s different from July. Let it show.',
'Script: "it''s august now. stardust is still open."

0:00 · 2s — Exterior: August evening light, slightly different from July — the quality of light has changed
0:02 · 2s — The bar: a cold drink being set down, warm light, the room alive
0:04 · 2s — Stage: singer mid-song, the mic pulled close
0:06 · 2s — Crowd: late-night energy, the first August Saturday doing its thing
0:08 · 2s — Bar close-up: the night at full speed
0:10 · 2s — Wide room: Saturday night, no summer left to waste
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-08-01', '10:00');

-- ── POST 269 · Facebook Post · Aug 2 · Weekend recap ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Last weekend of July at Stardust Chicago. Both nights full. The room the way it should be.

August is here. The next two Friday and Saturday nights are yours.

Happy Hour 5–8pm every day · Doors 6pm · Free to sing · No cover
710 N Clark, River North',
'',
'End-of-weekend recap photo — the room at peak energy from Friday or Saturday.',
'', '2026-08-02', '13:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 3 · Aug 3–9 · August hits different
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 270 · Twitter/X Tweet · Aug 3 · Monday ──────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'august at stardust. same room, different feeling. back friday.',
'', '', '', '2026-08-03', '08:00');

-- ── POST 271 · Instagram Feed Post · Aug 5 · Midweek tease ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'August has a specific energy at night.

Stardust has a room for it.

📍 710 N Clark · River North · Fri & Sat · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #august #thingstodoinchicago #chicagobar #summerchicago',
'Atmospheric August tease — something warm but with the first hint of end-of-summer weight. Stage lit, empty, waiting. Let the image hold the feeling.',
'', '2026-08-05', '11:00');

-- ── POST 272 · Instagram Story · Aug 7 · Friday ──────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
Happy Hour 5–8 · Mic opens at 6
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). Friday energy — warm and inviting. Bar detail or stage shot with clean text overlay. Countdown to 6pm.',
'', '2026-08-07', '14:00');

-- ── POST 273 · TikTok Video · Aug 7 · August Friday ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'august friday at stardust chicago. you already know what it is. 710 n clark, river north.',
'',
'The August Friday regulars — the people who found this room and keep coming back. Warm, confident energy. Show the return.',
'Script: "some fridays you already know where you''re going."

0:00 · 2s — A regular walking in — the easy familiarity of someone who''s been here before
0:02 · 2s — The bartender: already making their drink before they sit down
0:04 · 2s — Stage: singer up early, happy hour crowd around them
0:06 · 2s — The room building: 8pm, the transition from happy hour to show
0:08 · 2s — Midnight: the regulars and the new people together — that''s the room
0:10 · 2s — Last call: the ones who stayed all the way
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · DOORS 6PM
Total: ~16s',
'2026-08-07', '10:00');

-- ── POST 274 · Facebook Event · Aug 7 · Friday karaoke ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Friday at Stardust Chicago

August. River North. The mic is live at 6.

Happy Hour 5–8pm · Doors 6pm · Open till 4am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Recurring Friday Facebook Event. Mid-August crowd energy as cover image.',
'', '2026-08-07', '09:00');

-- ── POST 275 · Instagram Reel · Aug 8 · Saturday August ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'August Saturday at Stardust.

Still summer. Still the room.

📍 710 N Clark · River North · Doors 6pm · Till 5am',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #saturday #august #thingstodoinchicago #chicagobar #312',
'The Saturday in August that still feels like full summer. Quick cuts, warm light, the room alive till late. That specific August energy where summer and something else overlap.',
'Script: "it''s still summer. the room hasn''t noticed."

0:00 · 2s — Exterior: August night, warm, the venue lit
0:02 · 2s — Inside: the Saturday crowd, full and loud
0:04 · 2s — Stage: performer mid-song, fully committed
0:06 · 2s — Bar: the energy of a night that knows it''s good
0:08 · 2s — Crowd: singing along, no one holding back
0:10 · 2s — Late: 2am, the best part of the room still ahead
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-08-08', '11:00');

-- ── POST 276 · Facebook Event · Aug 8 · Saturday karaoke ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

The summer Saturday that earns it.

Happy Hour 5–8pm · Doors 6pm · Open till 5am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. Late-night August crowd photo as cover image.',
'', '2026-08-08', '09:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 4 · Aug 10–16 · Mid-August midnight
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 277 · Twitter/X Tweet · Aug 10 · Monday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust this weekend: two nights, both full, one saturday singer went till the house lights came on. back friday.',
'', '', '', '2026-08-10', '08:00');

-- ── POST 278 · Instagram Feed Post · Aug 12 · Midweek ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'Halfway through August.

The room hasn''t slowed down.

📍 710 N Clark · River North · Fri & Sat · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #august #midaugust #thingstodoinchicago #chicagobar',
'Mid-August midweek post — something that captures the room at its most lived-in. A wide shot at full crowd, or a close detail of the bar at peak energy. The room that doesn''t slow down.',
'', '2026-08-12', '11:00');

-- ── POST 279 · Instagram Story · Aug 14 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Friday at Stardust.
The mic opens at 6.
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). The mid-August Friday — steady energy, the room that knows what it''s doing. Clean text overlay, countdown sticker.',
'', '2026-08-14', '14:00');

-- ── POST 280 · TikTok Video · Aug 14 · Mid-August Friday ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'mid-august at stardust chicago. the room is still going. 710 n clark, river north.',
'',
'Mid-August Friday — the room that''s been doing this all summer and hasn''t lost a step. Show the confidence. The crowd that comes back because they know what to expect.',
'Script: "mid-august. stardust chicago. still the answer."

0:00 · 2s — Bar at 6pm: happy hour, the room warming up — the ritual
0:02 · 2s — First performer of the night: the mic live before the room fills
0:04 · 2s — 9pm: the transition — happy hour ends, the energy shifts
0:06 · 2s — Performer and crowd: locked in together
0:08 · 2s — Bar at midnight: still going, still full
0:10 · 2s — The room at 1am: the ones who know how this works
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · DOORS 6PM
Total: ~16s',
'2026-08-14', '10:00');

-- ── POST 281 · Instagram Reel · Aug 14 · Friday mid-August ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Mid-August at Stardust.

The summer''s halfway done. The room doesn''t know that.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #august #fridaynight #thingstodoinchicago #chicagobar #312 #summerchicago',
'Mid-August Friday reel. The room at its most confident — deep into the summer run, everything working. Quick cuts from arrival to late-night peak.',
'Script: "it''s mid-august and the room still doesn''t know how to slow down."

0:00 · 2s — The bar: late afternoon light, first arrivals for happy hour
0:02 · 2s — The mic stand: lit and waiting
0:04 · 2s — First singer of the night — confident, no warm-up needed
0:06 · 2s — The crowd: mid-August regulars, the room in its stride
0:08 · 2s — Midnight: the kind of night that earns staying
0:10 · 2s — Last song, late: the room giving it one more
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · 710 N CLARK
Total: ~16s',
'2026-08-14', '11:00');

-- ── POST 282 · Instagram Story · Aug 15 · Saturday ───────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Mid-August Saturday at Stardust.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). Saturday crowd — the full room. Bold text. Countdown sticker or poll: "Are you coming tonight?"',
'', '2026-08-15', '15:00');

-- ── POST 283 · Facebook Event · Aug 15 · Saturday karaoke ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — This Saturday at Stardust Chicago

August is halfway done. The room isn''t.

Happy Hour 5–8pm · Doors 6pm · Open till 5am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Recurring Saturday Facebook Event. High-energy crowd shot as cover — the Saturday room at capacity.',
'', '2026-08-15', '09:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 5 · Aug 17–23 · Last summer Fridays
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 284 · Twitter/X Tweet · Aug 17 · Monday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'two weeks of august left. stardust has both of them. back friday.',
'', '', '', '2026-08-17', '08:00');

-- ── POST 285 · Instagram Feed Post · Aug 19 · Midweek ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'There are two summer Fridays left.

Use them.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #chicagonightlife #riverNorth #lastsummerfrdays #thingstodoinchicago #chicagobar #summerchicago',
'A post that carries the weight of the end of summer approaching — but doesn''t announce it. Empty stage, lit. Or a wide room shot. Something that makes you feel the clock.',
'', '2026-08-19', '11:00');

-- ── POST 286 · Instagram Story · Aug 21 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'One of the last summer Fridays.
The mic opens at 6.
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). The weight of late summer in the frame. Bold text. Countdown to 6pm. The feeling that there aren''t many of these left.',
'', '2026-08-21', '14:00');

-- ── POST 287 · TikTok Video · Aug 21 · Late summer Friday ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'one of the last summer fridays at stardust chicago. 710 n clark, river north. karaoke till 4am.',
'',
'Late August. The light outside is changing. Inside Stardust, the room doesn''t know — or doesn''t care. Show both. The contrast between the dying summer and the room that''s still fully alive.',
'Script: "the summer is almost over. the room hasn''t noticed."

0:00 · 2s — Exterior: August evening light — slightly different, the first hint of something ending
0:02 · 2s — Inside: the room, fully alive, no awareness of the calendar
0:04 · 2s — Stage: the singer who showed up for one of the last summer nights
0:06 · 2s — Crowd: locked in, the late-August urgency
0:08 · 2s — Bar: a full room using the night right
0:10 · 2s — Wide: late August Friday at Stardust, still the room it always was
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · DOORS 6PM
Total: ~16s',
'2026-08-21', '10:00');

-- ── POST 288 · Instagram Reel · Aug 21 · Late summer ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Late August at Stardust.

The summer''s almost done. The room doesn''t care.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #latesummer #chicagonightlife #riverNorth #fridaynight #thingstodoinchicago #chicagobar #312',
'Late summer Friday reel. The contrast: outside, the light is changing. Inside Stardust, the room is still fully alive. Show that contrast. Quick cuts, warm energy.',
'Script: "late august. the light outside changed. inside, nobody''s stopping."

0:00 · 2s — The door: one more time, one more Friday
0:02 · 2s — Bar: the room that doesn''t slow down for the calendar
0:04 · 2s — Stage: a singer getting everything out of the night
0:06 · 2s — Crowd: the late-August urgency — you can feel it
0:08 · 2s — Wide: the full room, still fully itself
0:10 · 2s — The last song of the night: late August doesn''t hold back
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · 710 N CLARK
Total: ~16s',
'2026-08-21', '11:00');

-- ── POST 289 · Instagram Story · Aug 22 · Saturday ───────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Late August Saturday at Stardust.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). Late summer Saturday energy. Bold text. Countdown or poll sticker. The feeling of "this one matters."',
'', '2026-08-22', '15:00');

-- ── POST 290 · Facebook Post · Aug 23 · Weekend recap ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Late August at Stardust Chicago. The room was full both nights.

One more weekend of summer. Then Labor Day.

Happy Hour 5–8pm every day · Doors 6pm · Free to sing · No cover
710 N Clark, River North',
'',
'End-of-weekend post with the best late-August crowd photo. Warm and alive, not nostalgic yet.',
'', '2026-08-23', '13:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 6 · Aug 24–30 · Last weekend of August
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 291 · Twitter/X Tweet · Aug 24 · Monday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'last weekend of august coming up. stardust. friday and saturday. 710 n clark.',
'', '', '', '2026-08-24', '08:00');

-- ── POST 292 · Instagram Feed Post · Aug 26 · Final August tease ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'Last weekend of August.

Friday and Saturday at Stardust.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #lastweekendofaugust #chicagonightlife #riverNorth #weekendplans #thingstodoinchicago #chicagobar',
'Last-weekend-of-August tease. Use the best crowd image from the summer run. The room that earned the season. Something that communicates: this one matters.',
'', '2026-08-26', '11:00');

-- ── POST 293 · Instagram Story · Aug 28 · Last Friday of August ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Last Friday of August.
Doors 6pm · Happy Hour till 8.
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). The weight of the last summer Friday in the air. Bold text. Countdown to 6pm. The kind of night you make an effort for.',
'', '2026-08-28', '14:00');

-- ── POST 294 · TikTok Video · Aug 28 · Last Friday of August ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'last friday of august at stardust chicago. 710 n clark, river north. karaoke till 4am.',
'',
'The last Friday of August deserves everything. This is the final summer Friday before Labor Day reshapes the calendar. Show the room giving it everything — because it is.',
'Script: "last friday of august. this is the one."

0:00 · 2s — Exterior: last Friday of August, warm but different — you can feel it
0:02 · 2s — The door: people arriving with intention
0:04 · 2s — Bar: the room that knows this night matters
0:06 · 2s — Stage: a performer making it count
0:08 · 2s — Crowd: the room at its most alive — the urgency of the last summer Friday
0:10 · 2s — Late night: 2am, the room still going
0:12 · 4s — End card: LAST FRIDAY OF AUGUST · STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-08-28', '10:00');

-- ── POST 295 · Instagram Reel · Aug 28 · Last summer Friday ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Friday of August.

The room is open. The mic is live.

📍 710 N Clark · River North · Doors 6pm · Till 4am',
'#stardustchicago #karaokechicago #lastfridayofaugust #latesummer #chicagonightlife #riverNorth #fridaynight #thingstodoinchicago #chicagobar #312',
'The final summer Friday reel. Everything the summer built to. Quick cuts, full energy, the room giving it everything on the last Friday before Labor Day weekend.',
'Script: "you get one last summer friday. make it stardust."

0:00 · 2s — The mic stand: lit, waiting, the last summer Friday ahead of it
0:02 · 2s — First arrivals: happy hour, the room just starting
0:04 · 2s — The energy shift at 8pm: the room waking up
0:06 · 2s — A performer: this is the one they saved it for
0:08 · 2s — The crowd giving it back: the best thing in the room
0:10 · 2s — Last song of the last summer Friday: the room for one more
0:12 · 4s — End card: STARDUST CHICAGO · LAST SUMMER FRIDAY · 710 N CLARK
Total: ~16s',
'2026-08-28', '11:00');

-- ── POST 296 · Facebook Event · Aug 28 · Last Friday of August ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Last Friday of August at Stardust Chicago

The last summer Friday before Labor Day. You know what that means.

Happy Hour 5–8pm · Doors 6pm · Open till 4am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Last Friday of August Facebook Event. Use the best crowd image from the summer. The cover should feel like an invitation to the best night of the summer.',
'', '2026-08-28', '09:00');

-- ── POST 297 · Instagram Story · Aug 29 · Last Saturday of August ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Last Saturday of August.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). The last Saturday of August — the room at its best. Bold text. Countdown sticker. Let the image carry the weight.',
'', '2026-08-29', '15:00');

-- ── POST 298 · TikTok Video · Aug 29 · Last Saturday of August ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'last saturday of august at stardust chicago. 710 n clark, river north. till 5am.',
'',
'The last Saturday of August. The room doesn''t hold back on a night like this — and you shouldn''t either. Show the full arc from doors to 5am.',
'Script: "last saturday of august. the room knows what it is."

0:00 · 2s — The bar at 6pm: happy hour, the start of the last summer Saturday
0:02 · 2s — Stage: mic live, first singer up
0:04 · 2s — 9pm: the shift — happy hour done, the room fully in it
0:06 · 2s — Midnight: full capacity, the last summer Saturday at speed
0:08 · 2s — 3am: the ones who stayed — you can see it in their faces
0:10 · 2s — Last song: 5am, the room holding on
0:12 · 4s — End card: STARDUST CHICAGO · LAST SATURDAY OF AUGUST · TILL 5AM
Total: ~16s',
'2026-08-29', '10:00');

-- ── POST 299 · Instagram Reel · Aug 29 · Last summer Saturday ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Saturday of August at Stardust.

The summer closes like this.

📍 710 N Clark · River North · Till 5am',
'#stardustchicago #karaokechicago #lastsaturdayofaugust #latesummer #chicagonightlife #riverNorth #saturday #thingstodoinchicago #chicagobar #312',
'The last summer Saturday reel. The room giving everything it has before the calendar turns. Warm, alive, the kind of night that earns the season.',
'Script: "this is how stardust closes the summer."

0:00 · 2s — The door: the last summer Saturday arriving
0:02 · 2s — Inside: the room, full and alive
0:04 · 2s — A performer on stage: this is the night
0:06 · 2s — The crowd: fully in, no holding back on the last Saturday of August
0:08 · 2s — Late: 2am, 3am — the room still going
0:10 · 2s — The last moment before the lights: summer, ending right
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · TILL 5AM
Total: ~16s',
'2026-08-29', '11:00');

-- ── POST 300 · Facebook Event · Aug 29 · Last Saturday of August ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Last Saturday of August at Stardust Chicago

This is the one. The last Saturday of summer before Labor Day weekend takes over.

Happy Hour 5–8pm · Doors 6pm · Open till 5am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Last Saturday of August Facebook Event. The best crowd photo from the whole summer as cover image. Make it feel earned.',
'', '2026-08-29', '09:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 7 · Aug 31–Sep 7 · Labor Day Weekend — the send-off
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 301 · Twitter/X Tweet · Aug 31 · Labor Day weekend tease ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'labor day weekend. stardust is open friday and saturday. the summer goes out loud. 710 n clark.',
'', '', '', '2026-08-31', '08:00');

-- ── POST 302 · Instagram Feed Post · Sep 2 · Labor Day weekend hype ──────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'Labor Day Weekend.

Stardust is open Friday and Saturday.

The summer goes out the way it came in.

📍 710 N Clark · River North · Doors 6pm',
'#stardustchicago #karaokechicago #laborday #labordayweekend #chicagonightlife #riverNorth #thingstodoinchicago #chicagobar #endofsummer #summerchicago',
'Labor Day weekend hype. The best summer crowd image you have — the room at full capacity, mid-summer energy. This is the send-off.',
'', '2026-09-02', '11:00');

-- ── POST 303 · Instagram Story · Sep 4 · Labor Day Friday ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Labor Day Weekend starts now.
Mic opens at 6. Doors open at 6.
📍 710 N Clark · Open till 4am',
'',
'Story (9:16). Labor Day Friday — this is THE night. Bold text. Countdown to 6pm. The kind of story that makes people change their plans.',
'', '2026-09-04', '14:00');

-- ── POST 304 · TikTok Video · Sep 4 · Labor Day Friday ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'labor day weekend at stardust chicago. the summer goes out the way it should. 710 n clark, river north.',
'',
'Labor Day. The biggest weekend of the summer at Stardust. Show the energy of a room that knows it''s sending the summer off right. No holding back.',
'Script: "labor day weekend. stardust chicago. the summer ends here."

0:00 · 3s — Exterior: Labor Day Friday evening, the city in its final summer weekend
0:03 · 2s — The door: people arriving like they''ve been waiting all week for this
0:05 · 2s — Bar: the Labor Day energy — everyone here with full intent
0:07 · 2s — Stage: the first performer of Labor Day weekend
0:09 · 2s — The crowd: the full room giving the summer its send-off
0:11 · 2s — Wide: Stardust on Labor Day — the summer closing in a full room
0:13 · 4s — End card: LABOR DAY WEEKEND · STARDUST CHICAGO · 710 N CLARK
Total: ~17s',
'2026-09-04', '10:00');

-- ── POST 305 · Instagram Reel · Sep 4 · Labor Day Friday ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Labor Day Weekend.

The summer goes out loud.

📍 710 N Clark · River North · Doors 6pm · Till 4am',
'#stardustchicago #karaokechicago #laborday #labordayweekend #endofsummer #chicagonightlife #riverNorth #fridaynight #thingstodoinchicago #chicagobar #312',
'Labor Day Friday reel. The summer''s final act. The room that built to this moment. Maximum energy — every shot the best of what Stardust has to offer.',
'Script: "labor day weekend. stardust. the summer''s final act."

0:00 · 2s — Clark Street: the city on Labor Day weekend — something electric in the air
0:02 · 2s — The bar: full, warm, the room that earned the season
0:04 · 2s — Stage: a performer giving the summer its send-off
0:06 · 2s — The crowd: the Labor Day room — everyone here for a reason
0:08 · 2s — The chorus: the whole room in, the season closing right
0:10 · 2s — Late night: the summer going out the way it should
0:12 · 4s — End card: STARDUST CHICAGO · LABOR DAY WEEKEND · 710 N CLARK
Total: ~16s',
'2026-09-04', '11:00');

-- ── POST 306 · Facebook Event · Sep 4 · Labor Day Friday ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Labor Day Weekend Friday at Stardust Chicago

The summer''s final Friday. River North. The mic is live at 6.

This is the one you make plans for.

Happy Hour 5–8pm · Doors 6pm · Open till 4am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Labor Day Friday Facebook Event. Best crowd image from the summer as cover. Make it feel like the send-off it is.',
'', '2026-09-04', '09:00');

-- ── POST 307 · Instagram Story · Sep 5 · Labor Day Saturday ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Labor Day Saturday at Stardust.
The summer goes out till 5am.
📍 710 N Clark',
'',
'Story (9:16). Labor Day Saturday — this is the finale. Bold text. Countdown sticker. The summer''s last night.',
'', '2026-09-05', '15:00');

-- ── POST 308 · TikTok Video · Sep 5 · Labor Day Saturday ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'labor day saturday at stardust chicago. the summer''s last night. 710 n clark, river north. till 5am.',
'',
'The last night of summer. Labor Day Saturday at Stardust. The room that closes out the season. Show the whole arc — from doors to 5am — compressed into 17 seconds of the best the summer had.',
'Script: "the last night of summer. stardust chicago. till 5am."

0:00 · 2s — Doors opening at 6pm: Labor Day Saturday beginning
0:02 · 2s — Happy hour: the last summer drinks, the room warming up one final time
0:04 · 2s — 9pm: the room alive, the season''s last night hitting full speed
0:06 · 2s — Stage: the performer who chose Labor Day Saturday for this
0:08 · 2s — The crowd at midnight: the summer''s last full room
0:10 · 2s — 4am: the ones who stayed — summer going out right
0:12 · 3s — 5am: lights coming up, the summer officially over
0:15 · 4s — End card: STARDUST CHICAGO · LABOR DAY 2026 · THE SUMMER CLOSED HERE
Total: ~19s',
'2026-09-05', '10:00');

-- ── POST 309 · Instagram Reel · Sep 5 · Labor Day Saturday ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Labor Day Saturday.

The summer closes at Stardust.

710 N Clark · River North · Till 5am',
'#stardustchicago #karaokechicago #laborday #labordayweekend #endofsummer #chicagonightlife #riverNorth #saturday #thingstodoinchicago #chicagobar #312 #summerchicago',
'The summer''s final night. Labor Day Saturday reel — the most important video of the summer run. The room from start to 5am close. Every shot should feel like a memory in the making.',
'Script: "this is how summer ends in chicago."

0:00 · 2s — Exterior: Labor Day Saturday evening — the last summer night
0:02 · 2s — The door: one final time this summer
0:04 · 2s — Bar: the room for the last summer night — full and alive
0:06 · 2s — Stage: the performer who got the last great summer karaoke night
0:08 · 2s — The crowd: the room in its final full summer form
0:10 · 2s — 5am: lights up, summer over, the room knowing what just happened
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · THE SUMMER CLOSED HERE
Total: ~16s',
'2026-09-05', '11:00');

-- ── POST 310 · Facebook Event · Sep 5 · Labor Day Saturday ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Event', 'draft',
'Karaoke Night — Labor Day Saturday at Stardust Chicago

The last night of summer. River North. The mic is live at 6. The summer closes at 5am.

This is the one.

Happy Hour 5–8pm · Doors 6pm · Open till 5am · 710 N Clark St, River North
Free to sing · No cover',
'',
'Labor Day Saturday Facebook Event. The best image of the summer as cover. Make it feel like the finale it is.',
'', '2026-09-05', '09:00');

-- ── POST 311 · Twitter/X Tweet · Sep 7 · Labor Day recap ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust labor day weekend: two full nights, last singer saturday went at 4:55am. that''s how you close a summer. see you in the fall.',
'', '', '', '2026-09-07', '10:00');

-- ── POST 312 · Instagram Feed Post · Sep 7 · Summer recap ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Post', 'draft',
'That was the summer.

Back Friday.

📍 710 N Clark · River North',
'#stardustchicago #karaokechicago #endofsummer #laborday #chicagonightlife #riverNorth #chicagobar #312 #seeinginthefallchicago',
'End-of-summer recap. The single best image from the entire summer run — the room at its most alive. Let it speak for itself. One image, minimal caption. The summer earned it.',
'', '2026-09-07', '13:00');

END $$;
