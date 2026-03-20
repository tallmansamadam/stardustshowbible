import { useState, useEffect } from 'react'
import { colors, fonts } from './styles'

const TAGS = ['general', 'karaoke', 'electro-swing', 'dj', 'marketing', 'sound', 'log', 'setlist', 'incident']
const TAG_COLORS = {
  general:        'rgba(255,255,255,0.3)',
  'electro-swing':'#d4a84a',
  karaoke:        '#e06060',
  dj:             '#6090e0',
  marketing:      '#a060d0',
  sound:          '#4ab8e0',
  log:            '#5acb8a',
  setlist:        '#e0a84a',
  incident:       '#e06060',
}

function escapeRegex(s) {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
}

function Highlight({ text, query }) {
  if (!query || !text) return <>{text}</>
  const parts = text.split(new RegExp(`(${escapeRegex(query)})`, 'gi'))
  return (
    <>
      {parts.map((part, i) =>
        part.toLowerCase() === query.toLowerCase()
          ? <mark key={i} style={{ background: 'rgba(212,168,74,0.28)', color: colors.text, borderRadius: 2, padding: '0 2px' }}>{part}</mark>
          : part
      )}
    </>
  )
}

export default function NotesTab({ notes, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing]           = useState(null)
  const [creating, setCreating]         = useState(false)
  const [loggingTonight, setLoggingTonight] = useState(false)
  const [loggingIncident, setLoggingIncident] = useState(false)
  const [confirming, setConfirming]     = useState(null)
  const [tagFilter, setTagFilter]       = useState('all')
  const [search, setSearch]             = useState('')

  const today = new Date().toISOString().slice(0, 10)
  const q = search.trim().toLowerCase()

  const isSetlistView  = tagFilter === 'setlist'
  const isLogView      = tagFilter === 'log'
  const isIncidentView = tagFilter === 'incident'

  const sectionTitle = isSetlistView  ? 'Setlist Archive'
                     : isLogView      ? 'Night Log'
                     : isIncidentView ? 'Incident Log'
                     : 'Notes & Ideas'

  // Filter by tag, then by search query
  const tagFiltered = (notes || []).filter(n => tagFilter === 'all' || n.tag === tagFilter)
  const filtered = q
    ? tagFiltered.filter(n =>
        n.title?.toLowerCase().includes(q) ||
        n.content?.toLowerCase().includes(q) ||
        n.tag?.toLowerCase().includes(q)
      )
    : tagFiltered

  // Sort: setlist + incident → date desc; others → pinned first
  const sorted = (isSetlistView || isIncidentView)
    ? [...filtered].sort((a, b) => (b.date || '').localeCompare(a.date || ''))
    : [
        ...filtered.filter(n => n.pinned),
        ...filtered.filter(n => !n.pinned),
      ]

  const hasAnyNotes = (notes || []).length > 0

  return (
    <div>
      {/* Header */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
        <h2 style={{ margin: 0, fontSize: 24, fontWeight: 300, color: isIncidentView ? colors.red : colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
          {sectionTitle}
        </h2>
        {canEdit && !creating && !loggingTonight && !loggingIncident && (
          <div style={{ display: 'flex', gap: 8 }}>
            {isLogView && (
              <button onClick={() => setLoggingTonight(true)} style={{
                background: 'rgba(90,203,138,0.1)', border: '1px solid rgba(90,203,138,0.28)',
                color: '#5acb8a', borderRadius: 8, padding: '7px 16px',
                fontSize: 12, fontFamily: fonts.mono, letterSpacing: '1px',
              }}>
                + Log Tonight
              </button>
            )}
            {isIncidentView && (
              <button onClick={() => setLoggingIncident(true)} style={{
                background: 'rgba(224,96,96,0.1)', border: '1px solid rgba(224,96,96,0.28)',
                color: colors.red, borderRadius: 8, padding: '7px 16px',
                fontSize: 12, fontFamily: fonts.mono, letterSpacing: '1px',
              }}>
                + Log Incident
              </button>
            )}
            <button onClick={() => setCreating(true)} style={{
              background: 'rgba(212,168,74,0.08)', border: '1px solid rgba(212,168,74,0.22)',
              color: colors.gold, borderRadius: 8, padding: '7px 16px',
              fontSize: 12, fontFamily: fonts.mono, letterSpacing: '1px',
            }}>
              + New Note
            </button>
          </div>
        )}
      </div>

      {/* Search bar */}
      <div style={{ position: 'relative', marginBottom: 14 }}>
        <span style={{ position: 'absolute', left: 12, top: '50%', transform: 'translateY(-50%)', fontSize: 13, opacity: 0.3, pointerEvents: 'none' }}>⌕</span>
        <input
          type="text"
          placeholder="Search notes…"
          value={search}
          onChange={e => setSearch(e.target.value)}
          style={{
            width: '100%', background: 'rgba(0,0,0,0.3)',
            border: `1px solid ${q ? 'rgba(212,168,74,0.3)' : 'rgba(255,255,255,0.08)'}`,
            borderRadius: 8, padding: '8px 36px 8px 34px',
            color: colors.text, fontSize: 13, fontFamily: fonts.body,
          }}
        />
        {q && (
          <button
            onClick={() => setSearch('')}
            style={{ position: 'absolute', right: 10, top: '50%', transform: 'translateY(-50%)', background: 'none', border: 'none', color: colors.textFaint, fontSize: 14, padding: '0 4px', cursor: 'pointer' }}
          >×</button>
        )}
      </div>

      {/* Search result count */}
      {q && (
        <div style={{ marginBottom: 10, fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1px' }}>
          {filtered.length === 0 ? 'No matches' : `${filtered.length} match${filtered.length === 1 ? '' : 'es'}`}
          {tagFilter !== 'all' && ` in ${tagFilter}`}
        </div>
      )}

      {/* Tag filters */}
      <div style={{ display: 'flex', gap: 5, flexWrap: 'wrap', marginBottom: 18 }}>
        {['all', ...TAGS].map(t => (
          <button key={t} onClick={() => setTagFilter(t)} style={{
            fontSize: 10, padding: '3px 10px', borderRadius: 20,
            border: tagFilter === t ? 'none' : `1px solid rgba(255,255,255,0.1)`,
            background: tagFilter === t ? (TAG_COLORS[t] || colors.gold) : 'transparent',
            color: tagFilter === t ? (t === 'general' ? '#fff' : '#09080f') : (TAG_COLORS[t] || colors.textMuted),
            fontFamily: fonts.mono, letterSpacing: '0.5px',
          }}>{t}</button>
        ))}
      </div>

      {/* Forms */}
      {loggingTonight && (
        <NoteForm
          initial={{ title: `Night Log — ${today}`, content: '', tag: 'log', date: today, pinned: false }}
          onSave={async n => { await onAdd(n); setLoggingTonight(false) }}
          onCancel={() => setLoggingTonight(false)}
        />
      )}
      {loggingIncident && (
        <NoteForm
          initial={{ title: `Incident — ${today}`, content: '', tag: 'incident', date: today, pinned: false }}
          onSave={async n => { await onAdd(n); setLoggingIncident(false) }}
          onCancel={() => setLoggingIncident(false)}
        />
      )}
      {creating && (
        <NoteForm
          onSave={async n => { await onAdd(n); setCreating(false) }}
          onCancel={() => setCreating(false)}
        />
      )}

      {/* Empty states */}
      {!hasAnyNotes && !creating && (
        <div style={{ textAlign: 'center', padding: '70px 20px', color: colors.textFaint, fontFamily: fonts.mono, fontSize: 12, letterSpacing: '1px' }}>
          <div style={{ fontSize: 32, marginBottom: 14, opacity: 0.25, fontFamily: fonts.display }}>✦</div>
          No notes yet
        </div>
      )}
      {hasAnyNotes && filtered.length === 0 && !creating && !loggingTonight && !loggingIncident && (
        <div style={{ textAlign: 'center', padding: '40px 20px', color: colors.textFaint, fontFamily: fonts.mono, fontSize: 11, letterSpacing: '1px' }}>
          {q ? `No notes matching "${search}"` : `No ${tagFilter} notes`}
        </div>
      )}

      {/* Notes list */}
      <div style={{ display: 'grid', gap: 10 }}>
        {sorted.map(note => {
          const tagColor = TAG_COLORS[note.tag] || 'rgba(255,255,255,0.3)'
          const isDateView = isSetlistView || isIncidentView
          return (
            <div key={note.id} className="glass card" style={{ borderRadius: 12, overflow: 'hidden' }}>
              <div style={{ height: 2, background: `linear-gradient(to right, ${tagColor}88, transparent)` }} />

              <div style={{ padding: '16px 20px' }}>
                {editing === note.id ? (
                  <NoteForm
                    initial={note}
                    onSave={async n => { await onUpdate({ ...note, ...n }); setEditing(null) }}
                    onCancel={() => setEditing(null)}
                  />
                ) : (
                  <>
                    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 10 }}>
                      <div style={{ display: 'flex', alignItems: 'baseline', gap: 10, flexWrap: 'wrap' }}>
                        <span style={{ fontSize: 16, fontWeight: 400, color: colors.text, fontFamily: fonts.display, letterSpacing: '0.3px' }}>
                          <Highlight text={note.title} query={q} />
                        </span>
                        <span style={{ fontSize: 10, padding: '2px 9px', borderRadius: 20, background: tagColor + '22', color: tagColor, fontFamily: fonts.mono, letterSpacing: '0.5px' }}>
                          {note.tag}
                        </span>
                      </div>

                      {canEdit && (
                        <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexShrink: 0, marginLeft: 12 }}>
                          {confirming === note.id ? (
                            <>
                              <span style={{ fontSize: 11, color: colors.red, fontFamily: fonts.mono }}>Delete?</span>
                              <button onClick={() => { onDelete(note.id); setConfirming(null) }} style={btnDanger}>Yes</button>
                              <button onClick={() => setConfirming(null)} style={btnGhost}>No</button>
                            </>
                          ) : (
                            <>
                              {!isIncidentView && (
                                <button
                                  onClick={() => onUpdate({ ...note, pinned: !note.pinned })}
                                  style={{ background: 'none', border: `1px solid rgba(255,255,255,0.1)`, color: note.pinned ? colors.gold : colors.textFaint, borderRadius: 4, padding: '3px 8px', cursor: 'pointer', fontSize: 12 }}
                                  title={note.pinned ? 'Unpin' : 'Pin'}
                                >
                                  {note.pinned ? '★' : '☆'}
                                </button>
                              )}
                              <button onClick={() => setEditing(note.id)} style={btnGhost}>Edit</button>
                              <button onClick={() => setConfirming(note.id)} style={{ ...btnGhost, color: colors.textFaint }}>✕</button>
                            </>
                          )}
                        </div>
                      )}
                    </div>

                    {note.content && (
                      <p style={{ margin: 0, fontSize: 13, color: colors.textMuted, lineHeight: 1.75, whiteSpace: 'pre-wrap', fontFamily: fonts.body }}>
                        <Highlight text={note.content} query={q} />
                      </p>
                    )}

                    {note.date && (
                      <div style={{ marginTop: 10, fontSize: isDateView ? 12 : 10, color: isDateView ? tagColor : colors.textFaint, fontFamily: fonts.mono, letterSpacing: '0.5px' }}>
                        {isDateView ? '📅 ' : ''}{note.date}
                      </div>
                    )}
                  </>
                )}
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

function NoteForm({ initial, onSave, onCancel }) {
  const [form, setForm] = useState(initial || {
    title: '', content: '', tag: 'general', date: new Date().toISOString().slice(0, 10), pinned: false,
  })
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    const handler = (e) => { if (e.key === 'Escape') onCancel() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [])

  const handle = async () => {
    if (!form.title.trim()) return
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div style={{ background: 'rgba(0,0,0,0.35)', border: '1px solid rgba(212,168,74,0.18)', borderRadius: 12, padding: 20, marginBottom: 14 }}>
      <div className="grid-2" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10, marginBottom: 10 }}>
        <div>
          <label style={labelSt}>Title</label>
          <input placeholder="Note title" value={form.title} onChange={e => setForm(f => ({ ...f, title: e.target.value }))} style={inputSt} />
        </div>
        <div>
          <label style={labelSt}>Tag</label>
          <select value={form.tag} onChange={e => setForm(f => ({ ...f, tag: e.target.value }))} style={inputSt}>
            {TAGS.map(t => <option key={t} value={t}>{t}</option>)}
          </select>
        </div>
      </div>

      <div style={{ marginBottom: 10 }}>
        <label style={labelSt}>Content</label>
        <textarea
          rows={4} placeholder="Write your note…" value={form.content}
          onChange={e => setForm(f => ({ ...f, content: e.target.value }))}
          style={{ ...inputSt, resize: 'vertical', lineHeight: 1.7, fontFamily: fonts.body }}
        />
      </div>

      <div style={{ marginBottom: 18 }}>
        <label style={labelSt}>Date</label>
        <input type="date" value={form.date} onChange={e => setForm(f => ({ ...f, date: e.target.value }))} style={{ ...inputSt, width: 'auto' }} />
      </div>

      <div style={{ display: 'flex', gap: 10 }}>
        <button onClick={handle} disabled={saving || !form.title.trim()} style={btnPrimary(saving || !form.title.trim())}>
          {saving ? 'Saving…' : 'Save Note'}
        </button>
        <button onClick={onCancel} style={btnGhost}>Cancel</button>
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
