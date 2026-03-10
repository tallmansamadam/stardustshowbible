# Stardust Club Organizer — Setup Guide

## Overview
Stack: React (Vite) + Supabase (auth + database) + Netlify or Vercel

---

## Step 1: Create a Supabase Project

1. Go to https://supabase.com and sign up (free)
2. Click **New Project**, name it "stardust-organizer"
3. Set a strong database password, save it somewhere safe
4. Wait ~2 minutes for the project to provision

---

## Step 2: Set Up the Database

1. In your Supabase dashboard, go to **SQL Editor**
2. Click **New query**
3. Paste the entire contents of `supabase-schema.sql`
4. Click **Run**

You should see all three tables created: `notes`, `posts`, `content`

---

## Step 3: Create User Accounts

1. In Supabase dashboard → **Authentication** → **Users**
2. Click **Add user** → **Create new user**
3. Create two accounts:
   - Your email + password
   - Owner's email + password (send them the password separately)

---

## Step 4: Set User Roles

Open `src/App.jsx` and find the `ROLE_MAP` near the top:

```js
const ROLE_MAP = {
  // 'you@example.com': 'editor',
  // 'owner@example.com': 'manager',
}
```

Uncomment and fill in the actual emails:

```js
const ROLE_MAP = {
  'yourname@gmail.com': 'editor',
  'owner@stardustchicago.com': 'manager',
}
```

Save the file.

---

## Step 5: Configure Environment Variables

1. Copy `.env.example` to a new file called `.env.local`
2. In Supabase dashboard → **Settings** → **API**, copy:
   - **Project URL** → paste as `VITE_SUPABASE_URL`
   - **anon / public key** → paste as `VITE_SUPABASE_ANON_KEY`

Your `.env.local` should look like:
```
VITE_SUPABASE_URL=https://abcdefghij.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Never commit `.env.local` to git.**

---

## Step 6: Test Locally

```bash
npm install
npm run dev
```

Open http://localhost:5173, log in with one of your accounts, and confirm everything loads.

---

## Step 7: Deploy to Netlify

### Option A: Drag and Drop
1. Run `npm run build` — this creates a `dist/` folder
2. Go to https://netlify.com → **Add new site** → **Deploy manually**
3. Drag the `dist/` folder into the deploy box

### Option B: Git-connected (recommended for ongoing updates)
1. Push this project to a GitHub repo (make sure `.env.local` is in `.gitignore`)
2. In Netlify → **Add new site** → **Import from Git**
3. Connect your repo, set build command to `npm run build`, publish dir to `dist`
4. Under **Site settings** → **Environment variables**, add:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
5. Trigger a deploy

### Option C: Vercel
Same as Option B but on https://vercel.com. Environment variables go under **Settings** → **Environment Variables**.

---

## Step 8: Share with the Owner

Send the owner:
- The URL of your deployed site
- Their email and the password you set for them in Supabase
- They'll see all tabs but can only edit: Social Posts, Strategy, Planning, Sound & Tech

---

## Updating Roles Later

To change who can edit what, edit `src/lib/permissions.js`:

```js
export const EDIT_PERMISSIONS = {
  editor:  ['notes', 'posts', 'strategy', 'karaoke', 'djsets', 'planning', 'sound'],
  manager: ['posts', 'strategy', 'planning', 'sound'],
}
```

Redeploy after changes.

---

## File Structure

```
stardust/
├── src/
│   ├── App.jsx              ← Main app + auth + data layer
│   ├── main.jsx             ← Entry point
│   ├── lib/
│   │   ├── supabase.js      ← Supabase client
│   │   ├── permissions.js   ← Role definitions
│   │   └── defaults.js      ← Default content for each section
│   └── components/
│       ├── LoginPage.jsx
│       ├── NotesTab.jsx
│       ├── PostsTab.jsx
│       ├── MarkdownEditor.jsx
│       └── styles.js
├── supabase-schema.sql      ← Run this in Supabase SQL editor
├── netlify.toml             ← SPA routing fix for Netlify
├── .env.example             ← Copy to .env.local and fill in
├── vite.config.js
├── index.html
└── package.json
```
