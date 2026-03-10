import { useState } from 'react'
import { colors, fonts } from './styles'

const TAGS = ['general', 'electro-swing', 'karaoke', 'dj', 'marketing', 'sound']
const TAG_COLORS = {
  general: '#888', 'electro-swing': '#d4a84a', karaoke: '#e06060',
  dj: '#6090e0', marketing: '#a060d0', sound: '#4ab8e0'
}

export default function NotesTab({ notes, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing] = useState(null)
  const [creating, setCreating] = useState(false)
  const [confirming, setConfirming] = useState(null)

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 18 }}>
        <h2 style={{ margin: 0, fontSize: 18, color: colors.gold, fontWeight: 'normal', fontFamily: fonts.display }}>Notes & Ideas</h2>
        {canEdit && !creating && (
          <button onClick={() => setCreating(true)} style={{ background: colors.gold + '22', border: `1px solid ${colors.gold}66`, color: colors.gold, borderRadius: 6, padding: '6px 14px', cursor: 'pointer', fontSize: 13 }}>
            + New Note
          </button>
        )}
      </div>

      {creating && (
        <NoteForm onSave={async (n) => { await onAdd(n); setCreating(false) }} onCancel={() => setCreating(false)} />
      )}

      {(notes || []).length === 0 && !creating && (
        <div style={{ textAlign: 'center', padding: '60px 20px', color: colors.textFaint, fontSize: 13 }}>
          <div style={{ fontSize: 28, marginBottom: 12, opacity: 0.3 }}>✦</div>
          No notes yet. Add one to get started.
        </div>
      )}

      <div style={{ display: 'grid', gap: 10 }}>
        {(notes || []).map(note => (
          <div key={note.id} className="card" style={{ background: colors.surface, border: `1px solid ${colors.border}`, borderRadius: 10, padding: '16px 20px' }}>
            {editing === note.id ? (
              <NoteForm
                initial={note}
                onSave={async (n) => { await onUpdate({ ...note, ...n }); setEditing(null) }}
                onCancel={() => setEditing(null)}
              />
            ) : (
              <>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 8 }}>
                  <div style={{ display: 'flex', alignItems: 'center', gap: 10, flexWrap: 'wrap' }}>
                    <span style={{ fontWeight: '600', fontSize: 14, color: colors.text }}>{note.title}</span>
                    <span style={{ fontSize: 11, background: (TAG_COLORS[note.tag] || '#888') + '28', color: TAG_COLORS[note.tag] || '#888', padding: '2px 9px', borderRadius: 10, letterSpacing: '0.3px' }}>{note.tag}</span>
                  </div>
                  {canEdit && (
                    <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexShrink: 0, marginLeft: 10 }}>
                      {confirming === note.id ? (
                        <>
                          <span style={{ fontSize: 11, color: colors.red, marginRight: 2 }}>Delete?</span>
                          <button onClick={() => { onDelete(note.id); setConfirming(null) }} style={{ background: colors.red + '22', border: `1px solid ${colors.red}66`, color: colors.red, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 11 }}>Yes</button>
                          <button onClick={() => setConfirming(null)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textMuted, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 11 }}>No</button>
                        </>
                      ) : (
                        <>
                          <button onClick={() => setEditing(note.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>Edit</button>
                          <button onClick={() => setConfirming(note.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textFaint, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>✕</button>
                        </>
                      )}
                    </div>
                  )}
                </div>
                <p style={{ margin: 0, fontSize: 13, color: colors.textMuted, lineHeight: 1.7, whiteSpace: 'pre-wrap' }}>{note.content}</p>
                {note.date && <div style={{ marginTop: 10, fontSize: 11, color: colors.textFaint }}>{note.date}</div>}
              </>
            )}
          </div>
        ))}
      </div>
    </div>
  )
}

function NoteForm({ initial, onSave, onCancel }) {
  const [form, setForm] = useState(initial || { title: '', content: '', tag: 'general', date: new Date().toISOString().slice(0, 10) })
  const [saving, setSaving] = useState(false)

  const handle = async () => {
    if (!form.title.trim()) return
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div style={{ background: '#13111f', border: `1px solid ${colors.gold}44`, borderRadius: 10, padding: 20, marginBottom: 14 }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: 10, marginBottom: 10 }}>
        <input placeholder="Title" value={form.title} onChange={e => setForm(f => ({ ...f, title: e.target.value }))}
          style={{ background: colors.surfaceDeep, border: `1px solid ${colors.border}`, borderRadius: 6, padding: '8px 12px', color: colors.text, fontFamily: fonts.body, fontSize: 13, width: '100%' }} />
        <select value={form.tag} onChange={e => setForm(f => ({ ...f, tag: e.target.value }))}
          style={{ background: colors.surfaceDeep, border: `1px solid ${colors.border}`, borderRadius: 6, padding: '8px 10px', color: colors.text, fontSize: 13 }}>
          {TAGS.map(t => <option key={t} value={t}>{t}</option>)}
        </select>
      </div>
      <textarea rows={4} placeholder="Content…" value={form.content} onChange={e => setForm(f => ({ ...f, content: e.target.value }))}
        style={{ width: '100%', marginBottom: 10, background: colors.surfaceDeep, border: `1px solid ${colors.border}`, borderRadius: 6, padding: '8px 12px', color: colors.text, fontFamily: fonts.body, fontSize: 13, resize: 'vertical' }} />
      <input type="date" value={form.date} onChange={e => setForm(f => ({ ...f, date: e.target.value }))}
        style={{ marginBottom: 14, background: colors.surfaceDeep, border: `1px solid ${colors.border}`, borderRadius: 6, padding: '7px 12px', color: colors.text, fontSize: 13 }} />
      <div style={{ display: 'flex', gap: 10 }}>
        <button onClick={handle} disabled={saving || !form.title.trim()} style={{ background: saving || !form.title.trim() ? colors.border : colors.gold, color: '#0d0b14', border: 'none', borderRadius: 6, padding: '7px 20px', cursor: saving || !form.title.trim() ? 'default' : 'pointer', fontFamily: fonts.display, fontWeight: 600 }}>
          {saving ? 'Saving…' : 'Save'}
        </button>
        <button onClick={onCancel} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 6, padding: '7px 16px', cursor: 'pointer' }}>Cancel</button>
      </div>
    </div>
  )
}
