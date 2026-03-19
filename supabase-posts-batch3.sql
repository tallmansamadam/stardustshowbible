-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Social Posts Batch 3
-- Date range: June 15 – July 19, 2026
-- Reel-heavy. Every Video/Reel/Stitch post includes a full video_script.
-- All posts include post_time based on platform best practices.
-- Run AFTER supabase-posts-batch2.sql (does NOT delete existing posts).
--
-- BEFORE RUNNING: Replace 'YOUR_USER_ID_HERE' with your actual Supabase user ID.
-- ─────────────────────────────────────────────────────────────────────────────

DO $$
DECLARE
  uid uuid := 'YOUR_USER_ID_HERE';
BEGIN

-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 1 · Jun 15–21 · Summer is here — warm nights, outdoor-to-indoor energy
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 200 · Twitter/X Tweet · Jun 15 · Summer opener ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'summer is officially a reason to be out. stardust is open thursday, friday, saturday. 710 n clark.',
'', '', '', '2026-06-15', '08:00');

-- ── POST 201 · TikTok Video · Jun 15 · Summer launch ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'summer just started and stardust is already the answer.',
'',
'Summer opener. Shoot exteriors on a warm evening — the building lit, the street alive — then move inside to the room filling up. Natural light transition, no filters. Let the heat tell the story.',
'Script: "summer. stardust chicago. already."

0:00 · 3s — Exterior: 710 N Clark in warm evening light, people heading toward the door
0:03 · 2s — The threshold: door swings open, sound and light pour out
0:05 · 2s — Bar lit warm, first drinks going out, the room just getting started
0:07 · 2s — Stage: mic in stand, light on, a singer stepping up
0:09 · 2s — First song of the summer — crowd leans in before the chorus
0:11 · 2s — Wide room, the night arriving
0:13 · 4s — End card: STARDUST CHICAGO · THU FRI SAT · 710 N CLARK
Total: ~17s',
'2026-06-15', '10:00');

-- ── POST 202 · Instagram Reel · Jun 15 · Summer is here ──────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The summer nights at Stardust are a specific kind of good.

Thu · Fri · Sat · Doors 8pm
📍 710 N Clark, River North',
'#stardustchicago #karaokechicago #summerchicago #chicagonightlife #riverNorth #thingstodoinchicago #karaokebar',
'Warm-light summer opener. Exterior dusk shot bleeding into the interior glow. The room filling from nearly empty to alive. Golden hour energy stays inside.',
'Script: "summer at stardust. three nights a week. the rest is yours."

0:00 · 2s — Exterior: fading daylight on Clark St, the Stardust sign lit
0:02 · 2s — Door held open — the sound escaping into the warm night
0:04 · 2s — Bar close-up: condensation on a cold glass, warm glow behind it
0:06 · 2s — Singer on stage, crowd drifting closer without realizing it
0:08 · 2s — Two people singing together at the edge of the room — they just met
0:10 · 2s — Wide room at full summer capacity
0:12 · 4s — End card: STARDUST CHICAGO · SUMMER 2026 · 710 N CLARK
Total: ~16s',
'2026-06-15', '11:00');

-- ── POST 203 · Instagram Story · Jun 18 · Thursday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Thursday night at Stardust.
Doors 8pm · Open till 2am
📍 710 N Clark',
'',
'Story (9:16). Interior shot — warm bar light, the room at that early Thursday energy before the crowd really hits. Text overlay bold and clean. Countdown sticker to 8pm.',
'', '2026-06-18', '16:00');

-- ── POST 204 · TikTok Video · Jun 18 · Thursday summer heat ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'june thursday at stardust. the heat followed everyone inside.',
'',
'Summer Thursday vibe — shoot when the windows are still open, that warm evening air mixing with the bar smell and the sound. Let the looseness of a hot june night do the work. No staging.',
'Script: "june. thursday. stardust. the room is warm before anyone even sings."

0:00 · 2s — Wide: windows cracked, evening light still in the room, crowd settling in
0:02 · 2s — Close on two people at the bar — summer-loose, no plans to leave early
0:04 · 2s — The songbook going around — someone circling their choice
0:06 · 2s — Singer at mic: first song of the night, nobody nervous yet
0:08 · 2s — Crowd reaction — that easy june laughter
0:10 · 2s — Wide room, the Thursday night fully arrived
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-18', '10:00');

-- ── POST 205 · Instagram Reel · Jun 19 · Friday summer night ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday in summer at Stardust Chicago. The kind of night that earns the weekend.

710 N Clark · River North · Open till 4am',
'#fridaynight #stardustchicago #karaokechicago #summerchicago #latenightchicago #riverNorth #chicagonightlife',
'Friday summer night reel. Shoot the room at that mid-evening peak — around 11pm when it''s fullest and loosest. Let the natural crowd sound carry the energy.',
'Script: "friday at stardust. nobody''s thinking about tomorrow."

0:00 · 2s — Exterior: warm night, the line outside moving, 710 N Clark lit up
0:02 · 2s — Inside: the bar at full Friday pressure — everyone in
0:04 · 2s — Singer mid-chorus, no hesitation, arms out
0:06 · 2s — Crowd responding — the whole room at once
0:08 · 2s — Close on a face: eyes closed, singing every word
0:10 · 2s — Bar at 1am — still going, no one asking for the check
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-19', '11:00');

-- ── POST 206 · TikTok Video · Jun 19 · Friday POV ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the walk into stardust on a friday night is its own thing.',
'',
'POV walk-in on a summer Friday. Handheld from the sidewalk through the door and into the crowd. No cuts until the singer comes into frame. Raw audio only — let the sound build as you move through the door.',
'Script: "friday. 710 n clark. walk in."

0:00 · 2s — POV: standing on Clark St, summer night, sound leaking from the door
0:02 · 2s — Push through — sound doubles, warm light hits
0:04 · 2s — Moving through the crowd — faces, drinks, the room in motion
0:06 · 2s — Pass the bar — bartender mid-pour, doesn''t look up
0:08 · 2s — Turning toward the stage — a singer coming into frame
0:10 · 2s — Stage fills the shot — full voice, full room behind you
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-06-19', '10:00');

-- ── POST 207 · TikTok Video · Jun 20 · Saturday summer uncut ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'first real saturday of summer at stardust. the room knew.',
'',
'One uncut clip. Saturday night at peak — whatever is happening on stage is secondary to the room itself. Let it breathe. No edits. Raw audio.',
'Script: "saturday. first real summer weekend. stardust chicago."

0:00 · 22s — One uncut clip, raw audio. Saturday peak: the stage, the crowd, the room as a single warm loud thing. Nobody staged, nothing forced. The first summer Saturday doing exactly what it should.
0:22 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~26s',
'2026-06-20', '10:00');

-- ── POST 208 · Instagram Reel · Jun 20 · Saturday peak crowd ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'First Saturday of summer at Stardust Chicago. The room didn''t need warming up.

710 N Clark · River North · Till 5am',
'#saturdaynight #stardustchicago #karaokechicago #summerchicago #chicagonightlife #latenightchicago #riverNorth',
'Saturday summer energy reel. Shoot the crowd first — wide shots, faces, group reactions — then the singer. The room is the story, not the performance.',
'Script: "first saturday of summer. this room was ready."

0:00 · 2s — Wide: Saturday crowd, wall to wall, summer loose
0:02 · 2s — Singer at the mic — arms out, the crowd already moving
0:04 · 2s — Group mid-chorus: arm in arm, every word
0:06 · 2s — Bar packed — the summer drinks, the warm faces
0:08 · 2s — Different singer, different energy, same room loving it
0:10 · 2s — Wide again — the full picture, undeniable
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-20', '11:00');

-- ── POST 209 · Instagram Story · Jun 20 · Saturday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). Saturday crowd at its fullest — warm light, packed room, the energy visible. Countdown sticker optional.',
'', '2026-06-20', '16:00');

-- ── POST 210 · Facebook Post · Jun 21 · Week 1 recap ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'First full summer weekend at Stardust Chicago. Saturday was the kind of night the room is built for.

We''re back Thursday. Three more nights next week — and the weeks after that.

Doors 8pm · 710 N Clark, River North',
'',
'Weekend recap. Wide Saturday crowd photo — warm light, the room at capacity, the kind of image that makes someone text a friend.',
'', '2026-06-21', '13:00');

-- ── POST 211 · Instagram Carousel · Jun 23 · Summer venue feature ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'The room in summer. Swipe through.

Slide 1: 710 N Clark — the building at dusk
Slide 2: Bar detail — cold glass, warm light, the hour before midnight
Slide 3: Stage lit, mic ready, the room starting to gather
Slide 4: Full capacity — the room the way it''s supposed to look
Slide 5: The bar at last call — the people who made it

📍 710 N Clark · Thu Fri Sat',
'#stardustchicago #karaokebar #chicagobar #riverNorth #karaokechicago #summerchicago #chicagonightlife #latenightchicago',
'5-slide summer venue carousel. One coherent mood: warm, a little dark, theatrical. The room as a character across five frames.',
'', '2026-06-23', '11:00');


-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 2 · Jun 22–28 · The regulars — spotlight the room, not just the singers
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 212 · Twitter/X Tweet · Jun 24 · Wednesday countdown ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'tomorrow. stardust. thursday. 710 n clark. you know what to do.',
'', '', '', '2026-06-24', '08:00');

-- ── POST 213 · TikTok Video · Jun 25 · Thursday regulars ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the regulars at stardust don''t look around when they walk in.',
'',
'Regulars-only cut. Faces in the crowd who look like they built this place. Shoot the bar, the tables, the back of the room — the people who belong here. The singer is almost incidental.',
'Script: "the regulars at stardust. they already know."

0:00 · 2s — Regular walking in — zero hesitation, straight to their spot
0:02 · 2s — Close: drink already in hand, watching the stage like they''ve seen this a hundred times
0:04 · 2s — Two regulars at the bar — they know each other because of this room
0:06 · 2s — Regular at the mic — no nerves, no performance of nervousness
0:08 · 2s — Crowd: the faces that know every word mixed with the faces learning them
0:10 · 2s — Bartender pours without being asked — the bar knows too
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-06-25', '10:00');

-- ── POST 214 · Instagram Story · Jun 25 · Thursday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust Chicago.
Thursday karaoke · Doors 8pm
📍 710 N Clark',
'',
'Story (9:16). Shoot the bar or stage just before the crowd fully arrives — that specific warmth of the room when it''s still becoming itself. Text overlay clean and bold.',
'', '2026-06-25', '16:00');

-- ── POST 215 · Instagram Reel · Jun 26 · The room itself ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The singer is up there. But the room is doing the work.

710 N Clark · River North',
'#stardustchicago #karaokechicago #chicagonightlife #fridaynight #riverNorth #karaoke #chicagobar',
'Crowd-first reel — the singer stays in soft focus or background. Shoot the faces, the reactions, the private moments between strangers. The room is the subject.',
'Script: "the singer is up there. the room is what''s happening."

0:00 · 2s — Stage soft in the background; crowd close and sharp in frame
0:02 · 2s — Close on a face: mouthing every word, completely absorbed
0:04 · 2s — Group of strangers arm-in-arm — they didn''t arrive together
0:06 · 2s — The crowd clapping in unison — the room finding its sync
0:08 · 2s — Singer glances back — the room is giving it all back
0:10 · 2s — Wide: the whole thing at once, the room as one
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-06-26', '11:00');

-- ── POST 216 · TikTok Video · Jun 26 · Friday crowd energy ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday at stardust. the room has a thing and you have to be in it to understand.',
'',
'Fast-cut crowd energy. No single hero shot — every cut is something different. Rapid rhythm, natural audio peaks between cuts. The room is the edit.',
'Script: "friday at stardust chicago. the room."

0:00 · 1s — Bar wide, warm light, the room humming
0:01 · 1s — Face in the crowd: laughing, fully in
0:02 · 1s — Singer approaching the mic — the crowd already watching
0:03 · 1s — Group reaction: total investment, instant
0:04 · 1s — Bar: drinks going out three at a time
0:05 · 1s — Second singer, second song, same energy
0:06 · 1s — Two strangers singing at each other
0:07 · 1s — Wide room — every inch filled
0:08 · 1s — 1am: the bar still moving, no one near the door
0:09 · 1s — Someone picking up the songbook for the first time
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-06-26', '10:00');

-- ── POST 217 · Instagram Story · Jun 27 · Saturday story ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). Packed Saturday crowd — the room shoulder to shoulder, warm light, energy visible. No text needed except the overlay.',
'', '2026-06-27', '16:00');

-- ── POST 218 · TikTok Video · Jun 27 · Saturday late night ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'it was 2am on a saturday at stardust and the room was still full. nobody looked tired.',
'',
'Late Saturday — shoot past midnight. The crowd thinner but more committed. The energy has changed: it''s something else now. Not louder, but denser. Capture what 2am looks like when no one is thinking about leaving.',
'Script: "saturday at stardust. 2am. the room isn''t done."

0:00 · 2s — Clock visible on a phone in the crowd: 2:07am
0:02 · 2s — Wide room — still packed, somehow looser than before
0:04 · 2s — Singer at 2am: no self-consciousness left, just the song
0:06 · 2s — Crowd response — the 2am crowd gives more than the 10pm crowd
0:08 · 2s — Bar: late pour, the bartender who has been here since 8
0:10 · 2s — Wide again — the room that does not run out
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-27', '10:00');

-- ── POST 219 · Instagram Reel · Jun 27 · Saturday the regulars ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Some people have been coming to Stardust every Saturday for months. You can tell.

710 N Clark · River North · Every Saturday till 5am',
'#saturdaynight #stardustchicago #karaokechicago #chicagonightlife #latenightchicago #riverNorth #karaokebar',
'Saturday regulars reel — the people who have made this room theirs. Shoot the familiarity: how they move, where they sit, how the bartender looks at them.',
'Script: "the stardust regulars. they''re not performing. they''re home."

0:00 · 2s — Regular at the bar: settled in, drink already there, watching the room
0:02 · 2s — Two regulars greet each other — they met here first
0:04 · 2s — Regular at the mic: no ceremony, no buildup, just starts singing
0:06 · 2s — The crowd of regulars: every word, zero hesitation
0:08 · 2s — 3am: the regulars are still here — the new faces left an hour ago
0:10 · 2s — Wide room: a mix of old and new faces, all equally in
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-06-27', '11:00');

-- ── POST 220 · Twitter/X Tweet · Jun 28 · Weekend wrap ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust was open till 5am saturday. the room did not run out of night. back thursday.',
'', '', '', '2026-06-28', '08:00');


-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 3 · Jun 29–Jul 5 · July 4th weekend — patriotic but Stardust-style
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 221 · Instagram Carousel · Jun 30 · July 4th week preview ───────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'This week at Stardust Chicago. Three nights. One of them is July 4th.

Slide 1: "THU JUL 2 · DOORS 8PM · 710 N CLARK"
Slide 2: "FRI JUL 3 · TILL 4AM · 710 N CLARK"
Slide 3: "SAT JUL 4 · INDEPENDENCE DAY · TILL 5AM"
Slide 4: The room — crowd, stage, the whole picture
Slide 5: "ANYONE CAN SING · 710 N CLARK · RIVER NORTH"',
'#stardustchicago #july4th #independenceday #karaokechicago #chicagonightlife #riverNorth #summerchicago',
'5-slide July 4th week preview carousel. Bold type on dark backgrounds for the schedule slides. Warm red and gold tones in the room photo — don''t force the patriotic angle, let the room do it.',
'', '2026-06-30', '11:00');

-- ── POST 222 · TikTok Video · Jul 2 · Thursday July 4th week ─────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'july 4th weekend starts thursday. stardust chicago. 710 n clark.',
'',
'July 4th week opener — Thursday energy with the holiday weekend looming. The crowd already feels different: longer weekend, looser plans, everyone out a little earlier. Shoot that anticipation.',
'Script: "july 4th weekend. it starts thursday at stardust."

0:00 · 2s — Wide room: Thursday crowd with that long-weekend looseness already in it
0:02 · 2s — Bar packed — people who didn''t go home after work today
0:04 · 2s — Singer chooses something patriotic — the crowd recognizes it immediately
0:06 · 2s — Room reacts: laughter, arms up, total buy-in
0:08 · 2s — Someone in the crowd holding a small flag — they brought it themselves
0:10 · 2s — Wide again — Thursday at peak, Saturday already in the air
0:12 · 4s — End card: STARDUST CHICAGO · JUL 4TH WEEKEND · 710 N CLARK
Total: ~16s',
'2026-07-02', '10:00');

-- ── POST 223 · Instagram Story · Jul 2 · Thursday 4th of July week ───────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'July 4th weekend starts tonight.
Stardust Chicago · Doors 8pm
📍 710 N Clark',
'',
'Story (9:16). Warm Thursday crowd shot — the room at that pre-holiday energy. Bold text overlay. Countdown sticker to 8pm. A firework emoji is acceptable here.',
'', '2026-07-02', '16:00');

-- ── POST 224 · TikTok Video · Jul 3 · Friday July 4th eve ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'july 3rd. the fireworks were fine. this was better.',
'',
'July 3rd Friday — the city is in holiday mode and Stardust gets the overflow. Shoot a room that''s bigger, louder, and more chaotic than a regular Friday. The holiday brought the wrong people to the right place.',
'Script: "july 3rd at stardust. the fireworks people came in after."

0:00 · 2s — Exterior: city in full July 3rd mode, Stardust lit up
0:02 · 2s — Inside: fuller than a normal Friday, holiday energy in every posture
0:04 · 2s — Singer picks the most obvious song — the crowd is already screaming
0:06 · 2s — Arms up, full volume — the room at its most unhinged (in the best way)
0:08 · 2s — Bar: the July 3rd pour — everyone''s staying till 4
0:10 · 2s — Wide at 1am — still packed, no one is leaving before close
0:12 · 4s — End card: STARDUST CHICAGO · JULY 3RD · TILL 4AM · 710 N CLARK
Total: ~16s',
'2026-07-03', '10:00');

-- ── POST 225 · Instagram Reel · Jul 3 · Friday 4th eve reel ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'July 3rd at Stardust Chicago. The city had a lot of plans. This was the one that worked out.

710 N Clark · River North · Till 4am',
'#july4th #stardustchicago #karaokechicago #chicagonightlife #fridaynight #latenightchicago #summerchicago',
'July 3rd reel — the holiday eve energy that no fireworks show can match. Shoot crowd moments that look genuinely unplanned: the spontaneous group sing, the stranger who joins, the song that lands wrong and perfectly.',
'Script: "july 3rd. stardust chicago. everyone had a plan. this was the plan."

0:00 · 2s — Wide: holiday crowd — bigger, louder, already committed
0:02 · 2s — Singer picks the obvious patriotic anthem — the room erupts before the first note
0:04 · 2s — Group arm-in-arm, full volume, every word
0:06 · 2s — Bar: everyone buying a round, July 3rd cocktails going out fast
0:08 · 2s — Singer finishes — the crowd''s response is genuinely wild
0:10 · 2s — Wide — the room in full July 3rd mode
0:12 · 4s — End card: STARDUST CHICAGO · JULY 3RD · 710 N CLARK
Total: ~16s',
'2026-07-03', '11:00');

-- ── POST 226 · TikTok Video · Jul 4 · Independence Day Saturday ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'july 4th karaoke at stardust chicago. the founding fathers would have wanted this.',
'',
'July 4th Saturday — the big night. Lean into the absurdity and the sincerity at the same time. Shoot the room as proof that karaoke is the most democratic thing: the mic goes to anyone.',
'Script: "july 4th. stardust chicago. anyone can get on that mic. that''s the whole point."

0:00 · 2s — Wide room: July 4th Saturday, wall to wall
0:02 · 2s — Singer steps up — the song choice is extremely American
0:04 · 2s — Crowd: fireworks-adjacent energy, full volume
0:06 · 2s — Someone in the crowd waving a flag — fully unironic
0:08 · 2s — 3am on July 4th — the room still going like it''s 11pm
0:10 · 2s — Wide again — a night that justifies having a holiday
0:12 · 4s — End card: STARDUST CHICAGO · JULY 4TH · TILL 5AM · 710 N CLARK
Total: ~16s',
'2026-07-04', '10:00');

-- ── POST 227 · Instagram Reel · Jul 4 · Independence Day reel ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'July 4th at Stardust Chicago. One mic. Anyone can get up there. That''s kind of the whole idea.

710 N Clark · River North · Till 5am',
'#july4th #independenceday #stardustchicago #karaokechicago #chicagonightlife #saturdaynight #summerchicago',
'Independence Day reel. The karaoke-as-freedom angle, played warm not corny. Shoot the variety: the unexpected song choice, the unlikely singer, the crowd that loses it for both.',
'Script: "july 4th. everyone gets the mic. that''s freedom."

0:00 · 2s — Wide room, full capacity, July 4th energy
0:02 · 2s — Someone steps up you would not have predicted — the song choice is perfect
0:04 · 2s — It lands — the crowd goes completely in
0:06 · 2s — Different singer, opposite vibe, same commitment
0:08 · 2s — The room arm-in-arm, full voice, one single thing
0:10 · 2s — Wide — all of it at once, Independence Day at Stardust
0:12 · 4s — End card: STARDUST CHICAGO · JULY 4TH · 710 N CLARK
Total: ~16s',
'2026-07-04', '11:00');

-- ── POST 228 · Instagram Story · Jul 4 · Independence Day story ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Independence Day at Stardust Chicago.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). July 4th crowd — the room packed, warm light, the energy readable. Bold text overlay. An American flag emoji is fine here.',
'', '2026-07-04', '16:00');

-- ── POST 229 · Facebook Post · Jul 4 · Independence Day ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Happy Fourth of July from Stardust Chicago.

Tonight we''re open till 5am. Because if karaoke isn''t the most American thing — one room, one mic, anyone who wants it — we don''t know what is.

No cover. No reservations. Just show up.

Doors 8pm · 710 N Clark, River North',
'',
'July 4th Facebook post. Crowd shot or stage photo with a flag visible somewhere naturally — not staged, just in the room. Warm light.',
'', '2026-07-04', '13:00');

-- ── POST 230 · Twitter/X Tweet · Jul 5 · July 4th recap ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust chicago was open till 5am on july 4th. the room was exactly what a fourth of july should be. back thursday.',
'', '', '', '2026-07-05', '08:00');


-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 4 · Jul 6–12 · Mid-summer peak — the room at its best
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 231 · Instagram Carousel · Jul 7 · Mid-summer feature ───────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'Mid-summer at Stardust Chicago. Swipe through.

Slide 1: Saturday night — wall to wall, the room at full heat
Slide 2: The mic — whoever''s up there has earned it
Slide 3: The crowd: their reaction is the whole performance
Slide 4: Bar close-up — condensation, warm light, the hour before last call
Slide 5: "THU · FRI · SAT · 710 N CLARK · RIVER NORTH"',
'#stardustchicago #karaokechicago #summerchicago #chicagonightlife #riverNorth #latenightchicago #chicagobar',
'5-slide mid-summer feature carousel. Shoot these on a Saturday night — the room at its absolute fullest and most confident. These are the definitional Stardust images.',
'', '2026-07-07', '11:00');

-- ── POST 232 · Twitter/X Tweet · Jul 8 · Wednesday hype ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust this week: thursday friday saturday. the middle of summer. 710 n clark. doors at 8.',
'', '', '', '2026-07-08', '08:00');

-- ── POST 233 · TikTok Video · Jul 9 · Thursday mid-summer ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'mid-summer thursday at stardust. the room has settled into itself.',
'',
'Mid-summer Thursday — the room has hit its stride. Regulars are bolder, first-timers feel less like first-timers. Shoot the confidence: people who have been here enough times to have a spot, a drink, a song.',
'Script: "mid-summer. the room at stardust has figured out what it is."

0:00 · 2s — Wide room: Thursday at mid-summer confidence — the crowd knows itself
0:02 · 2s — Singer who''s been here before: no approach nerves, straight to the mic
0:04 · 2s — Crowd: regulars and newcomers at the same level now
0:06 · 2s — Bar: everyone knows what they want before they get there
0:08 · 2s — The next singer already waiting, queue longer than earlier in the summer
0:10 · 2s — Wide — the room at mid-summer peak
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-07-09', '10:00');

-- ── POST 234 · Instagram Story · Jul 9 · Thursday night ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Mid-summer Thursday at Stardust.
Doors 8pm · Open till 2am
📍 710 N Clark',
'',
'Story (9:16). Mid-summer crowd shot — the room confident, the energy high, the summer visible in every face. Bold text. Countdown sticker to 8pm.',
'', '2026-07-09', '16:00');

-- ── POST 235 · TikTok Video · Jul 10 · Friday peak summer ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'mid-july friday at stardust. the room knows exactly what it''s doing now.',
'',
'Friday mid-summer peak — shoot the confidence. Singers who have found their song over the course of the summer. A crowd that knows when to go louder. The room at its most experienced.',
'Script: "mid-july. friday. stardust. the room has figured itself out."

0:00 · 1.5s — Wide: Friday mid-summer, shoulder to shoulder
0:01 · 1.5s — Singer walks to the mic without pausing
0:03 · 1.5s — They open their mouth — the crowd is already there
0:04 · 1.5s — Mid-chorus: no self-consciousness, total presence
0:06 · 1.5s — Crowd singing every word, arms up
0:07 · 1.5s — Bar: the mid-summer pour, nobody asking for water
0:09 · 1.5s — Different singer, different song, same room behind them
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-07-10', '10:00');

-- ── POST 236 · Instagram Reel · Jul 10 · Friday the room ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Mid-July Friday at Stardust Chicago. The room is at the top of its game right now.

710 N Clark · River North · Till 4am',
'#fridaynight #stardustchicago #karaokechicago #summerchicago #chicagonightlife #latenightchicago #karaoke',
'Mid-summer Friday reel. Shoot the confidence of the room — people who have done this enough times this summer that the nerves are gone. The crowd that reacts before the chorus even hits.',
'Script: "mid-july friday. stardust. the room doesn''t hesitate anymore."

0:00 · 2s — Wide: peak Friday mid-summer, no empty space
0:02 · 2s — Singer: no pause, straight into it — this is not their first time this summer
0:04 · 2s — Song lands before the chorus: the crowd was already there
0:06 · 2s — Close on the crowd — every face fully invested
0:08 · 2s — 2am: the room still full, no sign of thinning
0:10 · 2s — Wide — the room at its mid-summer best
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-07-10', '11:00');

-- ── POST 237 · Instagram Story · Jul 11 · Saturday story ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust. Mid-summer.
Open till 5am.
📍 710 N Clark',
'',
'Story (9:16). Mid-summer Saturday crowd at capacity — the room at its most photogenic. Bold text overlay. Countdown sticker optional.',
'', '2026-07-11', '16:00');

-- ── POST 238 · TikTok Video · Jul 11 · Saturday mid-summer uncut ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'mid-july saturday. stardust chicago. the room at the height of its summer.',
'',
'One long uncut clip. The definitive mid-summer Saturday. Whoever is on stage, whatever is happening — the room is the content. No edits, raw audio. Let it run.',
'Script: "mid-summer saturday at stardust. this is it."

0:00 · 22s — One uncut clip, raw audio. Mid-summer Saturday peak — the room at full summer confidence. The singer, the crowd, the heat, the noise. Nothing staged. Nobody performing for the camera. The best Saturday of the summer, happening.
0:22 · 4s — End card: STARDUST CHICAGO · MID-SUMMER · TILL 5AM
Total: ~26s',
'2026-07-11', '10:00');

-- ── POST 239 · Instagram Reel · Jul 11 · Saturday peak ───────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Mid-summer Saturday at Stardust Chicago. The room was made for this exact night.

710 N Clark · River North · Till 5am',
'#saturdaynight #stardustchicago #karaokechicago #summerchicago #chicagonightlife #latenightchicago #riverNorth',
'Mid-summer Saturday reel — the definitive summer night. Shoot the fullness, the confidence, the crowd reacting like they were born to react. This is the reel that makes someone book a cab.',
'Script: "mid-summer saturday. stardust chicago. the room at its height."

0:00 · 2s — Wide room: wall to wall, peak mid-summer Saturday
0:02 · 2s — Singer: total ownership — no warmup needed, straight to full
0:04 · 2s — Crowd reaction: immediate and total
0:06 · 2s — That moment when everyone sings together — the room as one voice
0:08 · 2s — 3am: mid-summer, still full, still going
0:10 · 2s — Wide — the whole thing at once
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-07-11', '11:00');

-- ── POST 240 · Facebook Post · Jul 12 · Mid-summer recap ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Mid-summer at Stardust Chicago. Three nights a week, every week. The room just keeps getting better.

There''s something that happens when the same people come back enough times — the room develops a confidence you can feel when you walk in. That''s where we are right now.

Thursday, Friday, Saturday · Doors 8pm
710 N Clark, River North · Free to sing · No cover',
'',
'Mid-summer weekend recap. Wide Saturday crowd photo — the room at full capacity, warm light, the kind of image that makes someone wish they were there.',
'', '2026-07-12', '13:00');


-- ══════════════════════════════════════════════════════════════════════════════
-- WEEK 5 · Jul 13–19 · The late-night pull — staying till 4am/5am
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST 241 · Twitter/X Tweet · Jul 14 · Late night angle ──────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'the stardust crowd last saturday stayed till 5am. nobody was the first to leave. back thursday.',
'', '', '', '2026-07-14', '08:00');

-- ── POST 242 · Instagram Carousel · Jul 14 · Late night feature ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Carousel', 'draft',
'What 3am at Stardust looks like. Swipe through.

Slide 1: 3am — the bar at full late-night speed
Slide 2: 4am — the singers who waited all night to get on that mic
Slide 3: 5am — the ones who outlasted everything
Slide 4: Close: a glass, a face, the warm light at close
Slide 5: "STARDUST CHICAGO · TILL 5AM · 710 N CLARK"',
'#stardustchicago #latenightchicago #karaokechicago #chicagonightlife #riverNorth #till5am #saturdaynightchicago',
'5-slide late-night carousel. Shoot past midnight — 3am, 4am, up to close. The crowd that stayed. The room at its most honest. Not the polished early-evening look — the real thing.',
'', '2026-07-14', '11:00');

-- ── POST 243 · TikTok Video · Jul 16 · Thursday late-night pull ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'you go to stardust for one drink. you stay for three hours. this is a known thing.',
'',
'The late-night pull — the story of how a Thursday becomes a 2am decision you don''t regret. Use a single person''s arc across the night: arriving, watching, singing, staying.',
'Script: "you go to stardust for one drink. that''s not how this ends."

0:00 · 2s — Someone checks the time on their phone: 8:47pm — just got here
0:02 · 2s — Same person: drink in hand, watching the first singer, starting to smile
0:04 · 2s — 10pm: they''re putting in a song request — something changed
0:06 · 2s — 11pm: they''re at the mic — they have three new friends they didn''t arrive with
0:08 · 2s — Midnight: another round, phone full of unread messages, not checking it
0:10 · 2s — Wide room: everyone is this person
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-07-16', '10:00');

-- ── POST 244 · Instagram Story · Jul 16 · Thursday tonight ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust Chicago.
You''ll stay later than you planned.
📍 710 N Clark · Doors 8pm',
'',
'Story (9:16). Late-night bar shot — warm, a little dark, the room past midnight. Bold text overlay. The image should make someone feel like they''re already missing something.',
'', '2026-07-16', '16:00');

-- ── POST 245 · Instagram Reel · Jul 17 · Friday late night reel ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'3am at Stardust Chicago. The room is still full. Nobody planned to stay this long.

710 N Clark · River North · Till 4am',
'#latenightchicago #stardustchicago #karaokechicago #fridaynight #chicagonightlife #till4am #riverNorth',
'Late-night reel — the 3am version of the room. Shoot the difference from earlier in the night: thinner crowd, but more committed. The people who are still here chose to be here.',
'Script: "3am at stardust. still going. nobody planned this part."

0:00 · 2s — Phone screen in the crowd: 3:02am — this is happening
0:02 · 2s — Wide room: still packed, the late-night crowd denser than it looks
0:04 · 2s — Late singer: nothing to prove at 3am, just the song
0:06 · 2s — Crowd reaction: the 3am crowd gives more generously than any other
0:08 · 2s — Bar: the late pour, the bartender who has seen the whole arc of the night
0:10 · 2s — Wide — the room at 3am, the ones who stayed
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-07-17', '11:00');

-- ── POST 246 · TikTok Video · Jul 17 · Friday late pull ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the people who stayed till 4am last friday are already back tonight. stardust chicago.',
'',
'The return — people who experienced the late night once and came back for it on purpose. Shoot the regulars who arrive knowing exactly how this ends. The room that makes you come back.',
'Script: "they came back. because 4am at stardust is worth coming back for."

0:00 · 2s — Regular walking in — no scan of the room, straight to their spot
0:02 · 2s — They settle: drink ordered before they''re fully seated — they know
0:04 · 2s — The crowd thinning around midnight to the people who mean it
0:06 · 2s — 2am: the room at its most honest — nobody here by mistake
0:08 · 2s — Late-night singer: no one to impress, just them and the song
0:10 · 2s — Wide late-night room: the ones who came back, the ones who stayed
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-07-17', '10:00');

-- ── POST 247 · Twitter/X Tweet · Jul 17 · Friday late-night call ─────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust is open tonight. friday. till 4am. the room after midnight is worth the cab.',
'', '', '', '2026-07-17', '08:00');

-- ── POST 248 · Instagram Story · Jul 18 · Saturday tonight ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday at Stardust Chicago.
Open till 5am. The later the better.
📍 710 N Clark',
'',
'Story (9:16). Late-night Saturday crowd — the room after midnight, warm and dense. Bold text overlay.',
'', '2026-07-18', '16:00');

-- ── POST 249 · TikTok Video · Jul 18 · Saturday 5am ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'it was 5am at stardust and the last singer was still going. nobody moved.',
'',
'The 5am crowd. Shoot last call: the room thinner, but the people left are the ones who decided this mattered. The last song of the night at Stardust is never a throwaway. Capture that.',
'Script: "5am at stardust chicago. last song. the room listened."

0:00 · 2s — Clock detail: 4:52am on someone''s phone — the end of the night is here
0:02 · 2s — The room: down to the ones who chose to stay till the end
0:04 · 2s — Last singer of the night: no crowd pressure, no performance of it — just the song
0:06 · 2s — The room for the last song: every face fully in, no irony left at 5am
0:08 · 2s — Bar: last call pour, the bartender who made it the whole way through
0:10 · 2s — Wide: 5am at Stardust, the most honest version of the room
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-07-18', '10:00');

-- ── POST 250 · Instagram Reel · Jul 18 · Saturday late night reel ────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Nobody leaves Stardust Chicago on a Saturday because they want to. They leave because the lights come on.

710 N Clark · River North · Till 5am',
'#saturdaynight #stardustchicago #till5am #karaokechicago #chicagonightlife #latenightchicago #riverNorth',
'Late-night Saturday reel. Shoot 4am: the crowd that stayed, the last singers, the bar at close. The room at its most stripped-down and honest. The warmth doesn''t go away at 4am — it concentrates.',
'Script: "you don''t leave stardust on a saturday night. you get asked to leave."

0:00 · 2s — 4am: the room thinner but more real — no one here by accident
0:02 · 2s — Late singer: they waited all night for the mic, and you can hear it
0:04 · 2s — The crowd at 4am: every person left is fully in, no half-measures
0:06 · 2s — Bar at close: the ones who made it
0:08 · 2s — Last song: the whole room for one more moment
0:10 · 2s — Lights up: 5am, the night that wouldn''t end, ending
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-07-18', '11:00');

-- ── POST 251 · Facebook Post · Jul 19 · Summer wrap ─────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Facebook', 'Post', 'draft',
'Another Saturday at Stardust Chicago. The lights came on at 5am. A few people didn''t leave until they did.

That''s the thing about this room — it doesn''t push you out early. You get exactly as much night as you want.

Back Thursday. Then Friday. Then Saturday again.

Doors 8pm · 710 N Clark, River North · Free to sing · No cover',
'',
'Late-night Saturday recap photo — the room past midnight, warm light, the crowd that earned the hour.',
'', '2026-07-19', '13:00');

-- ── POST 252 · Twitter/X Tweet · Jul 19 · Late-night week close ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Twitter/X', 'Tweet', 'draft',
'stardust last night: till 5am, full room, last singer went at 4:45. back thursday.',
'', '', '', '2026-07-19', '08:00');

END $$;
