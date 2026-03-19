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
'Three nights this week. The room opens Thursday.

Thu · Fri · Sat · Doors 8pm
📍 710 N Clark, River North',
'#karaokechicago #stardustchicago #riverNorth #chicagonightlife #thingstodoinchicago #karaokebar',
'Three quick clips — one per night. Thursday: crowd finding their footing. Friday: singer mid-peak. Saturday: the room wall-to-wall. End card lists the nights.',
'Script: "three nights. same room. you should come."

0:00 · 2s — Thursday: crowd warming up, the night still early
0:02 · 2s — Friday: singer at mic, the room fully behind them
0:04 · 2s — Saturday: wall-to-wall, no empty space left
0:06 · 2s — Bar in motion — drinks, movement, Friday energy
0:08 · 2s — Pull back: the whole Saturday room in one shot
0:10 · 4s — End card: THU · FRI · SAT · STARDUST CHICAGO · 710 N CLARK
Total: ~14s',
'2026-05-11', '11:00');

-- ── POST 112 · TikTok Video · May 12 · Tuesday hype for the week ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'karaoke three nights a week at stardust. thu fri sat. 710 n clark.',
'',
'Short clips from recent weeks. Quiet start, then the room fills. Let the energy build on its own.',
'Script: "thursday. friday. saturday. stardust."

0:00 · 1.5s — Mic lit, empty stage — before the night starts
0:01 · 1.5s — First person up — still nervous, still going
0:03 · 1.5s — Crowd reaction: someone in the front row losing it
0:04 · 1.5s — Different night, different singer, same room
0:06 · 1.5s — Bar deep in it — orders, movement, noise
0:07 · 1.5s — Pull back: room at capacity, you can feel the mass of it
0:09 · 1.5s — A face in the crowd singing every word
0:10 · 2s — On-screen: "EVERY THU FRI SAT"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-12', '10:00');

-- ── POST 113 · Twitter/X Tweet · May 13 · Wednesday countdown ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'karaoke starts tomorrow. stardust. thursday night. 710 n clark.',
'', '', '2026-05-13', '08:00');

-- ── POST 114 · Instagram Story · May 14 · Thursday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'The room opens tonight.
Thursday karaoke · 8pm
📍 710 N Clark',
'',
'Story (9:16). Warm crowd shot or bar with the lights down low. Countdown sticker to 8pm. Text overlay: "TONIGHT · 8PM".',
'2026-05-14', '16:00');

-- ── POST 115 · TikTok Video · May 14 · Thursday POV ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday night at stardust. you walk in not knowing anyone. you leave knowing the whole room.',
'',
'Handheld POV from outside the door through the crowd to the stage. Let the audio do the work. No narration.',
'Script: "thursday at stardust. one door, one room, one mic."

0:00 · 2s — 710 N Clark exterior: neon on, the door waiting
0:02 · 2s — Step inside — the room opens, warm light, people already here
0:04 · 2s — Push toward the bar — faces, drinks, the sound of it
0:06 · 2s — Turn toward the stage — singer in the distance, crowd between you
0:08 · 2s — Closer now — the voice gets louder, the room tighter
0:10 · 2s — Singer fills frame — mid-song, somewhere else entirely
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-05-14', '10:00');

-- ── POST 116 · Facebook Post · May 14 · Thursday event post ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Thursday karaoke is on tonight at Stardust Chicago.

The room opens at 8pm. The mic is available all night. You don''t need to be good — the crowd doesn''t require it.

710 N Clark, River North · Open till 2am',
'',
'Thursday crowd photo — room half-full, warm light, someone mid-song in the background.',
'2026-05-14', '13:00');

-- ── POST 117 · Instagram Reel · May 15 · Friday night open ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago. The mic is open till 4am.

710 N Clark · River North',
'#karaokechicago #fridaynight #chicagobar #stardustchicago #latenightchicago #riverNorth',
'Friday arrival sequence. Start with the empty room, end with it full. The night as a single continuous motion.',
'Script: "it''s friday. stardust opens at 8. we go till 4."

0:00 · 2s — Stage lit, no one in the room yet — the night before it starts
0:02 · 2s — First people through the door, coats still on
0:04 · 2s — Bar: first round poured, the energy shifting
0:06 · 2s — First singer of the night claims the mic
0:08 · 2s — Room filling — the Friday crowd finding its rhythm
0:10 · 2s — Pull back: the whole room in motion
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-05-15', '11:00');

-- ── POST 118 · TikTok Video · May 15 · Friday fast cut ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust is open tonight. friday. 710 n clark. till 4am.',
'',
'Pattern F — fast cuts, 1s per shot. Raw crowd energy all the way through. No narration, on-screen text at the end only.',
'Script: "friday. open till 4. stardust."

0:00 · 1s — Neon on, exterior, the door
0:01 · 1s — Room wide, still early, full of potential
0:02 · 1s — Singer approaching the mic
0:03 · 1s — First note: the room shifts
0:04 · 1s — Bar: three people ordering at once
0:05 · 1s — Mid-song crowd, packed in, moving
0:06 · 1s — Face in the crowd, completely absorbed
0:07 · 1s — Wide room — wall-to-wall Friday
0:08 · 1s — Singer at the highest note
0:09 · 1s — Someone in the crowd who knows every word
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-15', '10:00');

-- ── POST 119 · Twitter/X Tweet · May 15 · Friday post ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust is open. friday karaoke till 4am. 710 n clark.',
'', '', '2026-05-15', '08:00');

-- ── POST 120 · TikTok Video · May 16 · Saturday uncut ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday at stardust goes till 5am. 710 n clark.',
'',
'Pattern A — one uncut clip, no edits, raw audio. The room at Saturday peak. The shot that makes someone regret not being there.',
'Script: "saturday night at stardust. no filter needed."

0:00 · 20s — One uncut clip. Raw audio. The room mid-Saturday — whoever is on the mic, however the crowd is answering. Let it breathe. No cuts, no text, just the room being itself.
0:20 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~24s',
'2026-05-16', '10:00');

-- ── POST 121 · Instagram Reel · May 16 · Saturday crowd ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday at Stardust Chicago. The room that stays till 5am.

710 N Clark · River North',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #riverNorth #till5am',
'Peak Saturday crowd footage. Multiple singers, multiple crowd reactions. The room as the main character.',
'Script: "saturday at stardust. the night that earns its hours."

0:00 · 2s — Wide room: Saturday in full swing, every seat gone
0:02 · 2s — Singer mid-song, leaning into it
0:04 · 2s — Crowd: multiple faces, all of them in
0:06 · 2s — Bar: packed, drinks moving, the whole room humming
0:08 · 2s — Next singer — different song, same room, same pull
0:10 · 2s — Wide again: the room that doesn''t thin out
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-05-16', '11:00');

-- ── POST 122 · Facebook Post · May 17 · Weekend recap ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Three nights in the books. Three more coming next week.

Stardust Chicago is open every Thursday, Friday, and Saturday.
Doors at 8pm · 710 N Clark, River North

See you back here.',
'',
'Best single crowd shot from the weekend — room full, stage lit, someone mid-song.',
'2026-05-17', '13:00');

-- ── POST 123 · Instagram Carousel · May 19 · Venue feature ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'Before anyone arrives, the room already knows what it''s going to be.

Slide 1: Stage lit, no one yet
Slide 2: Mic detail — the point of all of it
Slide 3: Bar lined and ready
Slide 4: First crowd filtering in
Slide 5: The room at full capacity

710 N Clark · River North · Thu Fri Sat',
'#stardustchicago #karaokebar #chicagobar #riverNorth #karaokechicago #chicagonightlife #riverNorthchicago',
'5-slide venue carousel. Sequence from empty to packed. Each frame lets the room do the talking — no text clutter.',
'2026-05-19', '11:00');

-- ── POST 124 · TikTok Video · May 21 · Thursday setup BTS ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust gets ready for thursday night. 710 n clark. doors at 8.',
'',
'Pattern C — room transformation. Empty house lights to stage-ready. The setup that makes the night possible.',
'Script: "every thursday starts like this."

0:00 · 2s — House lights up, empty room — the before
0:02 · 2s — Mics lifted, tapped, checked — the ritual
0:04 · 2s — Stage wash replacing house lights — the room changing
0:06 · 2s — QR cards laid on tables, one by one
0:08 · 2s — Bar stocked: bottles in a row, glasses clean and waiting
0:10 · 2s — Final wide: room ready, doors closed, but not for long
0:12 · 4s — End card: STARDUST CHICAGO · TONIGHT · 710 N CLARK
Total: ~16s',
'2026-05-21', '10:00');

-- ── POST 125 · Instagram Story · May 21 · Thursday countdown ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday night.
The mic opens at 8pm.
📍 710 N Clark',
'',
'Story. Low-lit bar, warm and inviting. Countdown sticker set to 8pm. Keep it clean.',
'2026-05-21', '16:00');

-- ── POST 126 · Instagram Reel · May 22 · Crowd singing along ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The singer is up there. But the room is the show.

Stardust Chicago · 710 N Clark',
'#karaokechicago #stardustchicago #fridaynight #chicagonightlife #singalong #karaokenight',
'Crowd-forward footage. Singer stays in the background. Let faces, arms, and mouths carry the whole thing.',
'Script: "everyone on stage. singer just has the mic."

0:00 · 2s — Stage behind the crowd — they''re the frame, singer is the background
0:02 · 2s — Close: a face mouthing every single word
0:04 · 2s — Two people arms around each other, completely gone
0:06 · 2s — Pan across: everyone in the same moment
0:08 · 2s — Singer glances back, the room glances forward — the exchange
0:10 · 2s — Wide: the whole room in it together
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-22', '11:00');

-- ── POST 127 · TikTok Video · May 22 · Friday night open ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust is open. friday. 710 n clark. doors at 8, till 4am.',
'',
'Pattern G — POV walkthrough. Door to bar to stage. The night arriving.',
'Script: "friday night starts here."

0:00 · 2s — 710 N Clark exterior: neon on, the door open
0:02 · 2s — First step in — the room arriving in frame
0:04 · 2s — Bar: first round happening, the night taking shape
0:06 · 2s — Stage lit, mic in center frame
0:08 · 2s — First singer of Friday claiming the room
0:10 · 2s — The crowd forming behind them
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-05-22', '10:00');

-- ── POST 128 · Twitter/X Tweet · May 22 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke is on at stardust. open now. 710 n clark.',
'', '', '2026-05-22', '20:00');

-- ── POST 129 · TikTok Video · May 23 · Saturday peak ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust saturday goes till 5am. the 2am crowd is its own thing. 710 n clark.',
'',
'Pattern H — late night. Past midnight. The people who made the decision to stay.',
'Script: "2am at stardust on a saturday."

0:00 · 1.5s — Wide room, well past midnight, still shoulder-to-shoulder
0:01 · 1.5s — Singer mid-song — the hour doesn''t show on their face
0:03 · 1.5s — Close: the "we are not leaving" expression
0:04 · 1.5s — Bar still running full — 2am and no signs of stopping
0:06 · 1.5s — Next singer — completely different song, same level of commitment
0:07 · 1.5s — Crowd peaks — the late-night Saturday moment
0:09 · 1.5s — Wide: the room that outlasted everyone''s plans
0:10 · 2s — On-screen: "TILL 5AM"
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · 710 N CLARK
Total: ~16s',
'2026-05-23', '10:00');

-- ── POST 130 · Instagram Reel · May 23 · Saturday late night ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Nobody goes home at midnight on a Saturday.

710 N Clark · River North · Till 5am',
'#saturdaynight #latenightchicago #karaokechicago #stardustchicago #till5am #riverNorth',
'Late Saturday — the room past midnight, still full. Show the people who stayed, not the people who left.',
'Script: "stardust saturday. midnight is the middle."

0:00 · 2s — On-screen timestamp or clock: somewhere past midnight
0:02 · 2s — Room still packed — every seat taken, every face alive
0:04 · 2s — Singer past the halfway point, the crowd fully there with them
0:06 · 2s — Crowd reaction — the kind that only happens when it''s late and people are committed
0:08 · 2s — Bar still pouring — the room has no interest in winding down
0:10 · 2s — Wide: late Saturday Stardust in full motion
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-05-23', '11:00');

-- ── POST 131 · Instagram Carousel · May 26 · Karaoke culture post ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'Nobody walks in perfect. Nobody walks out wishing they hadn''t.

Slide 1: The nervous first-timer at the mic
Slide 2: The regular who owns the room
Slide 3: The crowd that makes it worth it
Slide 4: The mic — the whole reason anyone''s here
Slide 5: The night, summed up

Stardust Chicago · Thu Fri Sat · 710 N Clark',
'#stardustchicago #karaokechicago #chicagonightlife #karaokenight #chicagobar #getup #karaokebar',
'5 real karaoke moment slides — raw and human. First-timers, regulars, crowd reactions, mic detail. No posed shots.',
'2026-05-26', '11:00');

-- ── POST 132 · TikTok Video · May 28 · Thursday first-timer ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first time at stardust. you''ll know what to do when you get there.',
'',
'Pattern B — person journey. One first-timer from the sidewalk to the mic. Authentic, a little unsure, completely real.',
'Script: "everyone has a first time at stardust."

0:00 · 2s — The exterior: sign, door, the choice on the sidewalk
0:02 · 2s — Step in — the room opens up, a lot to take in
0:04 · 2s — Find a table — settle, look around, absorb it
0:06 · 2s — QR code in hand — the song list, the decision
0:08 · 2s — Watch someone else go up — the room showing you how it''s done
0:10 · 2s — Your turn: the walk to the mic
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-05-28', '10:00');

-- ── POST 133 · Facebook Post · May 28 · Thursday reminder ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Thursday karaoke is tonight at Stardust Chicago.

The room at 710 N Clark has been hosting singers of every ability since we opened. Nobody cares if you''re good. The crowd is already on your side before you hit the first note.

Doors at 8pm · Open till 2am · River North',
'',
'A candid from a recent Thursday — someone laughing mid-song, or a crowd reaction that tells the whole story.',
'2026-05-28', '13:00');

-- ── POST 134 · Instagram Reel · May 29 · Singer spotlight ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The mic is open. That''s the whole invitation.

Stardust Chicago · 710 N Clark',
'#karaokechicago #stardustchicago #takethemic #fridaynight #chicagonightlife #openmic',
'One singer, one song, minimal cuts. Start with the walk up, end with the crowd. Let the performance carry it.',
'Script: "one mic. open to anyone."

0:00 · 2s — Mic in frame, stage empty — the invitation standing
0:02 · 3s — Someone making the decision, walking toward it
0:05 · 4s — Mid-song: no looking back, fully in it
0:09 · 3s — The crowd arriving at their answer
0:12 · 4s — End card: STARDUST CHICAGO · THE MIC IS OPEN · 710 N CLARK
Total: ~16s',
'2026-05-29', '11:00');

-- ── POST 135 · TikTok Video · May 29 · Friday fast cut ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust. friday. till 4am. 710 n clark.',
'',
'Pattern F — 1-second cuts, no narration. Let the cuts do what the words can''t. On-screen text at the end only.',
'Script: "friday night."

0:00 · 1s — Exterior neon, the door lit
0:01 · 1s — Crowd at the bar, drinks up
0:02 · 1s — Singer takes the mic
0:03 · 1s — First note: the room tilts
0:04 · 1s — Crowd reacts
0:05 · 1s — Second singer, totally different song
0:06 · 1s — Two people singing the same words together
0:07 · 1s — Wide room — standing room only
0:08 · 1s — Mic close-up, someone absolutely going for it
0:09 · 1s — Crowd peak moment
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-05-29', '10:00');

-- ── POST 136 · Twitter/X Tweet · May 29 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust is open tonight. friday karaoke till 4am. 710 n clark.',
'', '', '2026-05-29', '08:00');

-- ── POST 137 · TikTok Video · May 30 · Saturday uncut moment ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'you can''t edit a saturday at stardust. you just have to be in it.',
'',
'Pattern A — one uncut clip, no music overlay, no editing. Just the room at maximum. Let the raw audio be the whole argument.',
'Script: "no edits. just stardust on a saturday."

0:00 · 22s — One uncut clip. Raw audio. The room at full Saturday — whoever is up, however the crowd is responding. No cuts. No text. The room making its own case.
0:22 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~26s',
'2026-05-30', '10:00');

-- ── POST 138 · Instagram Reel · May 30 · Memorial Day weekend ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Memorial Day weekend. The room knows it.

710 N Clark · River North · Tonight',
'#memorialdayweekend #chicagonightlife #karaokechicago #stardustchicago #saturdaynight #riverNorth',
'Saturday Memorial Day weekend footage — the crowd carrying holiday energy. Fuller, louder, a little more willing.',
'Script: "memorial day saturday at stardust chicago."

0:00 · 2s — Room in pre-show mode: the anticipation of a long weekend
0:02 · 2s — Early arrivals — holiday weekend, lighter mood, already ready
0:04 · 2s — Stage lit, the room coming to temperature
0:06 · 2s — First singer: the weekend officially beginning
0:08 · 2s — Crowd building — that particular holiday weekend energy
0:10 · 2s — Wide: a Saturday that knows there''s no Sunday alarm
0:12 · 4s — End card: STARDUST CHICAGO · MEMORIAL DAY WEEKEND · 710 N CLARK
Total: ~16s',
'2026-05-30', '11:00');

-- ── POST 139 · Instagram Story · May 30 · Saturday tonight ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Memorial Day Weekend 🎤
Stardust is open tonight · 8pm
710 N Clark',
'',
'Story. Warm crowd or venue shot — holiday weekend energy without overselling it. "TONIGHT" text overlay, clean.',
'2026-05-30', '16:00');

-- ── POST 140 · Facebook Post · Jun 2 · June opening announcement ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'June at Stardust Chicago starts this week.

Karaoke every Thursday, Friday, and Saturday. Doors at 8pm. The warm nights are the best nights.

710 N Clark, River North',
'',
'Summer-toned venue shot — the bar or stage with warm light. The room ready for June.',
'2026-06-02', '13:00');

-- ── POST 141 · Twitter/X Tweet · Jun 2 · June week preview ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'june karaoke starts this week. stardust. thu fri sat. 710 n clark.',
'', '', '2026-06-02', '08:00');

-- ── POST 142 · TikTok Video · Jun 4 · Thursday summer vibes ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first thursday of june at stardust. 710 n clark. the room''s been waiting.',
'',
'First Thursday of June. Let the season show without narrating it — lighter clothes, longer evening, the room feeling it.',
'Script: "june karaoke. stardust. tonight."

0:00 · 2s — Wide room, warm June Thursday light, the night still early
0:02 · 2s — People arriving in lighter clothes — the season showing up
0:04 · 2s — Bar mid-motion: the Thursday crowd settling in
0:06 · 2s — First singer of June takes the mic
0:08 · 2s — Crowd building — warm-night karaoke energy
0:10 · 2s — Wide: a Thursday that feels like summer
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-04', '10:00');

-- ── POST 143 · Instagram Reel · Jun 5 · Friday summer night ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Summer Fridays at Stardust Chicago hit different.

Open till 4am. 710 N Clark, River North.',
'#summernightschicago #fridaynight #karaokechicago #stardustchicago #chicagonightlife #riverNorthbar',
'Friday in June — let the summer crowd carry it. Warm light, lighter energy, the season in the room.',
'Script: "summer friday at stardust. the mic stays open till 4."

0:00 · 2s — Exterior: warm June evening on N Clark, the door open
0:02 · 2s — Inside: summer crowd arriving, the night breathing differently
0:04 · 2s — Bar: summer Friday drinks, the room finding its pace
0:06 · 2s — Singer at the mic, crowd close around them
0:08 · 2s — Energy peaks — the warm-weather Friday taking hold
0:10 · 2s — Wide: summer Friday at Stardust, full capacity
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-05', '11:00');

-- ── POST 144 · TikTok Video · Jun 5 · Friday night ───────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'summer fridays at stardust. 710 n clark. till 4am.',
'',
'Pattern F — fast cuts, warm summer Friday energy. Let the June crowd speak for itself.',
'Script: "summer fridays. stardust chicago."

0:00 · 1.5s — Exterior: warm evening, door open, the street in June
0:01 · 1.5s — First crowd through the door
0:03 · 1.5s — Bar: summer round being ordered
0:04 · 1.5s — Stage lit, mic in center frame
0:06 · 1.5s — Singer up — Friday summer energy, fully in it
0:07 · 1.5s — Crowd singing along — the room joining in
0:09 · 1.5s — Wide room: packed summer Friday
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-06-05', '10:00');

-- ── POST 145 · Instagram Story · Jun 5 · Friday tonight ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Warm night. Open mic.
Stardust · Doors 8pm · Till 4am
📍 710 N Clark',
'',
'Story. Warm June evening outside, or the bar lit low inside. "TONIGHT · FRIDAY" text overlay. Clean.',
'2026-06-05', '16:00');

-- ── POST 146 · TikTok Video · Jun 6 · Saturday summer peak ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust. june. till 5am. 710 n clark.',
'',
'Peak summer Saturday. The room as hot as it gets. Pattern D — crowd-forward, singer just part of the atmosphere.',
'Script: "june saturdays at stardust chicago."

0:00 · 2s — Wide: summer Saturday crowd, the room past capacity
0:02 · 2s — Singer peaking — the June heat in the room with them
0:04 · 2s — Crowd faces: no one is standing still
0:06 · 2s — Bar: summer Saturday at full tilt
0:08 · 2s — Next singer — the rotation never slows
0:10 · 2s — Wide again: a room that has no interest in ending
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-06', '10:00');

-- ── POST 147 · Instagram Reel · Jun 6 · Saturday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The summer version of Stardust on a Saturday.

Same mic. Different energy. Still till 5am.

710 N Clark · River North',
'#saturdaynight #summernightschicago #karaokechicago #stardustchicago #latenightchicago #till5am',
'Summer Saturday at full heat. The crowd in their element. Warm light, the room feeling different in June.',
'Script: "stardust chicago. saturday night. summer."

0:00 · 2s — Wide room: summer Saturday, warm and full
0:02 · 2s — Singer leaning in — the summer crowd making them bigger
0:04 · 2s — Crowd close-up: people in their element, June versions of themselves
0:06 · 2s — Bar in motion: summer Saturday drinks, the room alive
0:08 · 2s — Someone in the crowd giving every word back to the singer
0:10 · 2s — Wide: summer Saturday Stardust at peak heat
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-06', '11:00');

-- ── POST 148 · Facebook Post · Jun 7 · Weekend recap + next week preview ─────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'First summer weekend at Stardust Chicago is done. The room delivered.

Back Thursday. Karaoke every Thu · Fri · Sat.
Doors at 8pm · 710 N Clark, River North',
'',
'Weekend crowd photo — warm summer tone. Singer mid-song or crowd at peak. Let the image do the talking.',
'2026-06-07', '13:00');

-- ── POST 149 · Instagram Carousel · Jun 9 · Karaoke how-to ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'The whole thing is easier than you think.

Slide 1: Scan the QR code at your table
Slide 2: Pick any song — the list is longer than you expect
Slide 3: Your name gets called
Slide 4: You walk up and take the mic
Slide 5: The room is already with you

710 N Clark · River North · Thu Fri Sat',
'#karaoke101 #stardustchicago #karaokechicago #firsttimers #chicagonightlife #howkaraokeworks',
'5-slide how-to carousel. Friendly and clear. Real photos of each step — QR code at a table, mic being held, crowd cheering. No stock imagery.',
'2026-06-09', '11:00');

-- ── POST 150 · TikTok Video · Jun 11 · Wednesday hype ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'three nights of karaoke this week at stardust. thu fri sat. 710 n clark.',
'',
'Midweek reminder. Three quick best moments — one per night. On-screen text builds to the weekend.',
'Script: "this thursday. this friday. this saturday."

0:00 · 2s — Best recent Thursday moment: crowd at its warmest
0:02 · 2s — Best recent Friday moment: singer claiming the room
0:04 · 2s — Best recent Saturday moment: the crowd reacting at peak
0:06 · 2s — On-screen: "THIS THURSDAY · 710 N CLARK"
0:08 · 2s — On-screen: "THIS FRIDAY · TILL 4AM"
0:10 · 2s — On-screen: "THIS SATURDAY · TILL 5AM"
0:12 · 4s — End card: STARDUST CHICAGO · THU FRI SAT
Total: ~16s',
'2026-06-11', '10:00');

-- ── POST 151 · Twitter/X Tweet · Jun 11 · Week preview ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust is open three nights this week. thursday friday saturday. 710 n clark.',
'', '', '2026-06-11', '08:00');

-- ── POST 152 · TikTok Video · Jun 12 · Thursday POV ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday karaoke at stardust. this is how the night goes. 710 n clark.',
'',
'Pattern G — POV walkthrough. Door to table to the decision to sing. Thursday in real time.',
'Script: "every thursday at stardust starts like this."

0:00 · 2s — The front door: the commitment
0:02 · 2s — Room opens up — warm, already alive
0:04 · 2s — Bar: first drink, the room becoming real
0:06 · 2s — Someone else mid-song — watching, feeling the room
0:08 · 2s — QR code in hand — the song list, the choice
0:10 · 2s — Wide: a Thursday running at full energy
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-12', '10:00');

-- ── POST 153 · Instagram Reel · Jun 12 · Thursday crowd energy ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday at Stardust. The regulars and the first-timers end up in the same room.

710 N Clark · River North · Every Thursday',
'#thursdaynight #karaokechicago #stardustchicago #riverNorth #chicagonightlife #karaokenight',
'Thursday crowd energy — show both kinds of people. The regular who owns the room, the newcomer figuring it out. The room bringing them together.',
'Script: "thursday at stardust. the room doesn''t ask how many times you''ve been."

0:00 · 2s — Room building: Thursday finding its pace
0:02 · 2s — A regular at ease — they know every inch of this place
0:04 · 2s — A first-timer standing up — the decision visible on their face
0:06 · 2s — The crowd meeting them: cheering before the first note
0:08 · 2s — Singer at the mic, crowd behind them — the whole thing working
0:10 · 2s — Wide: Thursday at Stardust doing what it does
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-12', '11:00');

-- ── POST 154 · Instagram Story · Jun 12 · Thursday tonight ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday karaoke is on tonight.
Doors 8pm · 710 N Clark
📍 River North',
'',
'Story. Bar shot, warm light, inviting. "TONIGHT · THURSDAY" text overlay. Keep it simple.',
'2026-06-12', '16:00');

-- ── POST 155 · TikTok Video · Jun 13 · Friday night ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust is open tonight. friday. 710 n clark. till 4am.',
'',
'Friday arrival to peak. The arc of the night in under twenty seconds.',
'Script: "friday at stardust. start to peak."

0:00 · 2s — Doors opening: the first wave of Friday night
0:02 · 2s — Bar filling up — summer Friday, everyone arriving at once
0:04 · 2s — Stage lit, the room holding its breath
0:06 · 2s — First singer: the night begins properly
0:08 · 2s — Crowd at Friday peak — the room found its speed
0:10 · 2s — Wide: Friday at Stardust, the whole thing
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-13', '10:00');

-- ── POST 156 · Instagram Reel · Jun 13 · Friday late night ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'1am on a Friday at Stardust Chicago. The room has no interest in stopping.

710 N Clark · River North · Till 4am',
'#fridaynight #latenightchicago #karaokechicago #stardustchicago #chicagonightlife #till4am',
'Late Friday. Show the hour and the crowd in the same frame. The people who stayed are the whole story.',
'Script: "friday at stardust. the late version."

0:00 · 2s — Timestamp on screen: past 1am, the hour that separates the committed
0:02 · 2s — Room still full — no one made for the door
0:04 · 2s — Singer at the mic: the late Friday slot, giving everything
0:06 · 2s — Two people in the crowd sharing the same song
0:08 · 2s — Bar running: 1am Friday is barely the middle
0:10 · 2s — Wide: the late Friday room at full energy
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-13', '11:00');

-- ── POST 157 · Twitter/X Tweet · Jun 13 · Friday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'friday karaoke at stardust. open tonight. 710 n clark. till 4am.',
'', '', '2026-06-13', '08:00');

-- ── POST 158 · TikTok Video · Jun 14 · Saturday season closer vibe ──────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday at stardust. every week. 710 n clark. till 5am.',
'',
'Pattern A — one uncut clip. The room at its highest. No editing required, no narration needed. Let the room close the argument.',
'Script: "stardust. saturday. every week."

0:00 · 20s — One uncut clip. The room at full Saturday peak. Raw audio. No cuts, no overlay. The room at 710 N Clark making the only case it needs to make.
0:20 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM · 710 N CLARK
Total: ~24s',
'2026-06-14', '10:00');

-- ── POST 159 · Instagram Reel · Jun 14 · Saturday season statement ──────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago.

The mic is open every week. So is the bar.
📍 710 N Clark, River North · Till 5am',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #till5am #riverNorth',
'The Saturday statement reel. Best crowd footage, best singer moments, the room at its most itself. Let it speak.',
'Script: "saturday at stardust. this is what it is."

0:00 · 2s — Wide: Saturday at Stardust, full capacity, the room in full voice
0:02 · 2s — Singer who owns the moment — the performance the crowd came for
0:04 · 2s — The crowd answering: the room responding as one
0:06 · 2s — Bar in motion: Saturday night at 710 N Clark
0:08 · 2s — Late in the night, room still full — the people who never left
0:10 · 2s — Wide, final: the room that goes till 5am
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-14', '11:00');

END $$;
