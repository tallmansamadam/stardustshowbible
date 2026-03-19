-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Batch 1 Additions
-- Fills in missing TikTok Videos and Instagram Reels for thin Thu/Fri/Sat
-- dates in the original seed (Mar 19 – Apr 10).
-- Does NOT delete existing posts. Safe to run after supabase-posts-seed.sql.
--
-- BEFORE RUNNING: Replace 'YOUR_USER_ID_HERE' with your actual Supabase user ID.
-- ─────────────────────────────────────────────────────────────────────────────

DO $$
DECLARE
  uid uuid := 'YOUR_USER_ID_HERE';
BEGIN

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 19 · THURSDAY · was: Story + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A01 · TikTok Video · Mar 19 · Thursday night ────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday at stardust. starts slow, ends loud. every time.',
'',
'Thursday arrival sequence — handheld, POV walkthrough from door to first singer. Raw audio, warm light. The room finding itself.',
'Script: "you said you weren''t going out thursday. here you are."

0:00 · 2s — Push through the front door, room opens ahead
0:02 · 2s — Bar already half-staffed, first drinks landing
0:04 · 1.5s — Stage comes into view — mic lit, someone already on it
0:05 · 1.5s — Singer mid-chorus, not looking at the screen
0:07 · 2s — Pan across faces — half watching, half talking, all staying
0:09 · 2s — Wide room — Thursday doing exactly what Thursday does
0:11 · 1s — On-screen: "EVERY THURSDAY"
0:12 · 4s — End card: STARDUST · 710 N CLARK · DOORS 8PM
Total: ~16s',
'2026-03-19', '10:00');

-- ── POST A02 · Instagram Reel · Mar 19 · Thursday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday is the night people keep underestimating.

Stardust Chicago · 710 N Clark · Doors 8pm',
'#thursdaykaraoke #karaokechicago #stardustchicago #rivernorth #chicagonightlife #chicagokaraoke #thursday',
'Thursday crowd mid-evening — the room past the slow start, first regulars at the mic. Warm, real, not staged.',
'Script: "thursday at stardust. the night that surprises people."

0:00 · 3s — Close on the mic, stage lit softly — the offer
0:03 · 2s — Someone stepping up, drink still in hand
0:05 · 2s — They start singing — the room shifts toward them
0:07 · 2s — Crowd two-deep at the bar, nobody heading for the door
0:09 · 2s — Singer finishes, someone at a table raises their glass
0:11 · 1s — Wide room — this is a Thursday
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-19', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 20 · FRIDAY · was: Facebook Post only — critical gap
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A03 · TikTok Video · Mar 20 · Friday night ──────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'stardust is open tonight. friday. till 4am.',
'',
'Friday fast-cut — 1 to 1.5 second shots, energy ramp from the sign outside to the room at capacity. The pace of the edit matches the room.',
'Script: "friday night. stardust chicago."

0:00 · 1.5s — Neon on Clark Street, night starting
0:01 · 1s — Door swings open
0:02 · 1.5s — First people through, coats still on
0:03 · 1.5s — Bar — first round of the night
0:05 · 1s — Mic lit on stage, nobody on it yet
0:06 · 1.5s — Someone walks up
0:07 · 1.5s — They open their mouth — crowd turns
0:09 · 1.5s — Room half full, getting fuller
0:10 · 1.5s — Wide shot — wall to wall by now
0:12 · 4s — End card: STARDUST · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-03-20', '10:00');

-- ── POST A04 · Instagram Reel · Mar 20 · Friday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago. The mic is open till 4am.

710 N Clark · River North',
'#fridaynight #karaokechicago #stardustchicago #latenightchicago #chicagonightlife #fridayvibes #karaoke',
'Friday crowd from first arrivals to room at capacity — follow one person from the door to the mic. Real, unpolished, loud.',
'Script: "it''s friday. stardust is open till 4am."

0:00 · 2s — Someone at the door — first time or hundredth, same look
0:02 · 2s — They find a spot, scan the room, decide to stay
0:04 · 2s — Stage in the distance — a singer mid-song
0:06 · 2s — Our person leaning in to a friend, saying something
0:08 · 2s — They''re at the mic. They went for it.
0:10 · 2s — Crowd around them — they''re in it now
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-03-20', '11:00');

-- ── POST A05 · Instagram Story · Mar 20 · Friday tonight ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust.
Friday karaoke · Doors 8pm · Till 4am
📍 710 N Clark',
'',
'Story (9:16). Crowd shot from a recent Friday — warm bar light, people mid-conversation. "TONIGHT" bold text overlay top center. Countdown sticker to 8pm.',
'2026-03-20', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 21 · SATURDAY · was: Facebook Event only — worst gap in the batch
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A06 · TikTok Video · Mar 21 · Saturday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night at stardust. this is what staying out looks like.',
'',
'Saturday uncut — one long clip, raw audio, the room past midnight. No edits. The shot that makes someone put it in their calendar.',
'Script: "saturday at stardust chicago. we go till 5am."

0:00 · 20s — One uncut clip. Room at full Saturday capacity — raw audio, no cuts, no cleanup. Whoever is on the mic, whatever the crowd is doing. The 20 seconds that explain the whole night.
0:20 · 4s — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~24s',
'2026-03-21', '10:00');

-- ── POST A07 · Instagram Reel · Mar 21 · Saturday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago. Till 5am.

The room stays loud the whole way through.

710 N Clark · River North',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #till5am #riverNorth',
'Saturday crowd-only focus — all reaction shots, singer barely in frame. The people in the room are the story.',
'Script: "saturday at stardust. the crowd does the work."

0:00 · 2s — Wide room — wall to wall, mid-evening Saturday
0:02 · 2s — Table of four, all singing along to whoever''s on the mic
0:04 · 2s — Someone at the bar, turns toward the stage, stays turned
0:06 · 2s — Two people who didn''t know each other, now harmonizing
0:08 · 2s — Back of the room — nobody''s checked their phone in a while
0:10 · 2s — Close on a face — that look that means they''re not going home yet
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-21', '11:00');

-- ── POST A08 · Instagram Story · Mar 21 · Saturday tonight ───────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Saturday night at Stardust.
Doors 8pm · Till 5am
📍 710 N Clark',
'',
'Story (9:16). Saturday crowd at peak energy — full room, people mid-song. "TONIGHT · TILL 5AM" bold overlay. No countdown needed, the hours say enough.',
'2026-03-21', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 26 · THURSDAY · was: Story + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A09 · TikTok Video · Mar 26 · Thursday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday karaoke hits different when you stop fighting it.',
'',
'Thursday POV walkthrough — handheld arrival, first-person through the door and into the room. The moment the night changes your plans.',
'Script: "thursday at stardust. you said you were just getting one drink."

0:00 · 1.5s — Push through the door — room ahead
0:01 · 1.5s — Wide open space, already warm, already going
0:03 · 1.5s — Bar — quick scan, find a spot
0:04 · 1.5s — Stage in view — someone mid-song, fully in it
0:06 · 1.5s — Stay and watch — the drink is staying too
0:07 · 1.5s — Another song starts — crowd shifts again
0:09 · 1.5s — Wide room — you''re not leaving
0:10 · 2s — On-screen: "EVERY THURSDAY · 710 N CLARK"
0:12 · 4s — End card: STARDUST · DOORS 8PM
Total: ~16s',
'2026-03-26', '10:00');

-- ── POST A10 · Instagram Reel · Mar 26 · Thursday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'The Thursday regulars know something you don''t.

Stardust Chicago · 710 N Clark · Every Thursday · Doors 8pm',
'#thursdaynight #karaokechicago #stardustchicago #rivernorth #chicagobar #chicagonightlife',
'Thursday regulars in the room — people who know the drill, know the songs, know each other. The lived-in Thursday energy.',
'Script: "thursday at stardust. every week. never the same night twice."

0:00 · 2s — Regular at the bar — already has their drink, already watching the stage
0:02 · 2s — They head to the mic without being called
0:04 · 2s — Song starts — the crowd already knows where this is going
0:06 · 2s — A table joining in, word for word
0:08 · 2s — Singer finishes, hands the mic back easy
0:10 · 2s — Wide room — a Thursday that knows itself
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-26', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 28 · SATURDAY · was: Story + Tweet + Facebook Post — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A11 · TikTok Video · Mar 28 · Last Saturday of March ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'last saturday of march. stardust. till 5am.',
'',
'Late-night Saturday — past midnight, the people who stayed. Low light, close shots, the version of the room most people don''t see.',
'Script: "last saturday of march at stardust chicago."

0:00 · 2s — Past midnight. Room still packed, still loud.
0:02 · 2s — Someone at the mic who''s been waiting all night to sing this
0:04 · 2s — The bar hasn''t slowed down — neither has anyone else
0:06 · 2s — Close on two people sharing a lyric they both know
0:08 · 2s — Singer hits the big note — the room feels it
0:10 · 2s — Wide shot — the last Saturday of March, full to the edges
0:12 · 4s — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-28', '10:00');

-- ── POST A12 · Instagram Reel · Mar 28 · Last Saturday of March ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Saturday of March at Stardust Chicago.

Go out. Sing something.

710 N Clark · River North · Till 5am',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #march #till5am',
'Late Saturday crowd — the people who stayed past midnight. Close shots, warm light, the unselfconscious end of the night.',
'Script: "last saturday of march. the room that stays open till 5am."

0:00 · 2s — Atmospheric: close on a glass, stage blurred warm behind it
0:02 · 2s — Singer walks up — no hesitation, night already decided
0:04 · 2s — Song starts, crowd turns without being asked
0:06 · 2s — Someone in the back mouthing every word
0:08 · 2s — Wide shot — the last Saturday of March past midnight
0:10 · 2s — Singer''s last note, hands up in the crowd
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-28', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 3 · FRIDAY · had: Story + TikTok Video + Facebook Event — missing Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A13 · Instagram Reel · Apr 3 · Friday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday at Stardust Chicago. Open till 4am.

River North has a lot of bars. This one has a mic.

710 N Clark',
'#fridaynight #karaokechicago #stardustchicago #rivernorth #chicagonightlife #latenightchicago',
'Friday room transformation — empty to full, stage dark to lit, quiet to loud. The before and after of a Friday night.',
'Script: "friday at stardust. from empty to this."

0:00 · 3s — Room quiet, stage lit, nobody on it yet — the before
0:03 · 2s — First wave through the door, energy entering with them
0:05 · 2s — Bar three-deep — Friday finding its pace
0:07 · 2s — First singer — the room listens whether it planned to or not
0:09 · 2s — Room full now, a different kind of noise
0:11 · 1s — Wide shot — the after
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-04-03', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 4 · SATURDAY · had: Feed Post + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A14 · TikTok Video · Apr 4 · Saturday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'there''s always one person who owns the room on a saturday. tonight it was three of them.',
'',
'Saturday uncut — one clip, raw audio, no edits, the room at full peak. The 20 seconds that make someone regret staying home.',
'Script: "saturday night at stardust chicago."

0:00 · 20s — One uncut clip. Full Saturday room, raw audio, nothing cleaned up. Singer on mic, crowd reacting in real time. No cuts. Just the room being what it is on a Saturday past midnight.
0:20 · 4s  — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~24s',
'2026-04-04', '10:00');

-- ── POST A15 · Instagram Reel · Apr 4 · Saturday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago.

The kind of night you''re still thinking about on Monday.

710 N Clark · River North · Till 5am',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #till5am #latenightchicago #rivernightlife',
'Saturday energy montage — fast cuts, multiple singers and crowd reactions. The pace of a Saturday that won''t slow down.',
'Script: "saturday at stardust chicago."

0:00 · 1.5s — First singer up, room already watching
0:01 · 1.5s — Crowd three rows deep at the bar
0:03 · 1.5s — Singer mid-song, no looking back
0:04 · 1.5s — Someone in the crowd who knows all the words
0:06 · 1.5s — Second singer — completely different song, same energy
0:07 · 1.5s — Wide room — Saturday at full height
0:09 · 1.5s — Close on the mic between songs
0:10 · 1.5s — Third singer steps up — it keeps going
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-04-04', '11:00');

-- ── POST A16 · Instagram Story · Apr 4 · Saturday tonight ────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust.
Saturday karaoke · Doors 8pm · Till 5am
📍 710 N Clark',
'',
'Story (9:16). Saturday crowd at peak — full room, mid-song. "TONIGHT · TILL 5AM" large text overlay. Keep it simple, let the crowd shot do the selling.',
'2026-04-04', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 9 · THURSDAY · had: Story + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A17 · TikTok Video · Apr 9 · Thursday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'the 2am thursday crowd at stardust is a different religion.',
'',
'Thursday late-night — past midnight, the people who stayed. Handheld, low light, close. The part of Thursday nobody posts about.',
'Script: "thursday at stardust. the people who stayed."

0:00 · 3s — Past midnight. Room still full, lights warm and low.
0:03 · 2s — Someone at the mic who''s been waiting two hours — they''re ready
0:05 · 2s — Crowd that''s been here a while — not going anywhere
0:07 · 2s — Bar still moving, drinks still going
0:09 · 2s — Singer finishes — the room responds like it''s 10pm, not 2am
0:11 · 1s — Wide: the Thursday that stays
0:12 · 4s — End card: STARDUST · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-04-09', '10:00');

-- ── POST A18 · Instagram Reel · Apr 9 · Thursday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday karaoke at Stardust Chicago.

Nobody came here to be bad at it.

710 N Clark · River North · Every Thursday',
'#thursdaynight #karaokechicago #stardustchicago #rivernorth #chicagonightlife #thursday #karaoke',
'Thursday singer journey — follow one person from watching the stage, to deciding, to walking up, to the room reacting. The whole arc in 16 seconds.',
'Script: "thursday at stardust. from watching to singing."

0:00 · 2s — Person at a table, watching the stage with their drink
0:02 · 2s — They say something to the person next to them
0:04 · 2s — They''re up — walking toward the mic
0:06 · 2s — First note — the room pivots
0:08 · 2s — They hit something good — a table lights up
0:10 · 2s — They finish, walk back — different than when they walked up
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-04-09', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 10 · FRIDAY · had: Twitter/X Tweet only — single post on a Friday
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A19 · TikTok Video · Apr 10 · Friday ─────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'river north on a friday night starts at stardust.',
'',
'Friday fast-cut energy montage — 1 to 1.5 second shots from the sign to the room at full capacity. The edit should feel like the night accelerating.',
'Script: "friday night. 710 n clark."

0:00 · 1s — Neon: 710 N Clark, night outside
0:01 · 1s — Door opens
0:02 · 1s — Room inside, already going
0:03 · 1s — Bar — motion, drinks, people
0:04 · 1s — Stage — mic lit, empty
0:05 · 1s — Someone walking toward it
0:06 · 1s — They''re singing
0:07 · 1s — Crowd reacts
0:08 · 1s — Room fuller than it was a second ago
0:09 · 1s — Someone absolutely committed to a song
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST · 710 N CLARK
Total: ~16s',
'2026-04-10', '10:00');

-- ── POST A20 · Instagram Reel · Apr 10 · Friday ──────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago.

Some people come for one song. Most of them stay till 2.

710 N Clark · River North · Till 4am',
'#fridaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #rivernorth',
'Friday crowd-only reel — all reaction shots, no singer in frame. The room responding to something we can''t see. Makes the viewer curious about what''s happening on stage.',
'Script: "friday at stardust chicago. the crowd reaction reel."

0:00 · 2s — Table of three watching the stage — leaning in
0:02 · 2s — Someone at the bar turns, stays turned
0:04 · 2s — Two people who didn''t come together, now both singing along
0:06 · 2s — The back of the room — full, nobody leaving
0:08 · 2s — A face: eyes wide, clearly just heard something good
0:10 · 2s — Wide crowd shot — this is a Friday at Stardust
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-04-10', '11:00');

-- ── POST A21 · Instagram Story · Apr 10 · Friday tonight ─────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, date, post_time) VALUES
(uid, 'Instagram', 'Story', 'draft',
'Tonight at Stardust.
Friday karaoke · Doors 8pm · Till 4am
📍 710 N Clark',
'',
'Story (9:16). Recent Friday crowd — warm light, people mid-conversation or mid-song. "TONIGHT" bold text overlay top center. Keep it clean.',
'2026-04-10', '16:00');

END $$;
