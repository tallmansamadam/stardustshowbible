import { useState, useEffect } from 'react'
import { supabase } from './lib/supabase'
import { TABS, canEdit } from './lib/permissions'
import { DEFAULT_CONTENT } from './lib/defaults'
import LoginPage from './components/LoginPage'
import NotesTab from './components/NotesTab'
import PostsTab from './components/PostsTab'
import MarkdownEditor from './components/MarkdownEditor'
import { colors, fonts } from './components/styles'

const ROLE_MAP = {
  // 'tallmancodes@gmail.com': 'editor',
  // 'dino.brandom@gmail.com': 'manager',
}
const DEFAULT_ROLE = 'editor'

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

  const resolveRole = (email) => setRole(ROLE_MAP[email] || DEFAULT_ROLE)

  useEffect(() => { if (session) loadAll() }, [session])

  const loadAll = async () => {
    setLoading(true)
    await Promise.all([loadNotes(), loadPosts(), loadContent()])
    setLoading(false)
  }

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
    flash('Saved')
  }
  const deleteNote = async (id) => {
    await supabase.from('notes').delete().eq('id', id)
    setNotes(n => n.filter(x => x.id !== id))
  }

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
    flash('Saved')
  }
  const deletePost = async (id) => {
    await supabase.from('posts').delete().eq('id', id)
    setPosts(p => p.filter(x => x.id !== id))
  }

  const loadContent = async () => {
    const { data } = await supabase.from('content').select('*')
    const map = {}
    if (data) data.forEach(row => { map[row.key] = row.value })
    const sections = ['showbible', 'karaoke', 'djsets', 'planning', 'sound']
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

  const flash = (msg) => { setSaveMsg(msg); setTimeout(() => setSaveMsg(''), 2200) }
  const handleLogout = () => supabase.auth.signOut()

  if (!session) return <LoginPage />

  const currentSection = TABS[activeTab].section

  return (
    <div style={{ minHeight: '100vh', fontFamily: fonts.body, color: colors.text, position: 'relative', overflow: 'hidden' }}>
      <Stars />

      {/* Flash notification */}
      {saveMsg && (
        <div style={{
          position: 'fixed', top: 24, right: 24, zIndex: 200,
          background: 'rgba(90,203,138,0.1)', border: '1px solid rgba(90,203,138,0.28)',
          borderRadius: 10, padding: '10px 20px', color: '#5acb8a',
          fontSize: 11, fontFamily: fonts.mono, letterSpacing: '1px',
          animation: 'flash 2.2s ease forwards',
          backdropFilter: 'blur(20px)', boxShadow: '0 4px 20px rgba(0,0,0,0.4)',
        }}>
          ✓ &nbsp;{saveMsg}
        </div>
      )}

      <div style={{ position: 'relative', zIndex: 1, maxWidth: 960, margin: '0 auto', padding: '0 20px 100px' }}>

        {/* ── Header ── */}
        <div style={{ position: 'relative', textAlign: 'center', padding: '36px 0 28px' }}>

          {/* User info — top right */}
          <div style={{ position: 'absolute', right: 0, top: 36, display: 'flex', alignItems: 'center', gap: 10 }}>
            <div style={{ textAlign: 'right' }}>
              <div style={{ fontSize: 11, color: colors.textFaint, fontFamily: fonts.mono, marginBottom: 2 }}>
                {session.user.email.split('@')[0]}
              </div>
              <div style={{ fontSize: 9, color: colors.purple, letterSpacing: '1.5px', textTransform: 'uppercase', fontFamily: fonts.mono }}>
                {role}
              </div>
            </div>
            <button
              onClick={handleLogout}
              style={{
                background: 'rgba(255,255,255,0.04)', border: '1px solid rgba(255,255,255,0.09)',
                color: colors.textFaint, borderRadius: 6, padding: '5px 12px',
                fontSize: 10, fontFamily: fonts.mono, letterSpacing: '1px',
              }}
            >
              Sign out
            </button>
          </div>

          {/* Logo */}
          <img
            src="https://stardustchi.com/wp-content/uploads/2025/04/Stardust-Logo-Blue-1024x332.png"
            alt="Stardust Chicago"
            style={{ width: 210, marginBottom: 14 }}
          />

          {/* Divider */}
          <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 14, marginBottom: 10 }}>
            <div style={{ height: 1, width: 56, background: 'linear-gradient(to right, transparent, rgba(212,168,74,0.28))' }} />
            <span style={{ color: 'rgba(212,168,74,0.4)', fontSize: 8, lineHeight: 1 }}>✦</span>
            <div style={{ height: 1, width: 56, background: 'linear-gradient(to left, transparent, rgba(212,168,74,0.28))' }} />
          </div>

          <div style={{ fontSize: 9, letterSpacing: '3.5px', color: 'rgba(155,143,212,0.55)', textTransform: 'uppercase', fontFamily: fonts.mono }}>
            Club Organizer
          </div>
        </div>

        {/* ── Tab bar ── */}
        <div
          className="tabs-row"
          style={{
            display: 'flex', borderBottom: '1px solid rgba(255,255,255,0.07)',
            marginBottom: 32, overflowX: 'auto',
          }}
        >
          {TABS.map((tab, i) => (
            <button
              key={i}
              onClick={() => setActiveTab(i)}
              style={{
                background: 'none', border: 'none',
                borderBottom: activeTab === i ? `2px solid ${colors.gold}` : '2px solid transparent',
                color: activeTab === i ? colors.gold : colors.textMuted,
                padding: '10px 14px', fontSize: 11,
                letterSpacing: '0.6px', textTransform: 'uppercase',
                fontFamily: fonts.body, whiteSpace: 'nowrap',
                marginBottom: -1,
                transition: 'color 0.2s ease, border-color 0.2s ease',
              }}
            >
              {tab.label.replace(/^\p{Emoji_Presentation}\s*/u, '')}
            </button>
          ))}
        </div>

        {/* ── Content ── */}
        {loading ? (
          <div style={{ display: 'flex', justifyContent: 'center', padding: '80px 0' }}>
            <div className="spinner" />
          </div>
        ) : (
          <div style={{ animation: 'fadein 0.3s ease' }}>
            {activeTab === 0 && <NotesTab notes={notes} canEdit={canEdit(role, 'notes')} onAdd={addNote} onUpdate={updateNote} onDelete={deleteNote} />}
            {activeTab === 1 && <PostsTab posts={posts} canEdit={canEdit(role, 'posts')} onAdd={addPost} onUpdate={updatePost} onDelete={deletePost} />}
            {activeTab === 2 && <MarkdownEditor title="Show Bible" value={content.showbible} canEdit={canEdit(role, 'showbible')} saving={saving} onSave={v => saveContent('showbible', v)} />}
            {activeTab === 3 && <MarkdownEditor title="Karaoke Notes" value={content.karaoke} canEdit={canEdit(role, 'karaoke')} saving={saving} onSave={v => saveContent('karaoke', v)} />}
            {activeTab === 4 && <MarkdownEditor title="DJ Set Notes" value={content.djsets} canEdit={canEdit(role, 'djsets')} saving={saving} onSave={v => saveContent('djsets', v)} />}
            {activeTab === 5 && <MarkdownEditor title="Event Planning" value={content.planning} canEdit={canEdit(role, 'planning')} saving={saving} onSave={v => saveContent('planning', v)} />}
            {activeTab === 6 && <MarkdownEditor title="Sound & Tech" value={content.sound} canEdit={canEdit(role, 'sound')} saving={saving} onSave={v => saveContent('sound', v)} />}
          </div>
        )}
      </div>
    </div>
  )
}

function Stars() {
  return (
    <div style={{ position: 'fixed', inset: 0, pointerEvents: 'none', zIndex: 0 }}>
      {Array.from({ length: 90 }, (_, i) => {
        const isGold = i % 14 === 0
        const size = i % 22 === 0 ? 2 : i % 6 === 0 ? 1.5 : 1
        const op = 0.07 + (i % 7) * 0.035
        return (
          <div key={i} style={{
            position: 'absolute',
            left: `${(i * 37.3 + 11.7) % 100}%`,
            top: `${(i * 53.1 + 7.3) % 100}%`,
            width: size, height: size, borderRadius: '50%',
            background: isGold ? '#d4a84a' : 'white',
            opacity: op, '--op': op,
            boxShadow: isGold ? `0 0 ${size * 5}px rgba(212,168,74,0.3)` : 'none',
            animation: `twinkle ${3 + (i % 5)}s ease-in-out infinite`,
            animationDelay: `${(i * 0.31) % 5}s`,
          }} />
        )
      })}
    </div>
  )
}
