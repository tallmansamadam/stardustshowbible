import { useState, useEffect } from 'react'
import { colors, fonts } from './styles'

export default function MarkdownEditor({ title, value, canEdit, onSave, saving }) {
  const [editing, setEditing] = useState(false)
  const [draft, setDraft] = useState(value || '')

  useEffect(() => { setDraft(value || '') }, [value])

  const handleSave = async () => {
    await onSave(draft)
    setEditing(false)
  }

  const rendered = (value || '').split('\n').map((line, i) => {
    if (line.startsWith('## '))  return <h2 key={i} style={{ color: colors.gold, fontWeight: 'normal', fontSize: 18, marginTop: 24, marginBottom: 8, fontFamily: fonts.display }}>{line.slice(3)}</h2>
    if (line.startsWith('### ')) return <h3 key={i} style={{ color: colors.purple, fontWeight: 'normal', fontSize: 15, marginTop: 16, marginBottom: 4 }}>{line.slice(4)}</h3>
    if (line.startsWith('- [ ] ')) return (
      <div key={i} style={{ display: 'flex', gap: 8, alignItems: 'flex-start', marginBottom: 5, fontSize: 13, color: colors.textMuted }}>
        <span style={{ color: colors.textFaint, marginTop: 1, flexShrink: 0 }}>☐</span>
        <span>{line.slice(6)}</span>
      </div>
    )
    if (line.startsWith('- [x] ')) return (
      <div key={i} style={{ display: 'flex', gap: 8, alignItems: 'flex-start', marginBottom: 5, fontSize: 13, color: colors.textFaint, textDecoration: 'line-through' }}>
        <span style={{ color: colors.green, marginTop: 1, flexShrink: 0 }}>☑</span>
        <span>{line.slice(6)}</span>
      </div>
    )
    if (line.startsWith('- ')) return <div key={i} style={{ paddingLeft: 16, marginBottom: 4, fontSize: 13, color: colors.textMuted }}>· {line.slice(2)}</div>
    if (line === '') return <div key={i} style={{ height: 8 }} />

    // Inline bold
    const parts = line.split(/(\*\*[^*]+\*\*)/)
    return (
      <p key={i} style={{ margin: '0 0 4px', fontSize: 13, color: colors.textMuted, lineHeight: 1.7 }}>
        {parts.map((part, j) =>
          part.startsWith('**') && part.endsWith('**')
            ? <strong key={j} style={{ color: colors.text }}>{part.slice(2, -2)}</strong>
            : part
        )}
      </p>
    )
  })

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 18 }}>
        <h2 style={{ margin: 0, fontSize: 18, color: colors.gold, fontWeight: 'normal', fontFamily: fonts.display }}>{title}</h2>
        {canEdit && !editing && (
          <button onClick={() => setEditing(true)} style={{ background: colors.gold + '22', border: `1px solid ${colors.gold}66`, color: colors.gold, borderRadius: 6, padding: '6px 14px', cursor: 'pointer', fontSize: 13, fontFamily: fonts.body }}>
            ✏ Edit
          </button>
        )}
        {!canEdit && (
          <span style={{ fontSize: 11, color: colors.textFaint, letterSpacing: 1 }}>VIEW ONLY</span>
        )}
      </div>

      {editing ? (
        <div>
          <textarea
            rows={22}
            value={draft}
            onChange={e => setDraft(e.target.value)}
            style={{ width: '100%', boxSizing: 'border-box', marginBottom: 12, lineHeight: 1.7, background: colors.surfaceDeep, border: `1px solid ${colors.border}`, borderRadius: 8, padding: '14px 16px', color: colors.text, fontFamily: fonts.mono, fontSize: 13, outline: 'none', resize: 'vertical' }}
          />
          <div style={{ display: 'flex', gap: 10 }}>
            <button onClick={handleSave} disabled={saving} style={{ background: colors.gold, color: '#0d0b14', border: 'none', borderRadius: 6, padding: '8px 20px', cursor: 'pointer', fontFamily: fonts.display, fontWeight: 600, fontSize: 14 }}>
              {saving ? 'Saving…' : 'Save'}
            </button>
            <button onClick={() => { setDraft(value); setEditing(false) }} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 6, padding: '8px 16px', cursor: 'pointer', fontFamily: fonts.body }}>
              Cancel
            </button>
          </div>
        </div>
      ) : (
        <div className="card" style={{ background: colors.surface, border: `1px solid ${colors.border}`, borderRadius: 10, padding: '20px 24px' }}>
          {rendered}
        </div>
      )}
    </div>
  )
}
