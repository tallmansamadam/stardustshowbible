-- ─────────────────────────────────────────────────────────────────────────────
-- Stardust Chicago — Video Script Migration
-- Run in Supabase SQL Editor to populate video_script on existing posts
-- ─────────────────────────────────────────────────────────────────────────────

-- POST 04 · TikTok Video · Mar 12 · Thursday warmup
UPDATE posts SET video_script = $$Script: "thursday karaoke at stardust just hits different."

0:00 · 2s — Wide room, lights warming up, night just starting
0:02 · 2s — From back of crowd toward stage — first singer, room half-full
0:04 · 2s — Regulars arriving — coats off, drinks ordered
0:06 · 2s — Someone mid-song, crowd leaning in
0:08 · 2s — Bar in motion, the room getting busy
0:10 · 2s — Wide again, energy climbing
0:12 · 4s — End card: STARDUST CHICAGO · EVERY THURSDAY · 710 N CLARK
Total: ~16s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-03-12';

-- POST 06 · TikTok Video · Mar 13 · Friday opening
UPDATE posts SET video_script = $$Script: "friday night starts at stardust."

0:00 · 2s — Empty stage, mic stand lit, room waiting
0:02 · 2s — Doors open — first people through, coats still on
0:04 · 2s — First drinks poured at the bar
0:06 · 2s — First singer at the mic — nervous, good energy
0:08 · 2s — Room half-full, volume rising
0:10 · 2s — Wide shot — Friday energy taking hold
0:12 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~16s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-03-13';

-- POST 10 · TikTok Video · Mar 16 · Uncut weekend clip
UPDATE posts SET video_script = $$Script: "this is what stardust looks like on a karaoke night."

0:00 · 20s — One uncut clip: room at peak, someone mid-song, crowd fully in it. Raw audio. No edits.
0:20 · 3s  — End card: STARDUST · THU FRI SAT · 710 N CLARK
Total: ~23s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-03-16';

-- POST 25 · Instagram Reel · Mar 27 · Last Friday of March
UPDATE posts SET video_script = $$Script: "Last Friday of March. Don't waste it."

0:00 · 2s — Bar lit, stools mostly empty — room still early
0:02 · 2s — First people arriving, energy starting to build
0:04 · 2s — Lights up full — the room transformed
0:06 · 2s — Someone grabbing the mic — the night beginning
0:08 · 2s — Crowd filling in — drinks raised, voices joining
0:10 · 3s — Wide shot — the last Friday of March, room alive
0:13 · 4s — End card: LAST FRIDAY OF MARCH · STARDUST CHICAGO
Total: ~17s$$
WHERE platform = 'Instagram' AND post_type = 'Reel' AND date = '2026-03-27';

-- POST 26 · TikTok Video · Mar 27 · Behind the scenes setup
UPDATE posts SET video_script = $$Script: "getting stardust ready for tonight."

0:00 · 2s — Empty room, house lights still up
0:02 · 2s — Mics being checked — held up, tapped, tested
0:04 · 2s — QR cards placed on tables — hands doing the work
0:06 · 2s — Lights switching from house to stage wash
0:08 · 2s — Bar being set — bottles lined up, glasses polished
0:10 · 2s — Final wide shot — room ready, doors about to open
0:12 · 4s — End card: STARDUST CHICAGO · TONIGHT · 710 N CLARK
Total: ~16s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-03-27';

-- POST 31 · TikTok Video · Apr 2 · Electro Swing teaser (atmosphere only)
UPDATE posts SET video_script = $$Script: (no spoken words — ambient audio only)

0:00 · 3s — Extreme close-up: a candle flame, warm and still
0:03 · 3s — Bar edge in low light — a glass, a soft reflection
0:06 · 2s — Stage in near-darkness, one practical light source
0:08 · 2s — Slow fade to black
0:10 · 3s — End card: STARDUST CHICAGO (logo only)
Total: ~13s
Note: No music, no text, no voice. Room tone only.$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-02';

-- POST 33 · TikTok Video · Apr 3 · Friday night open
UPDATE posts SET video_script = $$Script: "it's friday. stardust chicago is open."

0:00 · 2s — Exterior: 710 N Clark, neon on, doors open
0:02 · 2s — Room filling — people through the door, energy starting
0:04 · 2s — Bar busy — drinks ordered, the room getting loud
0:06 · 2s — From back of crowd toward stage — singer in the distance
0:08 · 2s — Close on a face singing along — completely in it
0:10 · 2s — Wide room — fuller, louder, lights bright
0:12 · 4s — End card: STARDUST CHICAGO · OPEN TONIGHT · 710 N CLARK
Total: ~16s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-03';

-- POST 38 · Instagram Reel · Apr 8 · Electro Swing genre reveal
UPDATE posts SET video_script = $$Script: "The swing era never ended. It just got louder."

0:00 · 3s — Cold open: Caravan Palace audio, no title card. Art deco image, warm amber.
0:03 · 2s — A vintage detail — 1920s texture, something out of time
0:05 · 2s — On-screen: "imagine jazz."
0:07 · 2s — On-screen: "but it grooves like house."
0:09 · 2s — Wider art deco image — the full aesthetic
0:11 · 2s — On-screen: "electro swing"
0:13 · 4s — End card: COMING SOON · STARDUST CHICAGO · 710 N CLARK
Total: ~17s
Note: Audio must be Caravan Palace or Parov Stelar — let the 15 strongest seconds play uncut.$$
WHERE platform = 'Instagram' AND post_type = 'Reel' AND date = '2026-04-08';

-- POST 39 · TikTok Video · Apr 8 · Electro Swing TikTok reveal
UPDATE posts SET video_script = $$Script: "the swing era never ended. it just got louder."

0:00 · 3s — Cold open: Caravan Palace audio hits first. No title. Just the music.
0:03 · 2s — On-screen: "imagine jazz."
0:05 · 2s — On-screen: "but it grooves like house."
0:07 · 3s — Art deco visual — warm amber, sharp geometry, the Stardust aesthetic
0:10 · 2s — On-screen: "electro swing is coming to stardust chicago."
0:12 · 4s — End card: STARDUST CHICAGO (logo)
Total: ~16s
Note: Do not cut the music. Audio is the whole video.$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-08';

-- POST 67 · TikTok Video · Apr 11 · Saturday full capacity
UPDATE posts SET video_script = $$Script: "saturday night at stardust goes till 5am."

0:00 · 2s — Wide room at full capacity — every table, wall-to-wall
0:02 · 2s — Singer mid-song, fully committed
0:04 · 2s — From back of crowd toward stage — sea of people, singer in the distance
0:06 · 2s — Close on crowd — multiple faces, everyone locked in
0:08 · 2s — Different singer — totally different song, same energy
0:10 · 2s — Bar packed — drinks in every hand
0:12 · 2s — Wide again — the room at absolute peak
0:14 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~18s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-11';

-- POST 77 · TikTok Video · Apr 17 · Friday arrival sequence
UPDATE posts SET video_script = $$Script: "friday night karaoke at stardust chicago."

0:00 · 2s — Stage lit, mic in frame, room still empty — the promise
0:02 · 2s — Doors opening — first people through, coats on
0:04 · 2s — First drinks at the bar, the room coming alive
0:06 · 2s — First singer of the night at the mic
0:08 · 2s — Room half-full, volume picking up fast
0:10 · 2s — Someone in the crowd already singing along
0:12 · 2s — Wide shot — the Friday crowd building
0:14 · 4s — End card: STARDUST CHICAGO · EVERY FRIDAY · TILL 4AM
Total: ~18s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-17';

-- POST 80 · TikTok Video · Apr 18 · Uncut Saturday moment
UPDATE posts SET video_script = $$Script: "stardust on a saturday is something you have to see in person."

0:00 · 18s — One uncut clip, no edits, raw audio: the room at full Saturday energy. Whoever is on the mic, the crowd doing exactly what it does. The shot that makes someone feel like they missed something important.
0:18 · 4s  — End card: STARDUST · EVERY SATURDAY · TILL 5AM
Total: ~22s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-18';

-- POST 91 · TikTok Video · Apr 25 · Electro Swing night (tonight)
UPDATE posts SET video_script = $$Script: "electro swing night at stardust chicago. tonight."

0:00 · 2s — Cold open: Caravan Palace audio, no intro. Room still being set up.
0:02 · 2s — Lights being adjusted — warm amber filling the space
0:04 · 2s — Bar being stocked — bottles, glassware, the details
0:06 · 2s — Stage lit and ready — the space transformed
0:08 · 2s — A close art deco detail — something that signals the night
0:10 · 2s — On-screen: "TONIGHT"
0:12 · 4s — End card: ELECTRO SWING NIGHT · STARDUST CHICAGO · 710 N CLARK
Total: ~16s
Note: Caravan Palace or Parov Stelar audio runs uninterrupted throughout.$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-04-25';

-- POST 99 · TikTok Video · May 1 · First Friday of May
UPDATE posts SET video_script = $$Script: "first friday of may at stardust chicago."

0:00 · 2s — Wide room, fresh Friday energy — the first of the month
0:02 · 2s — People arriving ready — coats off fast, drinks ordered immediately
0:04 · 2s — From back of crowd toward stage — the room building
0:06 · 2s — First singer of May at the mic — committing fully
0:08 · 2s — Bar busy — the whole room in motion
0:10 · 2s — Wide shot — a full room on the first Friday of May
0:12 · 4s — End card: STARDUST CHICAGO · FIRST FRIDAY OF MAY · TILL 4AM
Total: ~16s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-05-01';

-- POST 110 · TikTok Video · May 9 · Late Saturday (past midnight)
UPDATE posts SET video_script = $$Script: "saturday karaoke at stardust hits different when you stay till 5am."

0:00 · 2s — Wide room deep into the night — past midnight, still packed
0:02 · 2s — Singer at mic — late in the night, voice still strong
0:04 · 2s — From back of crowd toward stage — the people who stayed, all of them
0:06 · 2s — Close on faces — that "we should leave but we're not leaving" look
0:08 · 2s — Bar still going — 1am, 2am energy
0:10 · 2s — Someone absolutely losing it on a song — the late-night peak
0:12 · 2s — Wide room — the "we stayed and it was worth it" shot
0:14 · 4s — End card: STARDUST CHICAGO · EVERY SATURDAY · TILL 5AM
Total: ~18s$$
WHERE platform = 'TikTok' AND post_type = 'Video' AND date = '2026-05-09';
