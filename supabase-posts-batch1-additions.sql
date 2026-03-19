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
'thursday night karaoke at stardust chicago. 710 n clark. doors at 8.',
'',
'Thursday energy — room warming up, first regulars arriving, first singer of the night. Quick cuts, raw audio.',
'Script: "thursday night at stardust chicago."

0:00 · 2s — Wide room, lights warming up, the night just starting
0:02 · 2s — Regulars arriving — coats off, heading to the bar
0:04 · 2s — First singer of Thursday at the mic
0:06 · 2s — Crowd starting to build behind them
0:08 · 2s — Bar in motion, drinks going out, energy climbing
0:10 · 2s — Wide shot — the Thursday crowd finding its rhythm
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-19', '10:00');

-- ── POST A02 · Instagram Reel · Mar 19 · Thursday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday karaoke at Stardust Chicago. The week starts here.

710 N Clark · River North · Doors 8pm',
'#thursdaynight #karaokechicago #stardustchicago #riverNorth #chicagonightlife #karaoke',
'Thursday arrival energy — the room coming to life. Multiple singers, crowd building. Warm, inviting.',
'Script: "thursday at stardust. the week starts here."

0:00 · 2s — Empty stage, mic in frame — the invitation
0:02 · 2s — First people through the door, Thursday beginning
0:04 · 2s — Bar filling up — the crowd claiming their spots
0:06 · 2s — Singer at mic — the room responding
0:08 · 2s — Crowd growing — Thursday at full energy
0:10 · 2s — Wide room — the Thursday that delivers
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-19', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 20 · FRIDAY · was: Facebook Post only — critical gap
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A03 · TikTok Video · Mar 20 · Friday night ──────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. open till 4am. 710 n clark.',
'',
'Friday arrival to peak — doors open, first crowd, first singer, room full. Energy ramp.',
'Script: "friday night. stardust chicago is open."

0:00 · 2s — Exterior: 710 N Clark, neon on, doors open
0:02 · 2s — Room opening up — first Friday crowd pouring in
0:04 · 2s — Bar busy — the Friday energy starting
0:06 · 2s — Singer at mic — the night officially on
0:08 · 2s — Crowd building fast — Friday filling in
0:10 · 2s — Wide room — the Friday that delivers
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-03-20', '10:00');

-- ── POST A04 · Instagram Reel · Mar 20 · Friday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago. Till 4am.

710 N Clark · River North',
'#fridaynight #karaokechicago #stardustchicago #latenightchicago #chicagonightlife #karaoke',
'Friday night energy — first singers, crowd reacting, room at capacity. Raw, fast, real.',
'Script: "it''s friday. stardust is open till 4am."

0:00 · 2s — Stage lit, mic ready — the Friday promise
0:02 · 2s — Doors opening, first people through
0:04 · 2s — First drink ordered — the night starting
0:06 · 2s — Singer grabbing the mic — going for it
0:08 · 2s — Crowd singing along — Friday doing its thing
0:10 · 2s — Wide room — wall to wall, Friday at peak
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
'Story (9:16). Warm bar shot or crowd from a recent Friday. "TONIGHT" text overlay, countdown sticker to 8pm.',
'2026-03-20', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 21 · SATURDAY · was: Facebook Event only — worst gap in the batch
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A06 · TikTok Video · Mar 21 · Saturday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust chicago. open till 5am. 710 n clark.',
'',
'Saturday peak — full room, multiple singers, crowd at maximum. The night at its best.',
'Script: "saturday night at stardust chicago. we go till 5am."

0:00 · 2s — Wide room, Saturday at full capacity
0:02 · 2s — Singer mid-song, completely committed
0:04 · 2s — Crowd reaction — every face locked in
0:06 · 2s — Bar packed — drinks in every hand
0:08 · 2s — Different singer — different energy, same room
0:10 · 2s — Wide again — the Saturday room at absolute peak
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-21', '10:00');

-- ── POST A07 · Instagram Reel · Mar 21 · Saturday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago.

710 N Clark · River North · Till 5am',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago #till5am',
'Saturday crowd at peak — the room doing exactly what it does on a Saturday. Full, loud, alive.',
'Script: "saturday at stardust chicago."

0:00 · 2s — Room at full Saturday capacity
0:02 · 2s — Singer at the absolute peak of a song
0:04 · 2s — Crowd — arms up, singing along, completely in it
0:06 · 2s — Bar in full motion — the Saturday energy
0:08 · 2s — Wide shot — the room that stays till 5am
0:10 · 2s — Close on a face — that "I''m not leaving" look
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
'Story (9:16). Big Saturday crowd energy. "TONIGHT · TILL 5AM" text overlay.',
'2026-03-21', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 26 · THURSDAY · was: Story + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A09 · TikTok Video · Mar 26 · Thursday ───────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday karaoke at stardust chicago. 710 n clark. doors at 8.',
'',
'Thursday night — the room in full swing. POV-style, handheld, raw audio. The Thursday that feels like a Friday.',
'Script: "thursday karaoke at stardust chicago hits different."

0:00 · 1.5s — Walk in: front door, neon on
0:01 · 1.5s — Room opens up — already half full
0:03 · 1.5s — Bar — the Thursday crowd settled in
0:04 · 1.5s — Singer at mic — mid-song, no holding back
0:06 · 1.5s — Crowd reaction — they''re all in
0:07 · 1.5s — Different singer — Thursday regulars taking turns
0:09 · 1.5s — Wide room — Thursday at its best
0:10 · 2s — On-screen: "EVERY THURSDAY"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-03-26', '10:00');

-- ── POST A10 · Instagram Reel · Mar 26 · Thursday ────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday karaoke at Stardust Chicago. Every week.

710 N Clark · River North · Doors 8pm',
'#thursdaynight #karaokechicago #stardustchicago #riverNorth #chicagonightlife',
'Thursday energy — the crowd that comes every week. Regulars in their element, newcomers finding it.',
'Script: "thursday at stardust. every week."

0:00 · 2s — Stage lit — the Thursday invitation
0:02 · 2s — Regular at the mic — they know every word
0:04 · 2s — Crowd cheering — the room knowing itself
0:06 · 2s — Newcomer watching, drink in hand — figuring it out
0:08 · 2s — Wide room — a Thursday at full capacity
0:10 · 2s — Close on stage — the mic waiting for the next person
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-03-26', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- MAR 28 · SATURDAY · was: Story + Tweet + Facebook Post — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A11 · TikTok Video · Mar 28 · Last Saturday of March ────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'last saturday of march at stardust chicago. open till 5am. 710 n clark.',
'',
'Last Saturday of March — the energy of an ending and a beginning. Full room, peak night.',
'Script: "last saturday of march at stardust chicago."

0:00 · 2s — Wide room — last Saturday of March, packed
0:02 · 2s — Singer going for it — the month''s last night
0:04 · 2s — Crowd completely activated — the end-of-month energy
0:06 · 2s — Bar in full motion — drinks everywhere
0:08 · 2s — Close on the stage — the mic, the moment
0:10 · 2s — Wide again — the last Saturday of March at full peak
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-28', '10:00');

-- ── POST A12 · Instagram Reel · Mar 28 · Last Saturday of March ──────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Last Saturday of March at Stardust Chicago.

Go out. Sing something.

710 N Clark · River North · Till 5am',
'#saturdaynight #lastdayofmarch #karaokechicago #stardustchicago #chicagonightlife #till5am',
'Last Saturday of March — full room, high energy, the "last night of the month" feeling without being corny.',
'Script: "last saturday of march. make it count."

0:00 · 2s — Room at full capacity — end of March energy
0:02 · 2s — Singer giving the last Saturday everything
0:04 · 2s — Crowd up — singing along, arms up
0:06 · 2s — Bar packed — the room in full motion
0:08 · 2s — Two people completely lost in a song
0:10 · 2s — Wide final shot — the last Saturday of March
0:12 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~16s',
'2026-03-28', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 3 · FRIDAY · had: Story + TikTok Video + Facebook Event — missing Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A13 · Instagram Reel · Apr 3 · Friday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago. Open till 4am.

710 N Clark · River North',
'#fridaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago',
'Friday night energy — the room from arrival to peak. Real crowd, real singers, real energy.',
'Script: "friday night at stardust. open till 4am."

0:00 · 2s — Exterior: neon on, doors open, Friday starting
0:02 · 2s — First wave through the door — coats off, ready
0:04 · 2s — Bar busy, drinks going, the Friday crowd finding seats
0:06 · 2s — First singer — Friday night officially on
0:08 · 2s — Room half-full and climbing fast
0:10 · 2s — Wide shot — the Friday room at capacity
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s',
'2026-04-03', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 4 · SATURDAY · had: Feed Post + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A14 · TikTok Video · Apr 4 · Saturday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'saturday night karaoke at stardust chicago. open till 5am. 710 n clark.',
'',
'Saturday uncut — one clip, no edits, raw audio. The room at peak. The shot that makes someone feel like they missed out.',
'Script: "saturday at stardust. this is what you''re missing."

0:00 · 20s — One uncut clip. The room at full Saturday peak — raw audio, no edits. Whoever is on the mic, however the crowd is responding. The moment that makes someone set an alarm for next Saturday.
0:20 · 4s  — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~24s',
'2026-04-04', '10:00');

-- ── POST A15 · Instagram Reel · Apr 4 · Saturday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Saturday night at Stardust Chicago. Till 5am.

710 N Clark · River North',
'#saturdaynight #karaokechicago #stardustchicago #chicagonightlife #till5am #latenightchicago',
'Saturday at full capacity — multiple singers, crowd fully activated, bar in motion.',
'Script: "saturday night at stardust chicago."

0:00 · 2s — Wide room, Saturday, wall to wall
0:02 · 2s — Singer absolutely nailing it mid-song
0:04 · 2s — Crowd reaction — multiple faces, all locked in
0:06 · 2s — Bar shot — drinks in every hand, Saturday in motion
0:08 · 2s — Another singer — completely different energy, same commitment
0:10 · 2s — Wide final shot — the room at absolute peak
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
'Story (9:16). Big Saturday crowd. "TONIGHT · TILL 5AM" text overlay.',
'2026-04-04', '16:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 9 · THURSDAY · had: Story + Tweet + Facebook Event — no Video/Reel
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A17 · TikTok Video · Apr 9 · Thursday ────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'thursday night karaoke at stardust chicago. 710 n clark. doors at 8.',
'',
'Thursday POV — the room from the moment you walk in through the first song. Handheld, natural.',
'Script: "thursday karaoke at stardust chicago."

0:00 · 2s — Front door — the decision
0:02 · 2s — Room opens up — warm, Thursday energy
0:04 · 2s — Approach the bar — the crowd settling in
0:06 · 2s — Stage comes into view — singer mid-song
0:08 · 2s — Find a spot — watch someone nail a song
0:10 · 2s — Wide room — a Thursday in full swing
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-04-09', '10:00');

-- ── POST A18 · Instagram Reel · Apr 9 · Thursday ─────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Thursday karaoke at Stardust Chicago.

710 N Clark · River North · Every Thursday',
'#thursdaynight #karaokechicago #stardustchicago #riverNorth #chicagonightlife #karaoke',
'Thursday crowd — the regulars, the curious, the ones who came once and couldn''t stop.',
'Script: "thursday at stardust chicago."

0:00 · 2s — Stage lit, mic in frame — the Thursday invitation
0:02 · 2s — Regular walking to the mic like they own it
0:04 · 2s — Crowd knowing every word before the singer starts
0:06 · 2s — First-timer getting up — the room immediately with them
0:08 · 2s — Wide room — Thursday at its best
0:10 · 2s — Singer finishing, crowd erupting
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s',
'2026-04-09', '11:00');

-- ══════════════════════════════════════════════════════════════════════════════
-- APR 10 · FRIDAY · had: Twitter/X Tweet only — single post on a Friday
-- ══════════════════════════════════════════════════════════════════════════════

-- ── POST A19 · TikTok Video · Apr 10 · Friday ─────────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'TikTok', 'Video', 'draft',
'friday night karaoke at stardust chicago. till 4am. 710 n clark.',
'',
'Fast-cut Friday. 1-second shots. Energy ramp from doors opening to room at peak.',
'Script: "friday night. stardust chicago."

0:00 · 1s — Neon sign: 710 N Clark
0:01 · 1s — Doors open, first crowd through
0:02 · 1s — Bar — first drinks ordered
0:03 · 1s — Mic in frame — the invitation
0:04 · 1s — Singer steps up
0:05 · 1s — First note — crowd reacts
0:06 · 1s — Room filling fast
0:07 · 1s — Two people singing along together
0:08 · 1s — Wide room — wall to wall
0:09 · 1s — Someone absolutely going for it
0:10 · 2s — On-screen: "EVERY FRIDAY · TILL 4AM"
0:12 · 4s — End card: STARDUST CHICAGO · 710 N CLARK
Total: ~16s',
'2026-04-10', '10:00');

-- ── POST A20 · Instagram Reel · Apr 10 · Friday ──────────────────────────────

INSERT INTO posts (user_id, platform, post_type, status, content, hashtags, media_notes, video_script, date, post_time) VALUES
(uid, 'Instagram', 'Reel', 'draft',
'Friday night at Stardust Chicago. The room is ready.

710 N Clark · River North · Till 4am',
'#fridaynight #karaokechicago #stardustchicago #chicagonightlife #latenightchicago',
'Friday night from empty to full — the transformation. Stage lit, first arrivals, room at capacity.',
'Script: "friday night at stardust chicago. the room is ready."

0:00 · 2s — Stage lit, room still quiet — the before
0:02 · 2s — First people through the door — the Friday starting
0:04 · 2s — Bar coming alive — the energy building
0:06 · 2s — Singer at mic — the night has officially started
0:08 · 2s — Room half-full, then suddenly full — Friday acceleration
0:10 · 2s — Wide shot — the room at Friday capacity
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
'Story (9:16). Friday night crowd energy. Warm bar shot with "TONIGHT" text overlay.',
'2026-04-10', '16:00');

END $$;
