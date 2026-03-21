import { useState, useEffect, useRef } from 'react'
import { colors, fonts } from './styles'
import { supabase } from '../lib/supabase'

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
      '6:00pm — Doors. Happy hour begins. Minimal static lighting. Seed queue running.',
      '8:00pm — Happy hour ends. Introduce light movement on moving bars.',
      '10:00pm — Full tilt: moving bars, star lights, full color.',
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

// Format a checked-state object into a readable markdown log
const buildLogContent = (checkedState, dateLabel) => {
  const totalItems = Object.values(CHECKLIST).reduce((a, s) => a + s.items.length, 0)
  const totalDone  = Object.values(checkedState).filter(Boolean).length
  const lines = [`## Night Of — ${dateLabel}`, '']

  Object.entries(CHECKLIST).forEach(([sectionKey, section]) => {
    const sectionDone = section.items.filter((_, i) => checkedState[`${sectionKey}-${i}`]).length
    lines.push(`### ${section.label} — ${sectionDone}/${section.items.length}`)
    section.items.forEach((item, i) => {
      lines.push(checkedState[`${sectionKey}-${i}`] ? `- [x] ${item}` : `- [ ] ${item}`)
    })
    lines.push('')
  })

  lines.push('---')
  lines.push(`${totalDone} / ${totalItems} items completed`)
  return lines.join('\n')
}

export default function NightOf({ onAdd, session, role }) {
  // Roll over at 7am — before 7am counts as the previous night's show
  const _now = new Date()
  const showDateObj = new Date(_now)
  if (_now.getHours() < 7) showDateObj.setDate(showDateObj.getDate() - 1)
  const fmt = d => `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
  const showDate = fmt(showDateObj)

  // Previous show date — used for auto-logging when the night rolls over
  const prevDateObj = new Date(showDateObj)
  prevDateObj.setDate(prevDateObj.getDate() - 1)
  const prevShowDate = fmt(prevDateObj)

  const checklistKey = `checklist-${showDate}`
  const notesKey     = `nightof-notes-${showDate}`

  const canReset = role && role !== 'viewer'

  const [checked, setChecked] = useState({})
  const [confirmReset, setConfirmReset] = useState(false)
  const [loading, setLoading] = useState(true)
  const ignoreRef = useRef(false)

  const [notes, setNotes] = useState(() => {
    try { return JSON.parse(localStorage.getItem(notesKey)) || { crowd: '', tech: '' } }
    catch { return { crowd: '', tech: '' } }
  })

  const [saving, setSaving] = useState({ crowd: false, tech: false })
  const [saved,  setSaved]  = useState({ crowd: false, tech: false })
  const [saveErr, setSaveErr] = useState({ crowd: null, tech: null })

  // ── Load checklist state from Supabase ─────────────────────────────────────
  useEffect(() => {
    let sub

    const load = async () => {
      const { data } = await supabase
        .from('content')
        .select('value')
        .eq('key', checklistKey)
        .maybeSingle()
      try { setChecked(data?.value ? JSON.parse(data.value) : {}) }
      catch { setChecked({}) }
      setLoading(false)
    }

    load()

    sub = supabase
      .channel(`checklist-${showDate}`)
      .on('postgres_changes', {
        event: '*', schema: 'public', table: 'content',
        filter: `key=eq.${checklistKey}`,
      }, (payload) => {
        if (ignoreRef.current) return
        try { setChecked(payload.new?.value ? JSON.parse(payload.new.value) : {}) }
        catch { setChecked({}) }
      })
      .subscribe()

    return () => { supabase.removeChannel(sub) }
  }, [showDate])

  // ── Auto-log previous night's checklist at 7am rollover ────────────────────
  useEffect(() => {
    const autoLog = async () => {
      // Check if already logged (marker key prevents duplicate logs from multiple users)
      const { data: marker } = await supabase
        .from('content').select('value')
        .eq('key', `checklist-logged-${prevShowDate}`).maybeSingle()
      if (marker) return

      // Fetch the previous night's checklist
      const { data } = await supabase
        .from('content').select('value')
        .eq('key', `checklist-${prevShowDate}`).maybeSingle()
      if (!data?.value) return

      let prevChecked
      try { prevChecked = JSON.parse(data.value) } catch { return }
      if (Object.keys(prevChecked).length === 0) return

      // Set marker immediately to prevent race conditions with other clients
      await supabase.from('content').upsert(
        { key: `checklist-logged-${prevShowDate}`, value: new Date().toISOString(), updated_at: new Date().toISOString() },
        { onConflict: 'key' }
      )

      // Save log as a note
      if (onAdd) {
        const dateLabel = prevDateObj.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' })
        await onAdd({
          title: `Night Of Log — ${dateLabel}`,
          content: buildLogContent(prevChecked, dateLabel),
          tag: 'log',
          date: prevShowDate,
          pinned: false,
        })
      }
    }

    autoLog()
  }, [showDate])

  // ── Write checked state to Supabase ───────────────────────────────────────
  const persistChecked = async (next) => {
    ignoreRef.current = true
    await supabase.from('content').upsert(
      { key: checklistKey, value: JSON.stringify(next), updated_at: new Date().toISOString() },
      { onConflict: 'key' }
    )
    setTimeout(() => { ignoreRef.current = false }, 300)
  }

  const toggle = (key) => {
    const next = { ...checked, [key]: !checked[key] }
    setChecked(next)
    persistChecked(next)
  }

  // ── Manual reset — saves a log first, then clears ─────────────────────────
  const reset = async () => {
    // Save a log of the current state before wiping
    if (onAdd && Object.keys(checked).length > 0) {
      const dateLabel = showDateObj.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' })
      // Mark as logged so auto-log doesn't double-fire at 7am
      await supabase.from('content').upsert(
        { key: `checklist-logged-${showDate}`, value: new Date().toISOString(), updated_at: new Date().toISOString() },
        { onConflict: 'key' }
      )
      await onAdd({
        title: `Night Of Log — ${dateLabel} (manual reset)`,
        content: buildLogContent(checked, dateLabel),
        tag: 'log',
        date: showDate,
        pinned: false,
      })
    }

    setChecked({})
    ignoreRef.current = true
    await supabase.from('content').upsert(
      { key: checklistKey, value: '{}', updated_at: new Date().toISOString() },
      { onConflict: 'key' }
    )
    setTimeout(() => { ignoreRef.current = false }, 300)
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
    setSaveErr(s => ({ ...s, [field]: null }))
    const isCrowd = field === 'crowd'
    const result = await onAdd({
      title: `${isCrowd ? 'Crowd Read' : 'Tech Notes'} — ${showDate}`,
      content: value,
      tag: isCrowd ? 'log' : 'sound',
      date: showDate,
      pinned: false,
    })
    setSaving(s => ({ ...s, [field]: false }))
    if (result?.error) {
      setSaveErr(s => ({ ...s, [field]: result.error.message || 'Save failed' }))
    } else {
      setSaved(s => ({ ...s, [field]: true }))
      setTimeout(() => setSaved(s => ({ ...s, [field]: false })), 2500)
    }
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
            {showDateObj.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric' })}
            &nbsp;·&nbsp;{loading ? '…' : `${doneItems} / ${totalItems}  ${pct}%`}
          </div>
        </div>
        {canReset && (
          confirmReset ? (
            <div style={{ display: 'flex', alignItems: 'center', gap: 8 }}>
              <span style={{ fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono }}>Reset for everyone?</span>
              <button onClick={() => { reset(); setConfirmReset(false) }} style={{ background: 'rgba(224,96,96,0.1)', border: '1px solid rgba(224,96,96,0.3)', color: '#e06060', borderRadius: 6, padding: '5px 12px', fontSize: 10, fontFamily: fonts.mono }}>
                Yes, reset
              </button>
              <button onClick={() => setConfirmReset(false)} style={{ background: 'none', border: '1px solid rgba(255,255,255,0.1)', color: colors.textFaint, borderRadius: 6, padding: '5px 10px', fontSize: 10, fontFamily: fonts.mono }}>
                Cancel
              </button>
            </div>
          ) : (
            <button onClick={() => setConfirmReset(true)} title="Clear all checkboxes for everyone" style={{ background: 'none', border: '1px solid rgba(255,255,255,0.1)', color: colors.textFaint, borderRadius: 8, padding: '6px 14px', fontSize: 10, fontFamily: fonts.mono, letterSpacing: '1px' }}>
              ↺ Reset All
            </button>
          )
        )}
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
                <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
                  {saveErr[field] && (
                    <span style={{ fontSize: 10, color: colors.red, fontFamily: fonts.mono }}>{saveErr[field]}</span>
                  )}
                  {notes[field]?.trim() && onAdd && (
                    <button
                      onClick={() => saveNote(field)}
                      disabled={saving[field]}
                      style={{
                        background: saved[field] ? 'rgba(90,203,138,0.1)' : saveErr[field] ? 'rgba(224,96,96,0.1)' : `${color}14`,
                        border: `1px solid ${saved[field] ? 'rgba(90,203,138,0.3)' : saveErr[field] ? 'rgba(224,96,96,0.3)' : color + '44'}`,
                        color: saved[field] ? colors.green : saveErr[field] ? colors.red : color,
                        borderRadius: 6, padding: '4px 12px',
                        fontSize: 10, fontFamily: fonts.mono, letterSpacing: '0.5px',
                      }}
                    >
                      {saved[field] ? '✓ Saved to Notes' : saving[field] ? 'Saving…' : saveErr[field] ? '↺ Retry' : '↑ Save to Notes'}
                    </button>
                  )}
                </div>
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
