import { useState } from 'react'
import { colors, fonts } from './styles'

// ── Platform config ────────────────────────────────────────────────────────────
const PLATFORMS = {
  Instagram: {
    color: '#E1306C',
    postTypes: ['Feed Post', 'Reel', 'Story', 'Carousel'],
    captionLabel: 'Caption',
    charLimit: 2200,
    hashtagLimit: 30,
    hasHashtags: true,
    hasMediaNotes: true,
    placeholder: 'Write your caption…',
  },
  TikTok: {
    color: '#69C9D0',
    postTypes: ['Video', 'Stitch', 'Story', 'Live'],
    captionLabel: 'Caption',
    charLimit: 2200,
    hashtagLimit: null,
    hasHashtags: true,
    hasMediaNotes: true,
    placeholder: 'Write your TikTok caption…',
  },
  Facebook: {
    color: '#4A90D9',
    postTypes: ['Post', 'Event', 'Story', 'Reel'],
    captionLabel: 'Post Copy',
    charLimit: null,
    hashtagLimit: null,
    hasHashtags: false,
    hasMediaNotes: true,
    placeholder: 'Write your post…',
  },
  'Twitter/X': {
    color: '#aaaaaa',
    postTypes: ['Tweet', 'Thread', 'Reply', 'Quote Tweet'],
    captionLabel: 'Tweet',
    charLimit: 280,
    hashtagLimit: null,
    hasHashtags: false,
    hasMediaNotes: false,
    placeholder: "What's happening?",
  },
}

const STATUSES = ['idea', 'draft', 'scheduled', 'posted']
const STATUS_COLORS = { idea: '#9b8fd4', draft: '#e0a84a', scheduled: '#4ab8e0', posted: '#5acb8a' }

function charColor(count, limit) {
  if (!limit) return colors.textFaint
  const pct = count / limit
  if (pct >= 1)    return colors.red
  if (pct >= 0.85) return '#e0a84a'
  return colors.textFaint
}

function countHashtags(str) {
  return (str?.match(/#\S+/g) || []).length
}

// ── Main ──────────────────────────────────────────────────────────────────────
export default function PostsTab({ posts, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing] = useState(null)
  const [creating, setCreating] = useState(false)
  const [filterPlatform, setFilterPlatform] = useState('all')
  const [filterStatus, setFilterStatus] = useState('all')
  const [confirming, setConfirming] = useState(null)

  const filtered = (posts || []).filter(p =>
    (filterPlatform === 'all' || p.platform === filterPlatform) &&
    (filterStatus   === 'all' || p.status   === filterStatus)
  )

  return (
    <div>
      {/* Header */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
        <h2 style={{ margin: 0, fontSize: 24, fontWeight: 300, color: colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
          Social Posts
        </h2>
        {canEdit && !creating && (
          <button
            onClick={() => setCreating(true)}
            style={{
              background: 'rgba(212,168,74,0.08)', border: '1px solid rgba(212,168,74,0.22)',
              color: colors.gold, borderRadius: 8, padding: '7px 16px',
              fontSize: 12, fontFamily: fonts.mono, letterSpacing: '1px',
            }}
          >
            + New Post
          </button>
        )}
      </div>

      {/* Filter row */}
      <div style={{ display: 'flex', gap: 16, marginBottom: 22, flexWrap: 'wrap', alignItems: 'center' }}>
        <div style={{ display: 'flex', gap: 5 }}>
          {['all', ...Object.keys(PLATFORMS)].map(p => {
            const active = filterPlatform === p
            const col = PLATFORMS[p]?.color
            return (
              <button key={p} onClick={() => setFilterPlatform(p)} style={{
                fontSize: 10, padding: '4px 12px', borderRadius: 20,
                border: active ? 'none' : `1px solid ${col || 'rgba(255,255,255,0.12)'}44`,
                background: active ? (col || colors.gold) : 'transparent',
                color: active ? '#fff' : (col || colors.textMuted),
                fontFamily: fonts.mono, letterSpacing: '0.5px',
                fontWeight: active ? '500' : '400',
              }}>{p}</button>
            )
          })}
        </div>
        <div style={{ width: 1, height: 14, background: 'rgba(255,255,255,0.1)' }} />
        <div style={{ display: 'flex', gap: 5 }}>
          {['all', ...STATUSES].map(s => {
            const active = filterStatus === s
            const col = STATUS_COLORS[s]
            return (
              <button key={s} onClick={() => setFilterStatus(s)} style={{
                fontSize: 10, padding: '4px 12px', borderRadius: 20,
                border: active ? 'none' : `1px solid ${col || 'rgba(255,255,255,0.12)'}44`,
                background: active ? (col || colors.gold) : 'transparent',
                color: active ? '#0d0b14' : (col || colors.textMuted),
                fontFamily: fonts.mono, letterSpacing: '0.5px',
                fontWeight: active ? '500' : '400',
              }}>{s}</button>
            )
          })}
        </div>
      </div>

      {creating && (
        <PostForm onSave={async p => { await onAdd(p); setCreating(false) }} onCancel={() => setCreating(false)} />
      )}

      {/* Cards */}
      <div style={{ display: 'grid', gap: 10 }}>
        {filtered.map(post => {
          const cfg = PLATFORMS[post.platform] || {}
          return (
            <div key={post.id} className="glass card" style={{ borderRadius: 12, overflow: 'hidden' }}>
              {/* Platform bar */}
              <div style={{ height: 2, background: `linear-gradient(to right, ${cfg.color || colors.border}99, transparent)` }} />

              <div style={{ padding: '16px 20px' }}>
                {editing === post.id ? (
                  <PostForm
                    initial={post}
                    onSave={async p => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                    onCancel={() => setEditing(null)}
                  />
                ) : (
                  <>
                    {/* Meta */}
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
                      <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexWrap: 'wrap' }}>
                        <span style={{ fontSize: 10, fontWeight: '600', color: cfg.color, background: cfg.color + '18', padding: '2px 10px', borderRadius: 20, fontFamily: fonts.mono, letterSpacing: '0.5px' }}>
                          {post.platform}
                        </span>
                        {post.post_type && (
                          <span style={{ fontSize: 10, color: colors.textMuted, background: 'rgba(255,255,255,0.05)', padding: '2px 9px', borderRadius: 20, border: '1px solid rgba(255,255,255,0.08)', fontFamily: fonts.mono }}>
                            {post.post_type}
                          </span>
                        )}
                        <span style={{ fontSize: 10, background: (STATUS_COLORS[post.status] || '#888') + '22', color: STATUS_COLORS[post.status] || '#888', padding: '2px 9px', borderRadius: 20, fontFamily: fonts.mono }}>
                          {post.status}
                        </span>
                        {post.date && <span style={{ fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono }}>{post.date}</span>}
                      </div>

                      {canEdit && (
                        <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexShrink: 0, marginLeft: 10 }}>
                          {confirming === post.id ? (
                            <>
                              <span style={{ fontSize: 11, color: colors.red, fontFamily: fonts.mono }}>Delete?</span>
                              <button onClick={() => { onDelete(post.id); setConfirming(null) }} style={btnDanger}>Yes</button>
                              <button onClick={() => setConfirming(null)} style={btnGhost}>No</button>
                            </>
                          ) : (
                            <>
                              <button onClick={() => setEditing(post.id)} style={btnGhost}>Edit</button>
                              <button onClick={() => setConfirming(post.id)} style={{ ...btnGhost, color: colors.textFaint }}>✕</button>
                            </>
                          )}
                        </div>
                      )}
                    </div>

                    {post.content && (
                      <p style={{ margin: '0 0 10px', fontSize: 13, color: colors.text, lineHeight: 1.75, whiteSpace: 'pre-wrap', fontFamily: fonts.body }}>
                        {post.content}
                      </p>
                    )}

                    {post.hashtags && (
                      <p style={{ margin: '0 0 8px', fontSize: 12, color: '#6090e0', lineHeight: 1.6, fontFamily: fonts.mono }}>
                        {post.hashtags}
                      </p>
                    )}

                    {post.media_notes && (
                      <div style={{ fontSize: 12, color: colors.textFaint, borderTop: '1px solid rgba(255,255,255,0.06)', paddingTop: 10, marginTop: 6, fontFamily: fonts.body }}>
                        <span style={{ marginRight: 7, opacity: 0.6 }}>📷</span>{post.media_notes}
                      </div>
                    )}

                    {cfg.charLimit && post.content && (
                      <div style={{ marginTop: 10, fontSize: 10, color: charColor(post.content.length, cfg.charLimit), fontFamily: fonts.mono, letterSpacing: '0.5px' }}>
                        {post.content.length} / {cfg.charLimit}
                        {cfg.hasHashtags && post.hashtags && ` · ${countHashtags(post.hashtags)} tags${cfg.hashtagLimit ? ` / ${cfg.hashtagLimit}` : ''}`}
                      </div>
                    )}
                  </>
                )}
              </div>
            </div>
          )
        })}

        {filtered.length === 0 && !creating && (
          <div style={{ textAlign: 'center', padding: '70px 20px', color: colors.textFaint, fontFamily: fonts.mono, fontSize: 11, letterSpacing: '1px' }}>
            <div style={{ fontSize: 32, marginBottom: 14, opacity: 0.2, fontFamily: fonts.display }}>✦</div>
            No posts here yet
          </div>
        )}
      </div>
    </div>
  )
}

// ── Post form ──────────────────────────────────────────────────────────────────
function PostForm({ initial, onSave, onCancel }) {
  const [form, setForm] = useState(initial || {
    platform: 'Instagram', post_type: 'Feed Post', status: 'idea',
    content: '', hashtags: '', media_notes: '', date: '',
  })
  const [saving, setSaving] = useState(false)

  const cfg = PLATFORMS[form.platform] || {}
  const charCount = form.content?.length || 0
  const overLimit = cfg.charLimit && charCount > cfg.charLimit
  const hashtagCount = countHashtags(form.hashtags)
  const overHashtagLimit = cfg.hashtagLimit && hashtagCount > cfg.hashtagLimit
  const canSave = form.content?.trim() && !overLimit && !overHashtagLimit

  const set = (key, val) => setForm(f => ({ ...f, [key]: val }))
  const setPlatform = p => setForm(f => ({ ...f, platform: p, post_type: PLATFORMS[p]?.postTypes[0] || '' }))

  const handle = async () => {
    if (!canSave) return
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div style={{ background: 'rgba(0,0,0,0.35)', border: '1px solid rgba(212,168,74,0.18)', borderRadius: 12, padding: 20, marginBottom: 14 }}>
      {/* Row 1: Platform / Type / Status / Date */}
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr', gap: 10, marginBottom: 14 }}>
        <div>
          <label style={labelSt}>Platform</label>
          <select value={form.platform} onChange={e => setPlatform(e.target.value)} style={inputSt}>
            {Object.keys(PLATFORMS).map(p => <option key={p} value={p}>{p}</option>)}
          </select>
        </div>
        <div>
          <label style={labelSt}>Type</label>
          <select value={form.post_type} onChange={e => set('post_type', e.target.value)} style={inputSt}>
            {(cfg.postTypes || []).map(t => <option key={t} value={t}>{t}</option>)}
          </select>
        </div>
        <div>
          <label style={labelSt}>Status</label>
          <select value={form.status} onChange={e => set('status', e.target.value)} style={inputSt}>
            {STATUSES.map(s => <option key={s} value={s}>{s}</option>)}
          </select>
        </div>
        <div>
          <label style={labelSt}>Date</label>
          <input type="date" value={form.date} onChange={e => set('date', e.target.value)} style={inputSt} />
        </div>
      </div>

      {/* Caption */}
      <div style={{ marginBottom: 12 }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
          <label style={labelSt}>{cfg.captionLabel || 'Caption'}</label>
          {cfg.charLimit && (
            <span style={{ fontSize: 10, color: charColor(charCount, cfg.charLimit), fontFamily: "'DM Mono', monospace" }}>
              {charCount} / {cfg.charLimit}
            </span>
          )}
        </div>
        <textarea
          rows={5} placeholder={cfg.placeholder || 'Write your post…'} value={form.content}
          onChange={e => set('content', e.target.value)}
          style={{ ...inputSt, resize: 'vertical', lineHeight: 1.7, fontFamily: fonts.body, borderColor: overLimit ? colors.red : undefined }}
        />
      </div>

      {/* Hashtags */}
      {cfg.hasHashtags && (
        <div style={{ marginBottom: 12 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 6 }}>
            <label style={labelSt}>Hashtags</label>
            <span style={{ fontSize: 10, color: overHashtagLimit ? colors.red : colors.textFaint, fontFamily: "'DM Mono', monospace" }}>
              {hashtagCount}{cfg.hashtagLimit ? ` / ${cfg.hashtagLimit}` : ''} tags
            </span>
          </div>
          <textarea
            rows={2} placeholder="#electro #chicago #nightlife…" value={form.hashtags}
            onChange={e => set('hashtags', e.target.value)}
            style={{ ...inputSt, resize: 'vertical', fontFamily: "'DM Mono', monospace", fontSize: 12, color: '#6090e0', borderColor: overHashtagLimit ? colors.red : undefined }}
          />
        </div>
      )}

      {/* Media notes */}
      {cfg.hasMediaNotes && (
        <div style={{ marginBottom: 18 }}>
          <label style={labelSt}>Visual / Media Notes</label>
          <input
            placeholder="Describe the photo, video, or graphic needed…" value={form.media_notes}
            onChange={e => set('media_notes', e.target.value)}
            style={{ ...inputSt, marginTop: 6 }}
          />
        </div>
      )}

      <div style={{ display: 'flex', gap: 10, alignItems: 'center' }}>
        <button onClick={handle} disabled={saving || !canSave} style={btnPrimary(saving || !canSave)}>
          {saving ? 'Saving…' : 'Save Post'}
        </button>
        <button onClick={onCancel} style={btnGhost}>Cancel</button>
        {overLimit && <span style={{ fontSize: 11, color: colors.red, fontFamily: fonts.mono }}>Over character limit</span>}
        {overHashtagLimit && <span style={{ fontSize: 11, color: colors.red, fontFamily: fonts.mono }}>Too many hashtags</span>}
      </div>
    </div>
  )
}

// ── Shared styles ──────────────────────────────────────────────────────────────
const labelSt = {
  display: 'block', fontSize: 9, letterSpacing: '2px', textTransform: 'uppercase',
  color: 'rgba(155,143,212,0.6)', marginBottom: 6, fontFamily: "'DM Mono', monospace",
}
const inputSt = {
  width: '100%', background: 'rgba(0,0,0,0.42)', border: '1px solid rgba(255,255,255,0.1)',
  borderRadius: 8, padding: '10px 13px', color: '#f0e8d0', fontSize: 13,
}
const btnPrimary = (disabled) => ({
  background: disabled ? 'rgba(255,255,255,0.06)' : 'linear-gradient(105deg, #b8862e 0%, #d4a84a 45%, #e8c06a 100%)',
  color: disabled ? 'rgba(255,255,255,0.2)' : '#09080f',
  border: 'none', borderRadius: 8, padding: '8px 20px',
  fontSize: 11, fontFamily: "'DM Mono', monospace", letterSpacing: '1px',
  boxShadow: disabled ? 'none' : '0 2px 16px rgba(212,168,74,0.18)',
})
const btnGhost = {
  background: 'none', border: '1px solid rgba(255,255,255,0.1)',
  color: 'rgba(155,143,212,0.8)', borderRadius: 8,
  padding: '8px 14px', fontSize: 11, fontFamily: "'DM Mono', monospace", letterSpacing: '0.5px',
}
const btnDanger = {
  background: 'rgba(224,96,96,0.1)', border: '1px solid rgba(224,96,96,0.3)',
  color: '#e06060', borderRadius: 8, padding: '4px 10px',
  fontSize: 11, fontFamily: "'DM Mono', monospace",
}
