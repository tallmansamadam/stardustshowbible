import { useState } from 'react'
import { colors, fonts } from './styles'

const PLATFORMS = ['Instagram', 'TikTok', 'Facebook', 'Twitter/X']
const STATUSES = ['idea', 'draft', 'scheduled', 'posted']
const STATUS_COLORS = { idea: '#9b8fd4', draft: '#e0a84a', scheduled: '#4ab8e0', posted: '#5acb8a' }

export default function PostsTab({ posts, canEdit, onAdd, onUpdate, onDelete }) {
  const [editing, setEditing] = useState(null)
  const [creating, setCreating] = useState(false)
  const [filterStatus, setFilterStatus] = useState('all')

  const filtered = (posts || []).filter(p => filterStatus === 'all' || p.status === filterStatus)

  return (
    <div>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 14 }}>
        <h2 style={{ margin: 0, fontSize: 18, color: colors.gold, fontWeight: 'normal', fontFamily: fonts.display }}>Social Media Posts</h2>
        {canEdit && (
          <button onClick={() => setCreating(true)} style={{ background: colors.gold + '22', border: `1px solid ${colors.gold}66`, color: colors.gold, borderRadius: 6, padding: '6px 14px', cursor: 'pointer', fontSize: 13 }}>
            + New Post
          </button>
        )}
      </div>

      {/* Filter */}
      <div style={{ display: 'flex', gap: 8, marginBottom: 18, flexWrap: 'wrap' }}>
        {['all', ...STATUSES].map(s => (
          <button key={s} onClick={() => setFilterStatus(s)} style={{
            fontSize: 11, padding: '4px 12px', borderRadius: 10, cursor: 'pointer', border: 'none',
            background: filterStatus === s ? (STATUS_COLORS[s] || colors.gold) : (STATUS_COLORS[s] || colors.border) + '22',
            color: filterStatus === s ? '#0d0b14' : (STATUS_COLORS[s] || colors.textMuted),
          }}>{s}</button>
        ))}
      </div>

      {creating && (
        <PostForm onSave={async (p) => { await onAdd(p); setCreating(false) }} onCancel={() => setCreating(false)} />
      )}

      <div style={{ display: 'grid', gap: 12 }}>
        {filtered.map(post => (
          <div key={post.id} style={{ background: colors.surface, border: `1px solid ${colors.border}`, borderRadius: 10, padding: '16px 20px' }}>
            {editing === post.id ? (
              <PostForm
                initial={post}
                onSave={async (p) => { await onUpdate({ ...post, ...p }); setEditing(null) }}
                onCancel={() => setEditing(null)}
              />
            ) : (
              <>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: 10 }}>
                  <div style={{ display: 'flex', gap: 8, alignItems: 'center', flexWrap: 'wrap' }}>
                    <span style={{ fontSize: 12, color: colors.purple, background: colors.purple + '22', padding: '2px 10px', borderRadius: 10 }}>{post.platform}</span>
                    <span style={{ fontSize: 11, background: (STATUS_COLORS[post.status] || '#888') + '22', color: STATUS_COLORS[post.status] || '#888', padding: '2px 10px', borderRadius: 10 }}>{post.status}</span>
                    {post.date && <span style={{ fontSize: 11, color: colors.textFaint }}>{post.date}</span>}
                  </div>
                  {canEdit && (
                    <div style={{ display: 'flex', gap: 8 }}>
                      <button onClick={() => setEditing(post.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>Edit</button>
                      <button onClick={() => onDelete(post.id)} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textFaint, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 12 }}>✕</button>
                    </div>
                  )}
                </div>
                <p style={{ margin: 0, fontSize: 13, color: colors.textMuted, lineHeight: 1.7 }}>{post.content}</p>
              </>
            )}
          </div>
        ))}
        {filtered.length === 0 && (
          <div style={{ textAlign: 'center', padding: '40px', color: colors.textFaint, fontSize: 13 }}>No posts yet in this category.</div>
        )}
      </div>
    </div>
  )
}

function PostForm({ initial, onSave, onCancel }) {
  const [form, setForm] = useState(initial || { platform: 'Instagram', status: 'idea', content: '', date: '' })
  const [saving, setSaving] = useState(false)

  const inputStyle = { background: '#13111f', border: `1px solid ${colors.border}`, borderRadius: 6, padding: '8px 10px', color: colors.text, fontSize: 13, outline: 'none' }

  const handle = async () => {
    setSaving(true)
    await onSave(form)
    setSaving(false)
  }

  return (
    <div style={{ background: '#13111f', border: `1px solid ${colors.gold}44`, borderRadius: 10, padding: 20, marginBottom: 16 }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr 1fr', gap: 10, marginBottom: 10 }}>
        <select value={form.platform} onChange={e => setForm(f => ({ ...f, platform: e.target.value }))} style={inputStyle}>
          {PLATFORMS.map(p => <option key={p} value={p}>{p}</option>)}
        </select>
        <select value={form.status} onChange={e => setForm(f => ({ ...f, status: e.target.value }))} style={inputStyle}>
          {STATUSES.map(s => <option key={s} value={s}>{s}</option>)}
        </select>
        <input type="date" value={form.date} onChange={e => setForm(f => ({ ...f, date: e.target.value }))} style={inputStyle} />
      </div>
      <textarea rows={4} placeholder="Post content..." value={form.content} onChange={e => setForm(f => ({ ...f, content: e.target.value }))}
        style={{ ...inputStyle, width: '100%', boxSizing: 'border-box', marginBottom: 12, fontFamily: fonts.body, resize: 'vertical' }} />
      <div style={{ display: 'flex', gap: 10 }}>
        <button onClick={handle} disabled={saving} style={{ background: colors.gold, color: '#0d0b14', border: 'none', borderRadius: 6, padding: '7px 18px', cursor: 'pointer', fontFamily: fonts.display, fontWeight: 600 }}>
          {saving ? 'Saving…' : 'Save'}
        </button>
        <button onClick={onCancel} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.purple, borderRadius: 6, padding: '7px 16px', cursor: 'pointer' }}>Cancel</button>
      </div>
    </div>
  )
}
