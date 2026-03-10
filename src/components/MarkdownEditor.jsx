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
    if (line.startsWith('## '))  return (
      <h2 key={i} style={{ color: colors.gold, fontWeight: 300, fontSize: 22, marginTop: 28, marginBottom: 10, fontFamily: fonts.display, letterSpacing: '0.5px' }}>
        {line.slice(3)}
      </h2>
    )
    if (line.startsWith('### ')) return (
      <h3 key={i} style={{ color: colors.purple, fontWeight: 400, fontSize: 14, marginTop: 18, marginBottom: 6, fontFamily: fonts.mono, letterSpacing: '1px', textTransform: 'uppercase' }}>
        {line.slice(4)}
      </h3>
    )
    if (line.startsWith('- [ ] ')) return (
      <div key={i} style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: 6, fontSize: 13, color: colors.textMuted, fontFamily: fonts.body }}>
        <span style={{ color: 'rgba(255,255,255,0.2)', marginTop: 1, flexShrink: 0, fontSize: 15 }}>☐</span>
        <span style={{ lineHeight: 1.7 }}>{line.slice(6)}</span>
      </div>
    )
    if (line.startsWith('- [x] ')) return (
      <div key={i} style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: 6, fontSize: 13, color: colors.textFaint, fontFamily: fonts.body }}>
        <span style={{ color: colors.green, marginTop: 1, flexShrink: 0, fontSize: 15 }}>☑</span>
        <span style={{ textDecoration: 'line-through', lineHeight: 1.7 }}>{line.slice(6)}</span>
      </div>
    )
    if (line.startsWith('- ')) return (
      <div key={i} style={{ paddingLeft: 18, marginBottom: 5, fontSize: 13, color: colors.textMuted, fontFamily: fonts.body, lineHeight: 1.7 }}>
        <span style={{ color: colors.gold, marginRight: 8, opacity: 0.6 }}>·</span>
        {line.slice(2)}
      </div>
    )
    if (line === '') return <div key={i} style={{ height: 10 }} />

    const parts = line.split(/(\*\*[^*]+\*\*)/)
    return (
      <p key={i} style={{ margin: '0 0 5px', fontSize: 13, color: colors.textMuted, lineHeight: 1.8, fontFamily: fonts.body }}>
        {parts.map((part, j) =>
          part.startsWith('**') && part.endsWith('**')
            ? <strong key={j} style={{ color: colors.text, fontWeight: 500 }}>{part.slice(2, -2)}</strong>
            : part
        )}
      </p>
    )
  })

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 22 }}>
        <h2 style={{ margin: 0, fontSize: 24, fontWeight: 300, color: colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
          {title}
        </h2>
        {canEdit && !editing && (
          <button
            onClick={() => setEditing(true)}
            style={{
              background: 'rgba(212,168,74,0.08)', border: '1px solid rgba(212,168,74,0.22)',
              color: colors.gold, borderRadius: 8, padding: '7px 16px',
              fontSize: 12, fontFamily: fonts.mono, letterSpacing: '1px',
            }}
          >
            ✏ Edit
          </button>
        )}
        {!canEdit && (
          <span style={{ fontSize: 9, color: colors.textFaint, letterSpacing: '2px', textTransform: 'uppercase', fontFamily: fonts.mono }}>
            View Only
          </span>
        )}
      </div>

      {editing ? (
        <div>
          <textarea
            rows={24}
            value={draft}
            onChange={e => setDraft(e.target.value)}
            style={{
              width: '100%', marginBottom: 14, lineHeight: 1.8,
              background: 'rgba(0,0,0,0.55)', border: '1px solid rgba(255,255,255,0.1)',
              borderRadius: 12, padding: '20px 22px', color: colors.text,
              fontFamily: fonts.mono, fontSize: 13, resize: 'vertical',
              boxShadow: 'inset 0 2px 12px rgba(0,0,0,0.4)',
            }}
          />
          <div style={{ display: 'flex', gap: 10 }}>
            <button
              onClick={handleSave}
              disabled={saving}
              style={{
                background: saving ? 'rgba(255,255,255,0.06)' : 'linear-gradient(105deg, #b8862e 0%, #d4a84a 45%, #e8c06a 100%)',
                color: saving ? 'rgba(255,255,255,0.2)' : '#09080f',
                border: 'none', borderRadius: 8, padding: '9px 22px',
                fontSize: 11, fontFamily: fonts.mono, letterSpacing: '1px',
                boxShadow: saving ? 'none' : '0 2px 16px rgba(212,168,74,0.18)',
              }}
            >
              {saving ? 'Saving…' : 'Save'}
            </button>
            <button
              onClick={() => { setDraft(value); setEditing(false) }}
              style={{
                background: 'none', border: '1px solid rgba(255,255,255,0.1)',
                color: 'rgba(155,143,212,0.8)', borderRadius: 8,
                padding: '9px 18px', fontSize: 11, fontFamily: fonts.mono, letterSpacing: '0.5px',
              }}
            >
              Cancel
            </button>
          </div>
        </div>
      ) : (
        <div
          className="glass card"
          style={{ borderRadius: 12, padding: '24px 28px' }}
        >
          {rendered}
        </div>
      )}
    </div>
  )
}
