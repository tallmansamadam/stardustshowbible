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

  const handleCancel = () => { setDraft(value); setEditing(false) }

  useEffect(() => {
    if (!editing) return
    const handler = (e) => { if (e.key === 'Escape') handleCancel() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [editing, value])

  const renderInline = (text, key) => {
    const parts = text.split(/(\*\*[^*]+\*\*|\*[^*]+\*)/)
    return (
      <span key={key}>
        {parts.map((part, j) => {
          if (part.startsWith('**') && part.endsWith('**'))
            return <strong key={j} style={{ color: colors.text, fontWeight: 500 }}>{part.slice(2, -2)}</strong>
          if (part.startsWith('*') && part.endsWith('*'))
            return <em key={j} style={{ color: colors.textMuted, fontStyle: 'italic' }}>{part.slice(1, -1)}</em>
          return part
        })}
      </span>
    )
  }

  const lines = (value || '').split('\n')
  const rendered = lines.map((line, i) => {
    const isFirst = i === 0

    if (line.startsWith('## ')) return (
      <h2 key={i} style={{
        color: colors.gold, fontWeight: 300, fontSize: 22,
        marginTop: isFirst ? 0 : 36, marginBottom: 12,
        fontFamily: fonts.display, letterSpacing: '0.5px',
        paddingBottom: 8, borderBottom: '1px solid rgba(212,168,74,0.12)',
      }}>
        {line.slice(3)}
      </h2>
    )
    if (line.startsWith('### ')) return (
      <h3 key={i} style={{
        color: colors.purple, fontWeight: 400, fontSize: 11,
        marginTop: 20, marginBottom: 8,
        fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase',
      }}>
        {line.slice(4)}
      </h3>
    )
    if (line.startsWith('#### ')) return (
      <h4 key={i} style={{
        color: colors.textMuted, fontWeight: 500, fontSize: 13,
        marginTop: 14, marginBottom: 6, fontFamily: fonts.body,
      }}>
        {line.slice(5)}
      </h4>
    )
    if (line === '---') return (
      <div key={i} style={{ margin: '24px 0', display: 'flex', alignItems: 'center', gap: 12 }}>
        <div style={{ flex: 1, height: 1, background: 'linear-gradient(to right, rgba(212,168,74,0.18), transparent)' }} />
        <span style={{ color: 'rgba(212,168,74,0.25)', fontSize: 8 }}>✦</span>
        <div style={{ flex: 1, height: 1, background: 'linear-gradient(to left, rgba(212,168,74,0.18), transparent)' }} />
      </div>
    )
    if (line.startsWith('- [ ] ')) return (
      <div key={i} style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: 7, fontSize: 13, color: colors.textMuted, fontFamily: fonts.body }}>
        <span style={{ color: 'rgba(255,255,255,0.2)', marginTop: 2, flexShrink: 0, fontSize: 14 }}>☐</span>
        <span style={{ lineHeight: 1.7 }}>{renderInline(line.slice(6))}</span>
      </div>
    )
    if (line.startsWith('- [x] ')) return (
      <div key={i} style={{ display: 'flex', gap: 10, alignItems: 'flex-start', marginBottom: 7, fontSize: 13, color: colors.textFaint, fontFamily: fonts.body }}>
        <span style={{ color: colors.green, marginTop: 2, flexShrink: 0, fontSize: 14 }}>☑</span>
        <span style={{ textDecoration: 'line-through', lineHeight: 1.7 }}>{line.slice(6)}</span>
      </div>
    )
    if (line.startsWith('- ')) return (
      <div key={i} style={{ display: 'flex', alignItems: 'flex-start', gap: 8, paddingLeft: 4, marginBottom: 6, fontSize: 13, color: colors.textMuted, fontFamily: fonts.body, lineHeight: 1.7 }}>
        <span style={{ color: colors.gold, opacity: 0.5, flexShrink: 0, marginTop: 2, fontSize: 10 }}>◆</span>
        <span>{renderInline(line.slice(2))}</span>
      </div>
    )
    if (line === '') return <div key={i} style={{ height: 8 }} />

    return (
      <p key={i} style={{ margin: '0 0 6px', fontSize: 13, color: colors.textMuted, lineHeight: 1.85, fontFamily: fonts.body }}>
        {renderInline(line)}
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
              onClick={handleCancel}
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
          style={{ borderRadius: 12, padding: '28px 32px' }}
        >
          {rendered}
        </div>
      )}
    </div>
  )
}
