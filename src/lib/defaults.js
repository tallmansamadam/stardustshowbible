export const DEFAULT_CONTENT = {
  strategy: `## Stardust Club — Social & Brand Strategy

### Brand Voice
Warm, inclusive, a little theatrical. Every night should feel like an event, not just a bar visit.

### Content Pillars
1. **Karaoke Culture** — Celebrate performers, funny moments, crowd energy
2. **DJ Nights** — Energy, setlists, behind-the-scenes
3. **Electro Swing Sundays** — Educate + excite (many people don't know the genre)
4. **Community** — Regulars, staff spotlights, neighborhood love

### Platform Focus
- **Instagram**: Main hub. Reels > static. Target 4x/week.
- **TikTok**: Viral potential for karaoke clips. 2–3x/week.
- **Facebook**: Events page, older Chicago crowd. 1–2x/week.

### Electro Swing Launch Plan
- 3-week teaser campaign ("Something's Swinging This Way...")
- Collab with Chicago vintage/costume shops for cross-promo
- First Sunday: free entry, photographer, signature cocktail
- Press outreach: Chicago Reader, Time Out Chicago, Do312

### KPIs to Track
- Karaoke nights: headcount, repeat visitors
- DJ nights: door count
- Social: follower growth, reel views, event RSVPs`,

  karaoke: `## Karaoke Host Notes

### How It Works
- Patrons select their own songs from the Karafun library (pre-built)
- Seating is entirely patron choice — not managed by host
- Host role: energy, flow, hype — not song curation or crowd direction

### Equipment
- **Mac Mini** onsite running Karafun
- **4x wireless mics** — check all batteries and receiver connections before every show
- Signal chain: Mac Mini → Bluetooth receiver → Pioneer 2-channel DJ controller → Behringer X32 Compact (house)

### Hosting Flow
- You don't control the queue order — keep energy up between every singer
- Dead air = death. Have a hype line ready at all times
- Be extra encouraging with nervous first-timers
- Celebrate every performance without exception

### Night Arc (Typical)
- **Early (8–9:30pm)**: Lower stakes, familiar songs, warm the room
- **Peak (9:30–11pm)**: High energy, move the queue fast
- **Late (11pm+)**: Emotional bangers, duets, closing energy`,

  djsets: `## DJ Set Notes

### Resident Nights
- **Friday**: House/Top 40 crossover — mixed age crowd, keep it accessible
- **Saturday**: More energy, EDM-adjacent okay, read the floor

### Electro Swing Sunday Prep
Key artists: Caravan Palace, Parov Stelar, Tape Five, Caro Emerald, Waldeck

Set arc:
- Open with recognizable swing standards remixed
- Mid-set: peak electro energy
- Cool down: slower jazzy electronic

### Gear
- Pioneer standalone 2-channel DJ controller (onsite)
- Bring USB backups of all sets
- Coordinate with sound on bass levels re: neighboring units

### Set Notes Journal
- Keep a "crowd read" log after each night: what worked, what cleared the floor
- Experiment: 90s hip hop → swing transition as a potential signature move`,

  planning: `## Event Planning

### March 2026
- Every Fri/Sat: Karaoke + DJ nights (ongoing)
- Mid-March: Finalize Electro Swing Sunday launch date
- End of March: Venue walkthrough for Sunday setup needs

### April 2026
- Week 1: Electro Swing teaser campaign begins
- Week 2: Outreach to vintage shops + press contacts
- Week 3: Promo art finalized, event page live on all platforms
- Week 4 (target): **ELECTRO SWING SUNDAY LAUNCH** 🎉

### Ongoing To-Dos
- [ ] Get hi-res Stardust logo for social graphics
- [ ] Set up Linktree or link-in-bio for Instagram
- [ ] Create shared Google Drive for promo assets
- [ ] Build email list sign-up at venue (tablet at bar)
- [ ] Draft press release for Electro Swing launch
- [ ] Submit to Do312 and Chicago Reader event listings`,

  sound: `## Sound & Tech Setup

### Signal Chain (Karaoke)
Mac Mini (Karafun) → Bluetooth receiver → Pioneer 2ch DJ controller → Behringer X32 Compact → house speakers

### Signal Chain (DJ)
Pioneer controller (USB) → X32 Compact → house speakers

### X32 Compact — Current Focus Areas
- [ ] Dial in mic EQ for vocal clarity across wide range of untrained voices
- [ ] Set HPF on all mic channels (~120Hz) to cut low-end rumble
- [ ] Add gentle compression on vocal channels (2:1 ratio, slow attack)
- [ ] Build a dedicated monitor bus for performers
- [ ] Save scene once optimal settings found (label: "KARAOKE BASE")
- [ ] Verify gain staging at each handoff to avoid noise floor buildup

### EQ Notes
- Vocal presence boost: ~3–5kHz
- Cut muddiness: ~300–500Hz notch if needed
- Watch for feedback: typically ~2kHz and ~8kHz in live rooms

### Bluetooth Routing Note
BT receiver introduces potential latency and dropout risk. Worth testing:
- Wired USB or 3.5mm aux from Mac Mini to Pioneer as fallback
- Monitor BT signal stability over a full night before relying on it

### Monitor Setup
- [ ] Confirm wedge vs. IEM situation at venue
- [ ] Assign monitor bus on X32 (Bus 1 recommended for stage monitors)
- [ ] Set monitor mix: vocals louder than backing track for performers
- [ ] Walk the room and check for hot spots / dead zones

### Known Issues / To Investigate
- Document any feedback sources by position
- Note any hum or ground loop issues with Pioneer → X32 connection`,
}
