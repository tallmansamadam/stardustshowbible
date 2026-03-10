import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { colors, fonts } from './styles'

export default function LoginPage() {
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)

  const handleLogin = async () => {
    setError('')
    setLoading(true)
    const { error } = await supabase.auth.signInWithPassword({ email, password })
    if (error) setError(error.message)
    setLoading(false)
  }

  return (
    <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', background: '#0d0b14' }}>
      <Stars />
      <div style={{ position: 'relative', zIndex: 1, width: 340, background: '#1a1628', border: '1px solid #3a3050', borderRadius: 16, padding: '44px 40px', boxShadow: '0 8px 40px rgba(0,0,0,0.5), 0 0 0 1px rgba(155,143,212,0.06)' }}>
        <div style={{ textAlign: 'center', marginBottom: 32 }}>
          <img
            src="https://stardustchi.com/wp-content/uploads/2025/04/Stardust-Logo-Blue-1024x332.png"
            alt="Stardust Chicago"
            style={{ width: 200, marginBottom: 10 }}
          />
          <div style={{ fontSize: 11, letterSpacing: 4, color: '#9b8fd4', textTransform: 'uppercase' }}>Club Organizer</div>
        </div>

        <div style={{ marginBottom: 14 }}>
          <label style={{ display: 'block', fontSize: 11, color: '#9b8fd4', letterSpacing: 2, textTransform: 'uppercase', marginBottom: 6 }}>Email</label>
          <input
            type="email"
            value={email}
            onChange={e => setEmail(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleLogin()}
            style={{ width: '100%', boxSizing: 'border-box', background: '#13111f', border: '1px solid #3a3050', borderRadius: 6, padding: '10px 14px', color: '#f0e8d0', fontFamily: 'DM Mono, monospace', fontSize: 13, outline: 'none' }}
          />
        </div>

        <div style={{ marginBottom: 24 }}>
          <label style={{ display: 'block', fontSize: 11, color: '#9b8fd4', letterSpacing: 2, textTransform: 'uppercase', marginBottom: 6 }}>Password</label>
          <input
            type="password"
            value={password}
            onChange={e => setPassword(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleLogin()}
            style={{ width: '100%', boxSizing: 'border-box', background: '#13111f', border: '1px solid #3a3050', borderRadius: 6, padding: '10px 14px', color: '#f0e8d0', fontFamily: 'DM Mono, monospace', fontSize: 13, outline: 'none' }}
          />
        </div>

        {error && <div style={{ color: '#e06060', fontSize: 12, marginBottom: 16, padding: '8px 12px', background: '#e0606022', borderRadius: 6 }}>{error}</div>}

        <button
          onClick={handleLogin}
          disabled={loading}
          style={{ width: '100%', background: loading ? '#3a3050' : '#d4a84a', color: '#0d0b14', border: 'none', borderRadius: 8, padding: '12px', fontSize: 14, fontFamily: 'Cormorant Garamond, Georgia, serif', fontWeight: 600, letterSpacing: 1, cursor: loading ? 'default' : 'pointer', transition: 'background 0.2s' }}
        >
          {loading ? 'Signing in…' : 'Enter'}
        </button>
      </div>
    </div>
  )
}

function Stars() {
  return (
    <div style={{ position: 'fixed', inset: 0, pointerEvents: 'none' }}>
      {[...Array(50)].map((_, i) => (
        <div key={i} style={{
          position: 'absolute',
          left: `${(i * 37 + 11) % 100}%`,
          top: `${(i * 53 + 7) % 100}%`,
          width: `${(i % 2) + 1}px`, height: `${(i % 2) + 1}px`,
          borderRadius: '50%', background: 'white',
          opacity: 0.2 + (i % 5) * 0.1,
        }} />
      ))}
    </div>
  )
}
