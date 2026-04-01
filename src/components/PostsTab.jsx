import { useState, useEffect, useRef } from 'react'
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
    postTypes: ['Post', 'Story', 'Reel', 'Event'],
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

function formatTime(t) {
  if (!t) return ''
  const [h, m] = t.split(':').map(Number)
  const ampm = h >= 12 ? 'PM' : 'AM'
  const h12 = h % 12 || 12
  return `${h12}:${String(m).padStart(2, '0')} ${ampm}`
}

function suggestedTime(platform) {
  if (platform === 'TikTok')    return '10:00'
  if (platform === 'Facebook')  return '13:00'
  if (platform === 'Twitter/X') return '08:00'
  return '11:00' // Instagram default
}

function getWeekDays(weekOffset) {
  const today = new Date()
  const dow = today.getDay()
  const monday = new Date(today)
  monday.setDate(today.getDate() - (dow === 0 ? 6 : dow - 1) + weekOffset * 7)
  return Array.from({ length: 7 }, (_, i) => {
    const d = new Date(monday)
    d.setDate(monday.getDate() + i)
    return d
  })
}

// ── Main ──────────────────────────────────────────────────────────────────────
export default function PostsTab({ posts, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing]           = useState(null)
  const [creating, setCreating]         = useState(false)
  const [filterPlatform, setFilterPlatform] = useState('all')
  const [filterStatus, setFilterStatus] = useState('all')
  const [confirming, setConfirming]     = useState(null)
  const [weekOffset, setWeekOffset]     = useState(0)
  const [focusDate, setFocusDate]       = useState(null)
  const [draggingId, setDraggingId]     = useState(null)
  const [dragOverDate, setDragOverDate] = useState(null)
  const dateRefs = useRef({})

  const handleDragStart = (e, postId) => {
    setDraggingId(postId)
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData('text/plain', postId)
  }
  const handleDragEnd = () => { setDraggingId(null); setDragOverDate(null) }
  const handleDragOver = (e, dateKey) => { e.preventDefault(); e.dataTransfer.dropEffect = 'move'; setDragOverDate(dateKey) }
  const handleDragLeave = (e) => { if (!e.currentTarget.contains(e.relatedTarget)) setDragOverDate(null) }
  const handleDrop = (e, dateKey) => {
    e.preventDefault()
    const postId = e.dataTransfer.getData('text/plain')
    const post = (posts || []).find(p => p.id === postId)
    const newDate = dateKey === '__none' ? '' : dateKey
    if (post && post.date !== newDate) onUpdate({ ...post, date: newDate })
    setDraggingId(null)
    setDragOverDate(null)
  }

  const today = new Date().toISOString().slice(0, 10)

  // Stale posts — past date, still draft or idea
  const stalePosts = (posts || []).filter(p =>
    p.date && p.date < today && (p.status === 'draft' || p.status === 'idea')
  )
  const timeToMins = t => { if (!t) return -1; const [h, m] = t.split(':').map(Number); return h * 60 + (m || 0) }
  const recycleStale = async () => {
    const allPosts = posts || []
    for (const post of stalePosts) {
      const dayOfWeek = new Date(post.date + 'T12:00:00').getDay()
      let next = new Date(today + 'T12:00:00')
      next.setDate(next.getDate() + 1)
      while (next.getDay() !== dayOfWeek) next.setDate(next.getDate() + 1)
      for (let i = 0; i < 52; i++) {
        const ds = next.toISOString().slice(0, 10)
        const conflicts = allPosts.filter(p2 =>
          p2.id !== post.id && p2.date === ds && p2.platform === post.platform &&
          (!post.post_time || !p2.post_time || Math.abs(timeToMins(post.post_time) - timeToMins(p2.post_time)) < 60)
        )
        if (conflicts.length < 2) break
        next.setDate(next.getDate() + 7)
      }
      await onUpdate({ ...post, date: next.toISOString().slice(0, 10) })
    }
  }

  const weekDays = getWeekDays(weekOffset)
  const weekDayStrs = weekDays.map(d => d.toISOString().slice(0, 10))

  const filtered = (posts || []).filter(p =>
    (filterPlatform === 'all' || p.platform === filterPlatform) &&
    (filterStatus   === 'all' || p.status   === filterStatus)
  )

  // Group by date
  const byDate = {}
  filtered.forEach(p => {
    const key = p.date || '__none'
    if (!byDate[key]) byDate[key] = []
    byDate[key].push(p)
  })

  // Always show all 7 days of the current week; then any other dated posts outside the week
  const weekDaySet = new Set(weekDayStrs)
  const outsideDates = Object.keys(byDate)
    .filter(k => k !== '__none' && !weekDaySet.has(k))
    .sort()

  const handleDayClick = (dateStr) => {
    setFocusDate(dateStr)
    setTimeout(() => {
      dateRefs.current[dateStr]?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    }, 50)
  }

  const weekLabel = weekOffset === 0 ? 'This Week'
    : weekOffset === 1 ? 'Next Week'
    : weekOffset === -1 ? 'Last Week'
    : `${weekDays[0].toLocaleDateString('en-US', { month: 'short', day: 'numeric' })} – ${weekDays[6].toLocaleDateString('en-US', { month: 'short', day: 'numeric' })}`

  return (
    <div>
      {/* Header */}
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 20 }}>
        <h2 style={{ margin: 0, fontSize: 24, fontWeight: 300, color: colors.gold, fontFamily: fonts.display, letterSpacing: 1 }}>
          Social Posts
        </h2>
        <div style={{ display: 'flex', gap: 8, alignItems: 'center' }}>
          {canEdit && stalePosts.length > 0 && (
            <button
              onClick={recycleStale}
              title="Reschedule stale draft/idea posts to the next available same-weekday"
              style={{
                background: 'rgba(224,168,74,0.06)', border: '1px solid rgba(224,168,74,0.18)',
                color: '#e0a84a', borderRadius: 8, padding: '7px 14px',
                fontSize: 11, fontFamily: fonts.mono, letterSpacing: '0.5px',
              }}
            >
              ↺ {stalePosts.length} stale
            </button>
          )}
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
      </div>

      {/* ── Stats bar ── */}
      {(() => {
        const counts = { idea: 0, draft: 0, scheduled: 0, posted: 0 }
        ;(posts || []).forEach(p => { if (counts[p.status] !== undefined) counts[p.status]++ })
        const statColors = { idea: 'rgba(240,232,208,0.3)', draft: '#d4a84a', scheduled: '#4ab8e0', posted: '#5acb8a' }
        return (
          <div style={{ display: 'flex', gap: 6, marginBottom: 20, flexWrap: 'wrap' }}>
            {Object.entries(counts).map(([status, count]) => (
              <div key={status} style={{
                display: 'flex', alignItems: 'center', gap: 6,
                background: 'rgba(255,255,255,0.03)', border: '1px solid rgba(255,255,255,0.07)',
                borderRadius: 7, padding: '5px 11px',
              }}>
                <span style={{ fontSize: 14, fontWeight: 500, color: statColors[status], fontFamily: fonts.mono }}>{count}</span>
                <span style={{ fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1.5px', textTransform: 'uppercase' }}>{status}</span>
              </div>
            ))}
            <div style={{
              display: 'flex', alignItems: 'center', gap: 6,
              background: 'rgba(255,255,255,0.03)', border: '1px solid rgba(255,255,255,0.07)',
              borderRadius: 7, padding: '5px 11px', marginLeft: 'auto',
            }}>
              <span style={{ fontSize: 14, fontWeight: 500, color: colors.textMuted, fontFamily: fonts.mono }}>{(posts || []).length}</span>
              <span style={{ fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1.5px', textTransform: 'uppercase' }}>total</span>
            </div>
          </div>
        )
      })()}

      {/* ── Week strip ── */}
      <div style={{ marginBottom: 20 }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 8 }}>
          <div style={{ fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase' }}>{weekLabel}</div>
          <div style={{ display: 'flex', gap: 4 }}>
            <button onClick={() => { setWeekOffset(w => w - 1); setFocusDate(null) }} style={navBtn}>‹</button>
            {weekOffset !== 0 && <button onClick={() => { setWeekOffset(0); setFocusDate(null) }} style={{ ...navBtn, fontSize: 9, letterSpacing: '0.5px' }}>today</button>}
            <button onClick={() => { setWeekOffset(w => w + 1); setFocusDate(null) }} style={navBtn}>›</button>
          </div>
        </div>
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(7, 1fr)', gap: 5 }}>
          {weekDays.map(day => {
            const dateStr = day.toISOString().slice(0, 10)
            const dayPosts = filtered.filter(p => p.date === dateStr)
            const isToday = dateStr === today
            const isFocused = focusDate === dateStr
            return (
              <button
                key={dateStr}
                onClick={() => handleDayClick(dateStr)}
                style={{
                  background: isFocused ? 'rgba(212,168,74,0.12)' : 'rgba(255,255,255,0.02)',
                  border: isToday ? `1px solid rgba(212,168,74,0.35)` : isFocused ? `1px solid rgba(212,168,74,0.25)` : `1px solid rgba(255,255,255,0.06)`,
                  borderRadius: 8, padding: '8px 4px', textAlign: 'center', cursor: 'pointer',
                }}
              >
                <div style={{ fontSize: 8, color: isToday ? colors.gold : colors.textFaint, fontFamily: fonts.mono, letterSpacing: '1px', textTransform: 'uppercase', marginBottom: 3 }}>
                  {day.toLocaleDateString('en-US', { weekday: 'short' })}
                </div>
                <div style={{ fontSize: 15, color: isToday || isFocused ? colors.gold : colors.textMuted, fontFamily: fonts.mono, fontWeight: isToday ? '600' : '400' }}>
                  {day.getDate()}
                </div>
                {dayPosts.length > 0 && (
                  <div style={{ display: 'flex', justifyContent: 'center', gap: 2, marginTop: 4, flexWrap: 'wrap' }}>
                    {dayPosts.slice(0, 4).map((p, i) => (
                      <div key={i} style={{ width: 5, height: 5, borderRadius: '50%', background: PLATFORMS[p.platform]?.color || colors.gold }} />
                    ))}
                  </div>
                )}
              </button>
            )
          })}
        </div>
      </div>

      {/* Filter row */}
      <div style={{ display: 'flex', gap: 16, marginBottom: 22, flexWrap: 'wrap', alignItems: 'center' }}>
        <div style={{ display: 'flex', gap: 5, flexWrap: 'wrap' }}>
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
        <div style={{ display: 'flex', gap: 5, flexWrap: 'wrap' }}>
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

      {/* ── Grouped date view ── */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: 20 }}>

        {/* Always show all 7 days of the current week */}
        {weekDayStrs.map(dateStr => {
          const isFocused = focusDate === dateStr
          const isToday = dateStr === today
          const isPast = dateStr < today
          const isDragTarget = dragOverDate === dateStr
          const dateObj = new Date(dateStr + 'T12:00:00')
          const label = isToday ? 'Today' : dateObj.toLocaleDateString('en-US', { weekday: 'long', month: 'short', day: 'numeric' })
          const dayPosts = byDate[dateStr] || []

          return (
            <div
              key={dateStr}
              ref={el => dateRefs.current[dateStr] = el}
              onDragOver={e => handleDragOver(e, dateStr)}
              onDragLeave={handleDragLeave}
              onDrop={e => handleDrop(e, dateStr)}
              style={{
                borderRadius: 10, padding: isDragTarget ? '6px 10px' : '0',
                border: isDragTarget ? `1px dashed rgba(212,168,74,0.5)` : '1px solid transparent',
                background: isDragTarget ? 'rgba(212,168,74,0.04)' : 'transparent',
                transition: 'all 0.12s ease',
              }}
            >
              {/* Date header */}
              <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: dayPosts.length || isDragTarget ? 8 : 0 }}>
                <div style={{
                  fontSize: 11, fontFamily: fonts.mono, letterSpacing: '1px', whiteSpace: 'nowrap',
                  color: isToday ? colors.gold : isDragTarget ? colors.gold : isFocused ? colors.gold : isPast ? 'rgba(255,255,255,0.18)' : colors.textMuted,
                  fontWeight: isToday ? '600' : '400',
                  paddingBottom: 2,
                  borderBottom: isToday ? `1px solid ${colors.gold}44` : '1px solid transparent',
                }}>
                  {label}
                </div>
                <div style={{ flex: 1, height: 1, background: isDragTarget ? 'rgba(212,168,74,0.25)' : isFocused ? 'rgba(212,168,74,0.15)' : isPast ? 'rgba(255,255,255,0.03)' : 'rgba(255,255,255,0.06)' }} />
                {dayPosts.length > 0 && (
                  <div style={{ display: 'flex', gap: 3 }}>
                    {dayPosts.map((p, i) => (
                      <div key={i} style={{ width: 6, height: 6, borderRadius: '50%', background: PLATFORMS[p.platform]?.color || colors.gold, opacity: 0.7 }} />
                    ))}
                  </div>
                )}
                {dayPosts.length === 0 && !isDragTarget && (
                  <span style={{ fontSize: 9, color: 'rgba(255,255,255,0.1)', fontFamily: fonts.mono, letterSpacing: '1px' }}>—</span>
                )}
                {isDragTarget && dayPosts.length === 0 && (
                  <span style={{ fontSize: 9, color: 'rgba(212,168,74,0.4)', fontFamily: fonts.mono, letterSpacing: '1px' }}>drop here</span>
                )}
              </div>

              {/* Posts for this day */}
              <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                {dayPosts.map(post => (
                  <PostCard
                    key={post.id}
                    post={post}
                    canEdit={canEdit}
                    editing={editing === post.id}
                    confirming={confirming === post.id}
                    isDragging={draggingId === post.id}
                    onEdit={() => setEditing(post.id)}
                    onCancelEdit={() => setEditing(null)}
                    onSave={async p => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                    onConfirmDelete={() => setConfirming(post.id)}
                    onCancelDelete={() => setConfirming(null)}
                    onDelete={() => { onDelete(post.id); setConfirming(null) }}
                    onDragStart={e => handleDragStart(e, post.id)}
                    onDragEnd={handleDragEnd}
                  />
                ))}
              </div>
            </div>
          )
        })}

        {/* Posts outside the current week, sorted chronologically */}
        {outsideDates.length > 0 && (
          <>
            <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginTop: 8 }}>
              <div style={{ fontSize: 9, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase', whiteSpace: 'nowrap' }}>Other Dates</div>
              <div style={{ flex: 1, height: 1, background: 'rgba(255,255,255,0.05)' }} />
            </div>
            {outsideDates.map(dateStr => {
              const dateObj = new Date(dateStr + 'T12:00:00')
              const label = dateObj.toLocaleDateString('en-US', { weekday: 'long', month: 'short', day: 'numeric' })
              const isPast = dateStr < today
              const isDragTarget = dragOverDate === dateStr
              return (
                <div
                  key={dateStr}
                  ref={el => dateRefs.current[dateStr] = el}
                  onDragOver={e => handleDragOver(e, dateStr)}
                  onDragLeave={handleDragLeave}
                  onDrop={e => handleDrop(e, dateStr)}
                  style={{ borderRadius: 10, padding: isDragTarget ? '6px 10px' : '0', border: isDragTarget ? '1px dashed rgba(212,168,74,0.5)' : '1px solid transparent', background: isDragTarget ? 'rgba(212,168,74,0.04)' : 'transparent', transition: 'all 0.12s ease' }}
                >
                  <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 8 }}>
                    <div style={{ fontSize: 11, fontFamily: fonts.mono, letterSpacing: '1px', color: isDragTarget ? colors.gold : isPast ? 'rgba(255,255,255,0.18)' : colors.textMuted, whiteSpace: 'nowrap' }}>{label}</div>
                    <div style={{ flex: 1, height: 1, background: isDragTarget ? 'rgba(212,168,74,0.25)' : 'rgba(255,255,255,0.05)' }} />
                    <div style={{ display: 'flex', gap: 3 }}>
                      {byDate[dateStr].map((p, i) => (
                        <div key={i} style={{ width: 6, height: 6, borderRadius: '50%', background: PLATFORMS[p.platform]?.color || colors.gold, opacity: 0.7 }} />
                      ))}
                    </div>
                  </div>
                  <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
                    {byDate[dateStr].map(post => (
                      <PostCard
                        key={post.id}
                        post={post}
                        canEdit={canEdit}
                        editing={editing === post.id}
                        confirming={confirming === post.id}
                        isDragging={draggingId === post.id}
                        onEdit={() => setEditing(post.id)}
                        onCancelEdit={() => setEditing(null)}
                        onSave={async p => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                        onConfirmDelete={() => setConfirming(post.id)}
                        onCancelDelete={() => setConfirming(null)}
                        onDelete={() => { onDelete(post.id); setConfirming(null) }}
                        onDragStart={e => handleDragStart(e, post.id)}
                        onDragEnd={handleDragEnd}
                      />
                    ))}
                  </div>
                </div>
              )
            })}
          </>
        )}

        {/* Unscheduled */}
        {(byDate['__none']?.length > 0 || dragOverDate === '__none') && (
          <div
            onDragOver={e => handleDragOver(e, '__none')}
            onDragLeave={handleDragLeave}
            onDrop={e => handleDrop(e, '__none')}
            style={{ borderRadius: 10, padding: dragOverDate === '__none' ? '6px 10px' : '0', border: dragOverDate === '__none' ? '1px dashed rgba(155,143,212,0.4)' : '1px solid transparent', background: dragOverDate === '__none' ? 'rgba(155,143,212,0.04)' : 'transparent', transition: 'all 0.12s ease' }}
          >
            <div style={{ display: 'flex', alignItems: 'center', gap: 12, marginBottom: 8 }}>
              <div style={{ fontSize: 9, color: dragOverDate === '__none' ? colors.purple : colors.textFaint, fontFamily: fonts.mono, letterSpacing: '2px', textTransform: 'uppercase' }}>Unscheduled</div>
              <div style={{ flex: 1, height: 1, background: dragOverDate === '__none' ? 'rgba(155,143,212,0.2)' : 'rgba(255,255,255,0.05)' }} />
              {dragOverDate === '__none' && <span style={{ fontSize: 9, color: 'rgba(155,143,212,0.5)', fontFamily: fonts.mono, letterSpacing: '1px' }}>drop to unschedule</span>}
            </div>
            <div style={{ display: 'flex', flexDirection: 'column', gap: 6 }}>
              {(byDate['__none'] || []).map(post => (
                <PostCard
                  key={post.id}
                  post={post}
                  canEdit={canEdit}
                  editing={editing === post.id}
                  confirming={confirming === post.id}
                  isDragging={draggingId === post.id}
                  onEdit={() => setEditing(post.id)}
                  onCancelEdit={() => setEditing(null)}
                  onSave={async p => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                  onConfirmDelete={() => setConfirming(post.id)}
                  onCancelDelete={() => setConfirming(null)}
                  onDelete={() => { onDelete(post.id); setConfirming(null) }}
                  onDragStart={e => handleDragStart(e, post.id)}
                  onDragEnd={handleDragEnd}
                />
              ))}
            </div>
          </div>
        )}

        {filtered.length === 0 && !creating && (
          <div style={{ textAlign: 'center', padding: '40px 20px', color: colors.textFaint, fontFamily: fonts.mono, fontSize: 11, letterSpacing: '1px' }}>
            <div style={{ fontSize: 28, marginBottom: 12, opacity: 0.15, fontFamily: fonts.display }}>✦</div>
            No posts match the current filters
          </div>
        )}
      </div>
    </div>
  )
}

// ── Post Card ─────────────────────────────────────────────────────────────────
const VIDEO_TYPES = ['Video', 'Reel', 'Stitch']

function PostCard({ post, canEdit, editing, confirming, isDragging, onEdit, onCancelEdit, onSave, onConfirmDelete, onCancelDelete, onDelete, onDragStart, onDragEnd }) {
  const cfg = PLATFORMS[post.platform] || {}
  const [scriptOpen, setScriptOpen] = useState(false)
  const isVideoType = VIDEO_TYPES.includes(post.post_type)

  if (editing) {
    return (
      <div className="glass" style={{ borderRadius: 12, overflow: 'hidden' }}>
        <div style={{ height: 2, background: `linear-gradient(to right, ${cfg.color || colors.border}99, transparent)` }} />
        <div style={{ padding: '16px 20px' }}>
          <PostForm initial={post} onSave={onSave} onCancel={onCancelEdit} />
        </div>
      </div>
    )
  }

  return (
    <div
      className="card"
      draggable
      onDragStart={onDragStart}
      onDragEnd={onDragEnd}
      style={{
        borderRadius: 10, overflow: 'hidden',
        background: 'rgba(255,255,255,0.018)',
        border: `1px solid rgba(255,255,255,0.06)`,
        borderLeft: `3px solid ${cfg.color || colors.border}`,
        display: 'flex', alignItems: 'stretch',
        opacity: isDragging ? 0.35 : 1,
        cursor: 'grab',
        transition: 'opacity 0.15s ease',
      }}
    >
      {/* Platform color sidebar */}
      <div style={{ width: 3, flexShrink: 0, background: cfg.color || colors.border, opacity: 0.6, borderRadius: '0 0 0 0' }} />

      <div style={{ flex: 1, padding: '12px 16px' }}>
        {/* Meta row */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: post.content ? 8 : 0 }}>
          <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexWrap: 'wrap' }}>
            <span style={{
              fontSize: 10, fontWeight: '600', color: cfg.color,
              background: (cfg.color || '#888') + '18',
              padding: '2px 9px', borderRadius: 20, fontFamily: fonts.mono, letterSpacing: '0.5px',
            }}>
              {post.platform}
            </span>
            {post.post_type && (
              <span style={{ fontSize: 10, color: colors.textMuted, background: 'rgba(255,255,255,0.05)', padding: '2px 8px', borderRadius: 20, border: '1px solid rgba(255,255,255,0.07)', fontFamily: fonts.mono }}>
                {post.post_type}
              </span>
            )}
            <span style={{
              fontSize: 10,
              background: (STATUS_COLORS[post.status] || '#888') + '22',
              color: STATUS_COLORS[post.status] || '#888',
              padding: '2px 8px', borderRadius: 20, fontFamily: fonts.mono,
            }}>
              {post.status}
            </span>
            {post.post_time && (
              <span style={{ fontSize: 10, color: colors.textFaint, fontFamily: fonts.mono, letterSpacing: '0.3px' }}>
                {formatTime(post.post_time)}
              </span>
            )}
          </div>

          {canEdit && (
            <div style={{ display: 'flex', gap: 5, alignItems: 'center', flexShrink: 0, marginLeft: 8 }}>
              {confirming ? (
                <>
                  <span style={{ fontSize: 10, color: colors.red, fontFamily: fonts.mono }}>Delete?</span>
                  <button onClick={onDelete} style={btnDanger}>Yes</button>
                  <button onClick={onCancelDelete} style={btnGhost}>No</button>
                </>
              ) : (
                <>
                  <button onClick={onEdit} style={btnGhost}>Edit</button>
                  <button onClick={onConfirmDelete} style={{ ...btnGhost, color: colors.textFaint }}>✕</button>
                </>
              )}
            </div>
          )}
        </div>

        {/* Content */}
        {post.content && (
          <p style={{ margin: '0 0 6px', fontSize: 13, color: colors.text, lineHeight: 1.7, whiteSpace: 'pre-wrap', fontFamily: fonts.body }}>
            {post.content}
          </p>
        )}

        {/* Hashtags */}
        {post.hashtags && (
          <p style={{ margin: '0 0 6px', fontSize: 11, color: '#6090e0', lineHeight: 1.5, fontFamily: fonts.mono }}>
            {post.hashtags}
          </p>
        )}

        {/* Media notes */}
        {post.media_notes && (
          <div style={{ fontSize: 11, color: colors.textFaint, borderTop: '1px solid rgba(255,255,255,0.05)', paddingTop: 7, marginTop: 4, fontFamily: fonts.body }}>
            <span style={{ marginRight: 6, opacity: 0.5 }}>📷</span>{post.media_notes}
          </div>
        )}

        {/* Char count */}
        {cfg.charLimit && post.content && (
          <div style={{ marginTop: 6, fontSize: 9, color: charColor(post.content.length, cfg.charLimit), fontFamily: fonts.mono, letterSpacing: '0.5px' }}>
            {post.content.length} / {cfg.charLimit}
            {cfg.hasHashtags && post.hashtags && ` · ${countHashtags(post.hashtags)} tags${cfg.hashtagLimit ? ` / ${cfg.hashtagLimit}` : ''}`}
          </div>
        )}

        {/* Video script toggle */}
        {isVideoType && (
          <div style={{ marginTop: 8, borderTop: '1px solid rgba(255,255,255,0.05)', paddingTop: 7 }}>
            <button
              onClick={() => setScriptOpen(o => !o)}
              style={{ background: 'none', border: 'none', cursor: 'pointer', padding: 0, display: 'flex', alignItems: 'center', gap: 5, color: colors.textFaint, fontSize: 10, fontFamily: fonts.mono, letterSpacing: '0.5px' }}
            >
              <span style={{ fontSize: 8, opacity: 0.7, transition: 'transform 0.15s', display: 'inline-block', transform: scriptOpen ? 'rotate(90deg)' : 'rotate(0deg)' }}>▶</span>
              VIDEO SCRIPT
              {post.video_script && !scriptOpen && <span style={{ color: colors.gold, fontSize: 8, marginLeft: 2 }}>●</span>}
            </button>
            {scriptOpen && (
              <div style={{ marginTop: 8, padding: '10px 12px', background: 'rgba(255,255,255,0.03)', borderRadius: 6, border: '1px solid rgba(255,255,255,0.06)' }}>
                {post.video_script
                  ? <pre style={{ margin: 0, fontSize: 11, color: colors.textMuted, fontFamily: fonts.mono, whiteSpace: 'pre-wrap', lineHeight: 1.7 }}>{post.video_script}</pre>
                  : <span style={{ fontSize: 11, color: colors.textFaint, fontFamily: fonts.mono, fontStyle: 'italic' }}>No script yet — edit post to add one.</span>
                }
              </div>
            )}
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
    content: '', hashtags: '', media_notes: '', video_script: '', date: '', post_time: '',
  })
  const [saving, setSaving] = useState(false)

  useEffect(() => {
    const handler = (e) => { if (e.key === 'Escape') onCancel() }
    window.addEventListener('keydown', handler)
    return () => window.removeEventListener('keydown', handler)
  }, [])

  const cfg = PLATFORMS[form.platform] || {}
  const charCount = form.content?.length || 0
  const overLimit = cfg.charLimit && charCount > cfg.charLimit
  const hashtagCount = countHashtags(form.hashtags)
  const overHashtagLimit = cfg.hashtagLimit && hashtagCount > cfg.hashtagLimit
  const canSave = form.content?.trim() && !overLimit && !overHashtagLimit

  const set = (key, val) => setForm(f => ({ ...f, [key]: val }))
  const setPlatform = p => setForm(f => ({
    ...f, platform: p, post_type: PLATFORMS[p]?.postTypes[0] || '',
    post_time: f.post_time || suggestedTime(p),
  }))

  const handle = async () => {
    if (!canSave) return
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div>
      <div className="grid-5" style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr 1fr 1fr', gap: 10, marginBottom: 14 }}>
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
        <div>
          <label style={labelSt}>Time</label>
          <input
            type="time" value={form.post_time}
            onChange={e => set('post_time', e.target.value)}
            placeholder={suggestedTime(form.platform)}
            style={inputSt}
          />
        </div>
      </div>

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

      {cfg.hasMediaNotes && (
        <div style={{ marginBottom: 12 }}>
          <label style={labelSt}>Visual / Media Notes</label>
          <input
            placeholder="Describe the photo, video, or graphic needed…" value={form.media_notes}
            onChange={e => set('media_notes', e.target.value)}
            style={{ ...inputSt, marginTop: 6 }}
          />
        </div>
      )}

      {VIDEO_TYPES.includes(form.post_type) && (
        <div style={{ marginBottom: 18 }}>
          <label style={labelSt}>Video Script</label>
          <textarea
            rows={6}
            placeholder={'Script copy, spoken lines, cut sequence…\n\nExample:\n"saturday night at stardust. open till 5am."\n\n0:00 · 3s — Wide room, lights up, full energy\n0:03 · 3s — Singer at mic, crowd behind them\n0:06 · 4s — End card: STARDUST · EVERY SATURDAY · TILL 5AM'}
            value={form.video_script}
            onChange={e => set('video_script', e.target.value)}
            style={{ ...inputSt, marginTop: 6, resize: 'vertical', lineHeight: 1.7, fontFamily: fonts.mono, fontSize: 11 }}
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
const navBtn = {
  background: 'none', border: '1px solid rgba(255,255,255,0.08)',
  borderRadius: 4, color: colors.textFaint, padding: '2px 8px',
  fontSize: 11, fontFamily: fonts.mono,
}
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
