import { useState, useEffect } from 'react'
import { supabase } from './lib/supabase'
import { TABS, canEdit } from './lib/permissions'
import { DEFAULT_CONTENT } from './lib/defaults'
import LoginPage from './components/LoginPage'
import NotesTab from './components/NotesTab'
import PostsTab from './components/PostsTab'
import MarkdownEditor from './components/MarkdownEditor'
import { colors, fonts } from './components/styles'

// Role assignment by email — edit these to match your actual emails
const ROLE_MAP = {
  // 'tallmancodes@gmail.com': 'editor',
  // 'dino.brandom@gmail.com': 'manager',
}
const DEFAULT_ROLE = 'editor' // fallback during dev; tighten before launch

export default function App() {
  const [session, setSession] = useState(null)
  const [role, setRole] = useState(null)
  const [activeTab, setActiveTab] = useState(0)
  const [notes, setNotes] = useState([])
  const [posts, setPosts] = useState([])
  const [content, setContent] = useState({})
  const [saving, setSaving] = useState(false)
  const [saveMsg, setSaveMsg] = useState('')
  const [loading, setLoading] = useState(true)

  // Auth
  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setSession(session)
      if (session) resolveRole(session.user.email)
    })
    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setSession(session)
      if (session) resolveRole(session.user.email)
      else setRole(null)
    })
    return () => subscription.unsubscribe()
  }, [])

  const resolveRole = (email) => {
    setRole(ROLE_MAP[email] || DEFAULT_ROLE)
  }

  // Load data once authed
  useEffect(() => {
    if (session) loadAll()
  }, [session])

  const loadAll = async () => {
    setLoading(true)
    await Promise.all([loadNotes(), loadPosts(), loadContent()])
    setLoading(false)
  }

  // Notes
  const loadNotes = async () => {
    const { data } = await supabase.from('notes').select('*').order('created_at', { ascending: false })
    setNotes(data || [])
  }
  const addNote = async (note) => {
    const { data } = await supabase.from('notes').insert([{ ...note, user_id: session.user.id }]).select()
    if (data) setNotes(n => [data[0], ...n])
    flash('Note saved')
  }
  const updateNote = async (note) => {
    await supabase.from('notes').update(note).eq('id', note.id)
    setNotes(n => n.map(x => x.id === note.id ? note : x))
    flash('Note updated')
  }
  const deleteNote = async (id) => {
    await supabase.from('notes').delete().eq('id', id)
    setNotes(n => n.filter(x => x.id !== id))
  }

  // Posts
  const loadPosts = async () => {
    const { data } = await supabase.from('posts').select('*').order('created_at', { ascending: false })
    setPosts(data || [])
  }
  const addPost = async (post) => {
    const { data } = await supabase.from('posts').insert([{ ...post, user_id: session.user.id }]).select()
    if (data) setPosts(p => [data[0], ...p])
    flash('Post saved')
  }
  const updatePost = async (post) => {
    await supabase.from('posts').update(post).eq('id', post.id)
    setPosts(p => p.map(x => x.id === post.id ? post : x))
    flash('Post updated')
  }
  const deletePost = async (id) => {
    await supabase.from('posts').delete().eq('id', id)
    setPosts(p => p.filter(x => x.id !== id))
  }

  // Long-form content (strategy, karaoke, djsets, planning, sound)
  const loadContent = async () => {
    const { data } = await supabase.from('content').select('*')
    const map = {}
    if (data) data.forEach(row => { map[row.key] = row.value })
    // Fill in defaults for any missing keys
    const sections = ['strategy', 'karaoke', 'djsets', 'planning', 'sound']
    sections.forEach(k => { if (!map[k]) map[k] = DEFAULT_CONTENT[k] })
    setContent(map)
  }
  const saveContent = async (key, value) => {
    setSaving(true)
    const { data: existing } = await supabase.from('content').select('id').eq('key', key).single()
    if (existing) {
      await supabase.from('content').update({ value, updated_at: new Date().toISOString() }).eq('key', key)
    } else {
      await supabase.from('content').insert([{ key, value }])
    }
    setContent(c => ({ ...c, [key]: value }))
    setSaving(false)
    flash('Saved')
  }

  const flash = (msg) => {
    setSaveMsg(msg)
    setTimeout(() => setSaveMsg(''), 2000)
  }

  const handleLogout = () => supabase.auth.signOut()

  if (!session) return <LoginPage />

  const currentSection = TABS[activeTab].section

  return (
    <div style={{ minHeight: '100vh', background: colors.bg, fontFamily: fonts.body, color: colors.text, position: 'relative', overflow: 'hidden' }}>
      <Stars />
      <style>{`
        @keyframes twinkle { from { opacity: 0.12; } to { opacity: 0.65; } }
        @keyframes fadein { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: none; } }
        @keyframes flash { 0%,100% { opacity: 0; transform: translateY(-4px); } 10%,90% { opacity: 1; transform: none; } }
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-track { background: #0d0b14; }
        ::-webkit-scrollbar-thumb { background: #3a3050; border-radius: 3px; }
        ::-webkit-scrollbar-thumb:hover { background: #554466; }
      `}</style>

      <div style={{ position: 'relative', zIndex: 1, maxWidth: 920, margin: '0 auto', padding: '20px 16px 80px' }}>

        {/* Header */}
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: 28 }}>
          <div style={{ textAlign: 'center', flex: 1 }}>
            <img
              src="https://stardustchi.com/wp-content/uploads/2025/04/Stardust-Logo-Blue-1024x332.png"
              alt="Stardust Chicago"
              style={{ width: 210, marginBottom: 4 }}
            />
            <div style={{ fontSize: 11, letterSpacing: 4, color: colors.purple, textTransform: 'uppercase', marginTop: 2 }}>Club Organizer</div>
          </div>
          <div style={{ position: 'absolute', right: 0, top: 0, display: 'flex', flexDirection: 'column', alignItems: 'flex-end', gap: 4 }}>
            <span style={{ fontSize: 11, color: colors.textFaint }}>{session.user.email}</span>
            <span style={{ fontSize: 10, color: colors.purple, letterSpacing: 1, textTransform: 'uppercase' }}>{role}</span>
            <button onClick={handleLogout} style={{ background: 'none', border: `1px solid ${colors.border}`, color: colors.textFaint, borderRadius: 4, padding: '3px 10px', cursor: 'pointer', fontSize: 11, letterSpacing: '0.5px' }}>Sign out</button>
          </div>
        </div>

        {/* Save flash */}
        {saveMsg && (
          <div style={{ position: 'fixed', top: 20, right: 20, background: '#5acb8a18', border: '1px solid #5acb8a66', borderRadius: 8, padding: '9px 20px', color: '#5acb8a', fontSize: 13, zIndex: 100, animation: 'flash 2s ease forwards', backdropFilter: 'blur(8px)' }}>
            ✓ {saveMsg}
          </div>
        )}

        {/* Tabs */}
        <div style={{ display: 'flex', flexWrap: 'wrap', gap: 6, marginBottom: 28, justifyContent: 'center' }}>
          {TABS.map((tab, i) => (
            <button key={i} onClick={() => setActiveTab(i)} style={{
              background: activeTab === i ? colors.gold : 'transparent',
              color: activeTab === i ? '#0d0b14' : colors.textMuted,
              border: activeTab === i ? `1px solid ${colors.gold}` : `1px solid ${colors.border}`,
              borderRadius: 20, padding: '6px 16px', fontSize: 12, cursor: 'pointer',
              fontFamily: fonts.body, fontWeight: activeTab === i ? '700' : '400',
              letterSpacing: activeTab === i ? '0.3px' : 0,
            }}>{tab.label}</button>
          ))}
        </div>

        {loading ? (
          <div style={{ textAlign: 'center', padding: 60, color: colors.textFaint }}>Loading…</div>
        ) : (
          <div style={{ animation: 'fadein 0.25s' }}>
            {activeTab === 0 && (
              <NotesTab notes={notes} canEdit={canEdit(role, 'notes')} onAdd={addNote} onUpdate={updateNote} onDelete={deleteNote} />
            )}
            {activeTab === 1 && (
              <PostsTab posts={posts} canEdit={canEdit(role, 'posts')} onAdd={addPost} onUpdate={updatePost} onDelete={deletePost} />
            )}
            {activeTab === 2 && (
              <MarkdownEditor title="Strategy & Brand" value={content.strategy} canEdit={canEdit(role, 'strategy')} saving={saving}
                onSave={(v) => saveContent('strategy', v)} />
            )}
            {activeTab === 3 && (
              <MarkdownEditor title="Karaoke Notes" value={content.karaoke} canEdit={canEdit(role, 'karaoke')} saving={saving}
                onSave={(v) => saveContent('karaoke', v)} />
            )}
            {activeTab === 4 && (
              <MarkdownEditor title="DJ Set Notes" value={content.djsets} canEdit={canEdit(role, 'djsets')} saving={saving}
                onSave={(v) => saveContent('djsets', v)} />
            )}
            {activeTab === 5 && (
              <MarkdownEditor title="Event Planning" value={content.planning} canEdit={canEdit(role, 'planning')} saving={saving}
                onSave={(v) => saveContent('planning', v)} />
            )}
            {activeTab === 6 && (
              <MarkdownEditor title="Sound & Tech" value={content.sound} canEdit={canEdit(role, 'sound')} saving={saving}
                onSave={(v) => saveContent('sound', v)} />
            )}
          </div>
        )}
      </div>
    </div>
  )
}

function Stars() {
  return (
    <div style={{ position: 'fixed', inset: 0, pointerEvents: 'none', zIndex: 0 }}>
      {[...Array(55)].map((_, i) => (
        <div key={i} style={{
          position: 'absolute',
          left: `${(i * 37 + 11) % 100}%`,
          top: `${(i * 53 + 7) % 100}%`,
          width: `${(i % 3 === 0 ? 2 : 1)}px`, height: `${(i % 3 === 0 ? 2 : 1)}px`,
          borderRadius: '50%', background: 'white',
          opacity: 0.15 + (i % 5) * 0.08,
          animation: `twinkle ${2 + (i % 4)}s infinite alternate`,
          animationDelay: `${(i * 0.3) % 3}s`
        }} />
      ))}
    </div>
  )
}
