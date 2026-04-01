# Stardust Organizer — Architecture

Private event management SPA for Stardust Chicago (710 N Clark, River North). Coordinates karaoke nights, social media scheduling, technical setup, and crew communication.

---

## Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18.2 + Vite 5.0 |
| Backend | Supabase (Postgres + Auth + Realtime) |
| Deployment | Netlify (also GitHub Pages compatible) |
| Fonts | Cormorant Garamond, DM Mono, DM Sans (Google Fonts) |

**Base path:** `/stardustshowbible/` (set in `vite.config.js`)

---

## Source Layout

```
src/
  main.jsx              — React entry point
  App.jsx               — Root: auth, data loading, tab routing, role resolution
  lib/
    supabase.js         — Supabase client (reads VITE_SUPABASE_URL, VITE_SUPABASE_ANON_KEY)
    permissions.js      — Role definitions, tab list, canEdit() helper
    defaults.js         — Fallback markdown content for all long-form tabs
  components/
    styles.js           — Shared color/font theme tokens
    LoginPage.jsx       — Email/password auth form
    NotesTab.jsx        — Notes & Ideas (searchable, taggable, pinnable)
    PostsTab.jsx        — Social media content calendar
    MarkdownEditor.jsx  — Shared editor for long-form content tabs
    NightOf.jsx         — Event night checklist (real-time shared state)
```

---

## Tabs

Defined in `src/lib/permissions.js` — `TABS` array drives both the tab bar and permission checks.

| Tab | Section key | Component |
|-----|------------|-----------|
| Notes | `notes` | `NotesTab` |
| Social Posts | `posts` | `PostsTab` |
| Show Bible | `showbible` | `MarkdownEditor` |
| Night Of | `nightof` | `NightOf` |
| Karaoke | `karaoke` | `MarkdownEditor` |
| DJ Sets | `djsets` | `MarkdownEditor` |
| Planning | `planning` | `MarkdownEditor` |
| Sound & Tech | `sound` | `MarkdownEditor` |
| Contacts | `contacts` | `MarkdownEditor` |

---

## Roles & Permissions

Roles are assigned in `App.jsx` → `ROLE_MAP` (email → role). Unrecognized emails default to `editor`.

| Role | Can edit |
|------|---------|
| `editor` | Everything |
| `manager` | posts, showbible, planning, sound, nightof, contacts |
| `viewer` | Nothing (read-only) |

`canEdit(role, section)` (from `permissions.js`) is passed down to components as a prop.

---

## Database

Three tables in Supabase. All use Row Level Security — authenticated users can read/write all rows.

### `notes`
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid | set on insert |
| title | text | |
| content | text | |
| tag | text | general, karaoke, electro-swing, dj, marketing, sound, log, setlist, incident |
| date | text | YYYY-MM-DD |
| pinned | boolean | |
| created_at / updated_at | timestamptz | |

### `posts`
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid | |
| platform | text | instagram, tiktok, facebook, twitter |
| post_type | text | post, reel, story, etc. |
| status | text | idea → draft → scheduled → posted |
| content | text | caption |
| hashtags | text | |
| media_notes | text | |
| video_script | text | for Reels/TikTok |
| date | text | YYYY-MM-DD |
| post_time | text | HH:MM (platform defaults applied by migration) |
| created_at / updated_at | timestamptz | |

### `events`
| Column | Type | Notes |
|--------|------|-------|
| id | uuid PK | |
| user_id | uuid | set on insert |
| title | text | |
| type | text | booking, private-event, dj-set, photo-shoot, maintenance, other |
| start_date | text | YYYY-MM-DD |
| end_date | text | YYYY-MM-DD (optional, defaults to start_date for single-day) |
| notes | text | |
| created_at / updated_at | timestamptz | |

Run `supabase-events.sql` to create this table.

### `content`
Key/value store for long-form docs and checklist state.

| key | Purpose |
|-----|---------|
| `showbible`, `karaoke`, `djsets`, `planning`, `sound`, `contacts` | Markdown content for each tab |
| `checklist-YYYY-MM-DD` | Night Of checklist state (JSON) for a specific date |
| `checklist-logged-YYYY-MM-DD` | Marker set after a night's log has been auto-saved |

---

## Key Patterns

### Data flow
`App.jsx` owns all state and DB calls. Components receive data + CRUD callbacks as props. No global state library — intentionally simple.

### Content loading
On login, `loadAll()` runs `loadNotes()`, `loadPosts()`, and `loadContent()` in parallel. Long-form content falls back to `DEFAULT_CONTENT` from `defaults.js` if no DB row exists yet.

### Flash notifications
`flash(msg)` in `App.jsx` sets `saveMsg` for 2.2s. Displayed as a fixed toast in the top-right corner.

### Escape key
`NotesTab` and `MarkdownEditor` attach a `keydown` listener for Escape to cancel edits. Listeners are cleaned up on unmount.

### Realtime checklist (`NightOf.jsx`)
- Subscribes to a Supabase Realtime channel keyed by date (`checklist-YYYY-MM-DD`)
- `ignoreRef` flag prevents the local user's own saves from triggering a re-render loop
- At 7am UTC daily, the previous night's checklist auto-saves to Notes (tag: `log`) if not already logged — checked via `checklist-logged-YYYY-MM-DD` marker

### Post recycling (`PostsTab.jsx`)
"Recycle stale" reschedules past draft/idea posts to the next available same-weekday with no scheduling conflict.

---

## SQL Files

| File | Purpose |
|------|---------|
| `supabase-schema.sql` | Table creation + RLS policies + column migrations |
| `supabase-post-times.sql` | Backfills `post_time` with platform defaults |
| `supabase-posts-seed.sql` | ~200 social posts, Mar–May 2026 (requires user_id) |
| `supabase-posts-batch1-additions.sql` | Video/reel additions for Apr 11+ |
| `supabase-posts-batch2.sql` | 49 posts, May 11–Jun 14, 2026 |
| `supabase-posts-batch3.sql` | 53 posts, Jun 15–Jul 19, 2026 |
| `supabase-video-scripts.sql` | Frame-by-frame video scripts for TikTok/Reels |

Apply in order: schema → post-times → seed → batch1 → batch2 → batch3.

---

## Deployment

```bash
npm run build    # outputs to dist/
```

- **Netlify:** drag-and-drop `dist/` or connect repo. No server-side config needed.
- **GitHub Pages:** SPA redirect handled by `public/404.html` (copies `index.html`).
- No build-time secrets — Supabase anon key is safe for client-side use and lives in `.env.local` (gitignored).

---

## Theme

Defined in `src/components/styles.js`.

| Token | Value |
|-------|-------|
| Background | `#090810` (near-black) |
| Gold accent | `#d4a84a` |
| Purple accent | `#9b8fd4` |
| Success green | `#5acb8a` |
| Display font | Cormorant Garamond |
| Mono / labels | DM Mono |
| Body | DM Sans |

Animated star field rendered by the `<Stars />` component inline in `App.jsx`.
