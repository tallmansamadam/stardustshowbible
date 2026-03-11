import { useState } from 'react'
import { colors, fonts } from './styles'

const CHECKLIST = {
  preshow: {
    label: 'Pre-Show',
    color: '#9b8fd4',
    items: [
      'Mac Mini on, Karafun loaded, room code confirmed',
      'All 4 mics charged and receiver connections tested',
      'QR cards on every table and at the bar',
      'Check for and remove any unauthorized QR codes',
      'Screen inputs routed: odd → Karafun, even → carousel',
      'Carousel images loaded and cycling correctly at 1080×1920',
      'Seed songs loaded in Karafun queue (disco/funk first)',
      'Wedge monitors placed and levels set',
      'X32 loaded with KARAOKE BASE scene',
      'Gain staging tested through full signal chain',
      'Walked the room — checked for feedback spots',
      'Lighting set to minimal static washes (no movement yet)',
      'DJ: USB backup drives confirmed',
      'Host briefed: arc, disco/funk direction, no dead air policy',
    ],
  },
  arc: {
    label: 'Night Arc',
    color: '#d4a84a',
    items: [
      '8:00pm — Doors. Minimal static lighting. Seed queue running.',
      '9:30pm — Introduce light movement on moving bars.',
      '11:00pm — Full tilt: moving bars, star lights, full color.',
    ],
  },
  postshow: {
    label: 'Post-Show',
    color: '#5acb8a',
    items: [
      'Mics collected, stored properly',
      'Karafun queue cleared for next night',
      'Night log written in Notes (tag: log)',
      'DJ crowd read logged in Notes (tag: setlist)',
      'Any equipment issues documented in Sound & Tech',
    ],
  },
}

export default function NightOf({ onAdd, session }) {
  const today = new Date().toISOString().slice(0, 10)
  const storageKey = `nightof-${today}`
  const notesKey  = `nightof-notes-${today}`

  const [checked, setChecked] = useState(() => {
    try { return JSON.parse(localStorage.getItem(storageKey)) || {} }
    catch { return {} }
  })

  const [notes, setNotes] = useState(() => {
    try { return JSON.parse(localStorage.getItem(notesKey)) || { crowd: '', tech: '' } }
    catch { return { crowd: '', tech: '' } }
  })

  const [saving, setSaving] = useState({ crowd: false, tech: false })
  const [saved,  setSaved]  = useState({ crowd: false, tech: false })

  const toggle = (key) => {
    const next = { ...checked, [key]: !checked[key] }
    setChecked(next)
    localStorage.setItem(storageKey, JSON.stringify(next))
  }

  const updateNote = (field, value) => {
    const next = { ...notes, [field]: value }
    setNotes(next)
    localStorage.setItem(notesKey, JSON.stringify(next))
  }

  const saveNote = async (field) => {
    const value = notes[field]?.trim()
    if (!value || !onAdd) return
    setSaving(s => ({ ...s, [field]: true }))
    const isCrowd = field === 'crowd'
    await onAdd({
      title: `${isCrowd ? 'Crowd Read' : 'Tech Notes'} — ${today}`,
      content: value,
      tag: isCrowd ? 'log' : 'sound',
      date: today,
      pinned: false,
    })
    setSaving(s => ({ ...s, [field]: false }))
    setSaved(s => ({ ...s, [field]: true }))
    setTimeout(() => setSaved(s => ({ ...s, [field]: false })), 2500)
  }

  const reset = () => {
    setChecked({})
    localStorage.removeItem(storageKey)
  }

  const totalItems = Object.values(CHECKLIST).reduce((a, s) => a + s.items.length, 0)
  const doneItems = Object.values(checked).filter(Boolean).length
  const pct = Math.round((doneItems / totalItems) * 100)
  const allDone = doneItems === totalItems

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 20 }}>
        <div>
          <h2 style={{ margin: '0 0 5px', fontSize: 24, fontWeight: 300, color: colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
            Night Of
          </h2>
          <div style={{ fontSize: 11, color: colors.textFaint, fontFamily: fonts.mono }}>
            {new Date().toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' })}
            &nbsp;·&nbsp;{doneItems} / {totalItems}&nbsp;&nbsp;{pct}%
          </div>
        </div>
        <button onClick={reset} style={{ background: 'none', border: '1px solid rgba(255,255,255,0.1)', color: colors.textFaint, borderRadius: 8, padding: '6px 14px', fontSize: 10, fontFamily: fonts.mono, letterSpacing: '1px' }}>
          Reset
        </button>
      </div>

      {/* Progress bar */}
      <div style={{ height: 2, background: 'rgba(255,255,255,0.07)', borderRadius: 1, marginBottom: 28, overflow: 'hidden' }}>
        <div style={{ height: '100%', width: `${pct}%`, background: allDone ? colors.green : colors.gold, borderRadius: 1, transition: 'width 0.35s ease, background 0.35s ease' }} />
      </div>

      <div style={{ display: 'grid', gap: 14 }}>
        {Object.entries(CHECKLIST).map(([sectionKey, section]) => {
          const sectionDone = section.items.filter((_, i) => checked[`${sectionKey}-${i}`]).length
          const sectionComplete = sectionDone === section.items.length
          return (
            <div key={sectionKey} className="glass" style={{ borderRadius: 12, padding: '18px 20px' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
                <h3 style={{ margin: 0, fontSize: 10, color: sectionComplete ? colors.green : section.color, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase' }}>
                  {sectionComplete ? '✓ ' : ''}{section.label}
                </h3>
                <span style={{ fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono }}>
                  {sectionDone} / {section.items.length}
                </span>
              </div>
              <div style={{ display: 'grid', gap: 6 }}>
                {section.items.map((item, i) => {
                  const key = `${sectionKey}-${i}`
                  const done = !!checked[key]
                  return (
                    <div
                      key={i}
                      onClick={() => toggle(key)}
                      style={{
                        display: 'flex', gap: 12, alignItems: 'flex-start', cursor: 'pointer',
                        padding: '7px 8px', borderRadius: 8,
                        background: done ? 'rgba(90,203,138,0.07)' : 'transparent',
                        transition: 'background 0.2s',
                      }}
                    >
                      <div style={{
                        width: 16, height: 16, borderRadius: 4, flexShrink: 0, marginTop: 1,
                        border: `1.5px solid ${done ? colors.green : 'rgba(255,255,255,0.18)'}`,
                        background: done ? colors.green : 'transparent',
                        display: 'flex', alignItems: 'center', justifyContent: 'center',
                        transition: 'all 0.15s',
                      }}>
                        {done && <span style={{ fontSize: 9, color: '#09080f', lineHeight: 1, fontWeight: 700 }}>✓</span>}
                      </div>
                      <span style={{
                        fontSize: 13, color: done ? colors.textFaint : colors.textMuted,
                        textDecoration: done ? 'line-through' : 'none',
                        fontFamily: fonts.body, lineHeight: 1.55,
                        transition: 'color 0.2s',
                      }}>
                        {item}
                      </span>
                    </div>
                  )
                })}
              </div>
            </div>
          )
        })}
      </div>

      {allDone && (
        <div style={{ textAlign: 'center', padding: '36px 0 20px', color: colors.green, fontFamily: fonts.mono, fontSize: 11, letterSpacing: '2.5px', textTransform: 'uppercase', animation: 'fadein 0.4s ease' }}>
          ✦ &nbsp; All clear — have a great night &nbsp; ✦
        </div>
      )}

      {/* ── Night notes ── */}
      <div style={{ display: 'grid', gap: 14, marginTop: 8 }}>
        {[
          { field: 'crowd', label: 'Crowd Read', color: '#d4a84a', placeholder: 'Energy level, what worked, what cleared the floor, peak moment, repeat songs…', tag: 'log' },
          { field: 'tech',  label: 'Tech Notes', color: '#4ab8e0', placeholder: 'Equipment issues, sound problems, anything to flag for next time…',             tag: 'sound' },
        ].map(({ field, label, color, placeholder }) => (
          <div key={field} className="glass" style={{ borderRadius: 12, overflow: 'hidden' }}>
            <div style={{ height: 2, background: `linear-gradient(to right, ${color}66, transparent)` }} />
            <div style={{ padding: '16px 20px' }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 10 }}>
                <label style={{ fontSize: 10, color, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase' }}>
                  {label}
                </label>
                {notes[field]?.trim() && onAdd && (
                  <button
                    onClick={() => saveNote(field)}
                    disabled={saving[field]}
                    style={{
                      background: saved[field] ? 'rgba(90,203,138,0.1)' : `${color}14`,
                      border: `1px solid ${saved[field] ? 'rgba(90,203,138,0.3)' : color + '44'}`,
                      color: saved[field] ? colors.green : color,
                      borderRadius: 6, padding: '4px 12px',
                      fontSize: 10, fontFamily: fonts.mono, letterSpacing: '0.5px',
                    }}
                  >
                    {saved[field] ? '✓ Saved to Notes' : saving[field] ? 'Saving…' : '↑ Save to Notes'}
                  </button>
                )}
              </div>
              <textarea
                rows={4}
                placeholder={placeholder}
                value={notes[field]}
                onChange={e => updateNote(field, e.target.value)}
                style={{
                  width: '100%', background: 'rgba(0,0,0,0.35)',
                  border: '1px solid rgba(255,255,255,0.08)', borderRadius: 8,
                  padding: '10px 13px', color: colors.text,
                  fontSize: 13, fontFamily: fonts.body, lineHeight: 1.7,
                  resize: 'vertical',
                }}
              />
              <div style={{ marginTop: 6, fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1px' }}>
                Auto-saved locally · {field === 'crowd' ? 'Saves as log note' : 'Saves as sound note'}
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  )
}
