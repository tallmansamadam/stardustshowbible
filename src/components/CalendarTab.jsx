import { useState } from 'react'
import { colors, fonts } from './styles'

export const EVENT_TYPES = [
  { value: 'booking',       label: 'Booking',       color: '#d4a84a' },
  { value: 'private-event', label: 'Private Event', color: '#9b8fd4' },
  { value: 'dj-set',        label: 'DJ Set',        color: '#4ab8e0' },
  { value: 'photo-shoot',   label: 'Photo Shoot',   color: '#5acb8a' },
  { value: 'maintenance',   label: 'Maintenance',   color: '#e06060' },
  { value: 'other',         label: 'Other',         color: 'rgba(240,232,208,0.45)' },
]

const typeColor = (type) => EVENT_TYPES.find(t => t.value === type)?.color || 'rgba(240,232,208,0.45)'

// Returns day cells for a month grid starting on Monday
function getMonthGrid(year, month) {
  const firstDay = new Date(year, month, 1)
  const daysInMonth = new Date(year, month + 1, 0).getDate()
  const startDow = (firstDay.getDay() + 6) % 7  // Mon=0 … Sun=6
  const cells = []
  for (let i = 0; i < startDow; i++) cells.push(null)
  for (let d = 1; d <= daysInMonth; d++) cells.push(d)
  while (cells.length % 7 !== 0) cells.push(null)
  return cells
}

function dateFmt(year, month, day) {
  return `${year}-${String(month + 1).padStart(2, '0')}-${String(day).padStart(2, '0')}`
}

function eventsOnDate(events, dateStr) {
  return (events || []).filter(e => {
    if (!e.start_date) return false
    const end = e.end_date || e.start_date
    return dateStr >= e.start_date && dateStr <= end
  })
}

const inputSt = {
  width: '100%', background: 'rgba(0,0,0,0.35)',
  border: '1px solid rgba(255,255,255,0.08)', borderRadius: 8,
  padding: '8px 12px', color: '#f0e8d0',
  fontSize: 13, fontFamily: 'DM Sans, sans-serif', lineHeight: 1.5,
}

// ── Event card (read view) ────────────────────────────────────────────────────
function EventCard({ event, canEdit, onEdit }) {
  const col = typeColor(event.type)
  const typeLabel = EVENT_TYPES.find(t => t.value === event.type)?.label || event.type
  const multiDay = event.end_date && event.end_date !== event.start_date

  return (
    <div className="glass" style={{ borderRadius: 10, padding: '12px 16px', display: 'flex', gap: 12, alignItems: 'flex-start' }}>
      <div style={{ width: 3, borderRadius: 2, alignSelf: 'stretch', flexShrink: 0, background: col }} />
      <div style={{ flex: 1, minWidth: 0 }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', gap: 8 }}>
          <div>
            <div style={{ fontSize: 13, color: '#f0e8d0', fontFamily: 'DM Sans, sans-serif', marginBottom: 3 }}>{event.title}</div>
            <div style={{ fontSize: 9, color: col, fontFamily: 'DM Mono, monospace', letterSpacing: '1.5px', textTransform: 'uppercase' }}>
              {typeLabel}{multiDay ? ` · through ${event.end_date}` : ''}
            </div>
          </div>
          {canEdit && (
            <button onClick={onEdit} style={{ background: 'none', border: 'none', color: 'rgba(240,232,208,0.3)', fontSize: 11, fontFamily: 'DM Mono, monospace', cursor: 'pointer', flexShrink: 0 }}>
              Edit
            </button>
          )}
        </div>
        {event.notes && (
          <div style={{ marginTop: 7, fontSize: 12, color: 'rgba(240,232,208,0.5)', fontFamily: 'DM Sans, sans-serif', lineHeight: 1.65 }}>
            {event.notes}
          </div>
        )}
      </div>
    </div>
  )
}

// ── Event form (add / edit) ───────────────────────────────────────────────────
function EventForm({ initial, onSave, onCancel, onDelete }) {
  const [form, setForm] = useState({
    title: '', type: 'booking', start_date: '', end_date: '', notes: '',
    ...initial,
  })
  const [saving, setSaving] = useState(false)
  const set = (k, v) => setForm(f => ({ ...f, [k]: v }))

  const save = async () => {
    if (!form.title.trim() || !form.start_date) return
    setSaving(true)
    await onSave({ ...form, end_date: form.end_date || form.start_date })
    setSaving(false)
  }

  return (
    <div className="glass" style={{ borderRadius: 12, padding: '16px 20px' }}>
      <div style={{ display: 'grid', gap: 10 }}>
        <input
          autoFocus
          placeholder="Event title"
          value={form.title}
          onChange={e => set('title', e.target.value)}
          onKeyDown={e => e.key === 'Escape' && onCancel()}
          style={inputSt}
        />
        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 8 }}>
          <select value={form.type} onChange={e => set('type', e.target.value)} style={inputSt}>
            {EVENT_TYPES.map(t => <option key={t.value} value={t.value}>{t.label}</option>)}
          </select>
          <input type="date" value={form.start_date} onChange={e => set('start_date', e.target.value)} style={inputSt} />
          <input type="date" value={form.end_date}   onChange={e => set('end_date',   e.target.value)} style={inputSt} />
        </div>
        <textarea
          placeholder="Notes (optional)"
          value={form.notes}
          onChange={e => set('notes', e.target.value)}
          rows={2}
          style={{ ...inputSt, resize: 'vertical' }}
        />
        <div style={{ display: 'flex', gap: 8, justifyContent: 'space-between', alignItems: 'center' }}>
          <div style={{ display: 'flex', gap: 8 }}>
            <button
              onClick={save}
              disabled={saving || !form.title.trim()}
              style={{ background: 'rgba(212,168,74,0.1)', border: '1px solid rgba(212,168,74,0.3)', color: '#d4a84a', borderRadius: 7, padding: '7px 18px', fontSize: 11, fontFamily: 'DM Mono, monospace' }}
            >
              {saving ? 'Saving…' : 'Save'}
            </button>
            <button
              onClick={onCancel}
              style={{ background: 'none', border: '1px solid rgba(255,255,255,0.1)', color: 'rgba(240,232,208,0.4)', borderRadius: 7, padding: '7px 14px', fontSize: 11, fontFamily: 'DM Mono, monospace' }}
            >
              Cancel
            </button>
          </div>
          {onDelete && (
            <button
              onClick={onDelete}
              style={{ background: 'none', border: 'none', color: 'rgba(224,96,96,0.45)', fontSize: 11, fontFamily: 'DM Mono, monospace', cursor: 'pointer' }}
            >
              Delete event
            </button>
          )}
        </div>
      </div>
    </div>
  )
}

// ── Main CalendarTab ──────────────────────────────────────────────────────────
export default function CalendarTab({ events, canEdit, onAdd, onUpdate, onDelete }) {
  const today = new Date().toISOString().slice(0, 10)
  const [year,  setYear]  = useState(new Date().getFullYear())
  const [month, setMonth] = useState(new Date().getMonth())
  const [selectedDate, setSelectedDate] = useState(today)
  const [creating, setCreating] = useState(false)
  const [editing,  setEditing]  = useState(null)

  const prevMonth = () => month === 0  ? (setMonth(11), setYear(y => y - 1)) : setMonth(m => m - 1)
  const nextMonth = () => month === 11 ? (setMonth(0),  setYear(y => y + 1)) : setMonth(m => m + 1)

  const grid      = getMonthGrid(year, month)
  const monthName = new Date(year, month, 1).toLocaleDateString('en-US', { month: 'long', year: 'numeric' })
  const selectedEvents = eventsOnDate(events, selectedDate)
  const DOW = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

  const navBtnSt = {
    background: 'rgba(255,255,255,0.04)', border: '1px solid rgba(255,255,255,0.09)',
    color: 'rgba(240,232,208,0.4)', borderRadius: 6, padding: '5px 11px',
    fontSize: 13, fontFamily: 'DM Mono, monospace', cursor: 'pointer',
  }

  return (
    <div>
      {/* ── Header ── */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 24 }}>
        <h2 style={{ margin: 0, fontSize: 24, fontWeight: 300, color: colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
          Calendar
        </h2>
        <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
          <button onClick={prevMonth} style={navBtnSt}>‹</button>
          <span style={{ fontSize: 12, color: colors.textMuted, fontFamily: fonts.mono, minWidth: 148, textAlign: 'center' }}>
            {monthName}
          </span>
          <button onClick={nextMonth} style={navBtnSt}>›</button>
        </div>
      </div>

      {/* ── Day-of-week headers ── */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 3, marginBottom: 3 }}>
        {DOW.map(d => (
          <div key={d} style={{ textAlign: 'center', padding: '5px 0', fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1.5px', textTransform: 'uppercase' }}>
            {d}
          </div>
        ))}
      </div>

      {/* ── Calendar grid ── */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 3 }}>
        {grid.map((day, i) => {
          if (!day) return <div key={i} style={{ minHeight: 70 }} />
          const dateStr   = dateFmt(year, month, day)
          const dayEvents = eventsOnDate(events, dateStr)
          const isToday    = dateStr === today
          const isSelected = dateStr === selectedDate
          const dow        = new Date(year, month, day).getDay() // 0=Sun
          const isFriSat   = dow === 5 || dow === 6

          return (
            <div
              key={i}
              onClick={() => { setSelectedDate(dateStr); setCreating(false); setEditing(null) }}
              style={{
                minHeight: 70, padding: '6px 7px', borderRadius: 8, cursor: 'pointer',
                border: `1px solid ${isSelected ? 'rgba(212,168,74,0.45)' : isToday ? 'rgba(212,168,74,0.22)' : 'rgba(255,255,255,0.05)'}`,
                background: isSelected ? 'rgba(212,168,74,0.07)' : isFriSat ? 'rgba(155,143,212,0.04)' : 'rgba(255,255,255,0.015)',
                transition: 'border-color 0.12s, background 0.12s',
              }}
            >
              <div style={{ fontSize: 11, fontFamily: fonts.mono, marginBottom: 4, color: isToday ? colors.gold : isSelected ? colors.gold : colors.textMuted, fontWeight: isToday ? 600 : 400 }}>
                {day}
              </div>
              <div style={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
                {dayEvents.slice(0, 3).map(e => (
                  <div key={e.id} style={{
                    fontSize: 9, padding: '2px 5px', borderRadius: 3, lineHeight: 1.4,
                    background: typeColor(e.type) + '1a',
                    border: `1px solid ${typeColor(e.type)}44`,
                    color: typeColor(e.type),
                    whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis',
                  }}>
                    {e.title}
                  </div>
                ))}
                {dayEvents.length > 3 && (
                  <div style={{ fontSize: 8, color: colors.textFaint, fontFamily: fonts.mono }}>
                    +{dayEvents.length - 3}
                  </div>
                )}
              </div>
            </div>
          )
        })}
      </div>

      {/* ── Selected date panel ── */}
      {selectedDate && (
        <div style={{ marginTop: 28 }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 12 }}>
            <div style={{ fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase' }}>
              {new Date(selectedDate + 'T12:00:00').toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' })}
            </div>
            {canEdit && !creating && !editing && (
              <button
                onClick={() => setCreating(true)}
                style={{ background: 'rgba(212,168,74,0.08)', border: '1px solid rgba(212,168,74,0.22)', color: colors.gold, borderRadius: 8, padding: '6px 14px', fontSize: 10, fontFamily: fonts.mono, letterSpacing: '1px' }}
              >
                + Add Event
              </button>
            )}
          </div>

          {selectedEvents.length === 0 && !creating && (
            <div style={{ fontSize: 12, color: colors.textFaint, fontFamily: fonts.mono, paddingBottom: 8 }}>
              No events.
            </div>
          )}

          <div style={{ display: 'grid', gap: 8 }}>
            {selectedEvents.map(e =>
              editing?.id === e.id ? (
                <EventForm
                  key={e.id}
                  initial={e}
                  onSave={async data => { await onUpdate({ ...e, ...data }); setEditing(null) }}
                  onCancel={() => setEditing(null)}
                  onDelete={async () => { await onDelete(e.id); setEditing(null) }}
                />
              ) : (
                <EventCard
                  key={e.id}
                  event={e}
                  canEdit={canEdit}
                  onEdit={() => { setEditing(e); setCreating(false) }}
                />
              )
            )}
          </div>

          {creating && (
            <EventForm
              initial={{ start_date: selectedDate, end_date: selectedDate, type: 'booking' }}
              onSave={async data => { await onAdd(data); setCreating(false) }}
              onCancel={() => setCreating(false)}
            />
          )}
        </div>
      )}
    </div>
  )
}
