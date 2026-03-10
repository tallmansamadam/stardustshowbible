import { useState } from 'react'
import { colors, fonts } from './styles'

const PLATFORMS = ['Instagram', 'TikTok', 'Facebook', 'Twitter/X']
const STATUSES = ['idea', 'draft', 'scheduled', 'posted']
const STATUS_COLORS = { idea: '#9b8fd4', draft: '#e0a84a', scheduled: '#4ab8e0', posted: '#5acb8a' }

export default function PostsTab({ posts, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing] = useState(null)
  const [creating, setCreating] = useState(false)
  const [filterStatus, setFilterStatus] = useState('all')
  const [confirming, setConfirming] = useState(null)

  const filtered = (posts || []).filter(p => filterStatus === 'all' || p.status === filterStatus)

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
        <h2 style={{ margin: 0, fontSize: 18, color: colors.gold, fontWeight: 'normal', fontFamily: fonts.display }}>Social Media Posts</h2>
        {canEdit && !creating && (
          <button onClick={() => setCreating(true)} style={{ background: colors.gold + '22', border: `1px solid ${colors.gold}66`, color: colors.gold, borderRadius: 6, padding: '6px 14px', cursor: 'pointer', fontSize: 13 }}>
            + New Post
          </button>
        )}
      </div>

      {/* Filter pills */}
      <div style={{ display: 'flex', gap: 6, marginBottom: 18, flexWrap: 'wrap' }}>
        {['all', ...STATUSES].map(s => (
          <button key={s} onClick={() => setFilterStatus(s)} style={{
            fontSize: 11, padding: '4px 12px', borderRadius: 10, cursor: 'pointer',
            border: filterStatus === s ? 'none' : `1px solid ${(STATUS_COLORS[s] || colors.border)}44`,
            background: filterStatus === s ? (STATUS_COLORS[s] || colors.gold) : 'transparent',
            color: filterStatus === s ? '#0d0b14' : (STATUS_COLORS[s] || colors.textMuted),
            letterSpacing: '0.3px',
          }}>{s}</button>
        ))}
      </div>

      {creating && (
        <PostForm onSave={async (p) => { await onAdd(p); setCreating(false) }} onCancel={() => setCreating(false)} />
      )}

      <div style={{ display: 'grid', gap: 10 }}>
        {filtered.map(post => (
          <div key={post.id} className="card" style={{ background: colors.surface, border: `1px solid ${colors.border}`, borderRadius: 10, padding: '16px 20px' }}>
            {editing === post.id ? (
              <PostForm
                initial={post}
                onSave={async (p) => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                onCancel={() => setEditing(null)}
              />
            ) : (
              <>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 10 }}>
                  <div style={{ display: 'flex', gap: 7, alignItems: 'center', flexWrap: 'wrap' }}>
                    <span style={{ fontSize: 11, color: colors.purple, background: colors.purple + '22', padding: '2px 10px', borderRadius: 10 }}>{post.platform}</span>
                    <span style={{ fontSize: 11, background: (STATUS_COLORS[post.status] || '#888') + '28', color: STATUS_COLORS[post.status] || '#888', padding: '2px 10px', borderRadius: 10 }}>{post.status}</span>
                    {post.date && <span style={{ fontSize: 11, color: colors.textFaint }}>{post.date}</span>}
                  </div>
                  {canEdit && (
                    <div style={{ display: 'flex', gap: 6, alignItems: 'center', flexShrink: 0, marginLeft: 10 }}>
                      {confirming === post.id ? (
                        <>
                          <span style={{ fontSize: 11, color: colors.red, marginRight: 2 }}>Delete?</span>
                          <button onClick={() => { onDelete(post.id); setConfirming(null) }} style={{ background: colors.red + '22', border: `1px solid ${colors.red}66`, color: colors.red, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 11 }}>Yes</button>
                          <button onClick={() => setConfirming(null)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textMuted, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 11 }}>No</button>
                        </>
                      ) : (
                        <>
                          <button onClick={() => setEditing(post.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>Edit</button>
                          <button onClick={() => setConfirming(post.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textFaint, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>✕</button>
                        </>
                      )}
                    </div>
                  )}
                </div>
                <p style={{ margin: 0, fontSize: 13, color: colors.textMuted, lineHeight: 1.7 }}>{post.content}</p>
              </>
            )}
          </div>
        ))}
        {filtered.length === 0 && !creating && (
          <div style={{ textAlign: 'center', padding: '60px 20px', color: colors.textFaint, fontSize: 13 }}>
            <div style={{ fontSize: 28, marginBottom: 12, opacity: 0.3 }}>✦</div>
            No posts in this category yet.
          </div>
        )}
      </div>
    </div>
  )
}

function PostForm({ initial, onSave, onCancel }) {
  const [form, setForm] = useState(initial || { platform: 'Instagram', status: 'idea', content: '', date: '' })
  const [saving, setSaving] = useState(false)

  const inputStyle = { background: '#13111f', border: `1px solid ${colors.border}`, borderRadius: 6, padding: '8px 10px', color: colors.text, fontSize: 13 }

  const handle = async () => {
    if (!form.content.trim()) return
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div style={{ background: '#13111f', border: `1px solid ${colors.gold}44`, borderRadius: 10, padding: 20, marginBottom: 14 }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 10, marginBottom: 10 }}>
        <select value={form.platform} onChange={e => setForm(f => ({ ...f, platform: e.target.value }))} style={inputStyle}>
          {PLATFORMS.map(p => <option key={p} value={p}>{p}</option>)}
        </select>
        <select value={form.status} onChange={e => setForm(f => ({ ...f, status: e.target.value }))} style={inputStyle}>
          {STATUSES.map(s => <option key={s} value={s}>{s}</option>)}
        </select>
        <input type="date" value={form.date} onChange={e => setForm(f => ({ ...f, date: e.target.value }))} style={inputStyle} />
      </div>
      <textarea rows={4} placeholder="Post content…" value={form.content} onChange={e => setForm(f => ({ ...f, content: e.target.value }))}
        style={{ ...inputStyle, width: '100%', marginBottom: 14, fontFamily: fonts.body, resize: 'vertical' }} />
      <div style={{ display: 'flex', gap: 10 }}>
        <button onClick={handle} disabled={saving || !form.content.trim()} style={{ background: saving || !form.content.trim() ? colors.border : colors.gold, color: '#0d0b14', border: 'none', borderRadius: 6, padding: '7px 20px', cursor: saving || !form.content.trim() ? 'default' : 'pointer', fontFamily: fonts.display, fontWeight: 600 }}>
          {saving ? 'Saving…' : 'Save'}
        </button>
        <button onClick={onCancel} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 6, padding: '7px 16px', cursor: 'pointer' }}>Cancel</button>
      </div>
    </div>
  )
}
