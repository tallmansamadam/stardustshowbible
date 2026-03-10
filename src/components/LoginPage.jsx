import { useState } from 'react'
import { supabase } from '../lib/supabase'
import { fonts } from './styles'

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
    <div style={{ minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative', overflow: 'hidden' }}>
      <Stars />

      {/* Ambient glow */}
      <div style={{
        position: 'absolute', width: 640, height: 640, borderRadius: '50%',
        background: 'radial-gradient(circle, rgba(212,168,74,0.055) 0%, transparent 68%)',
        pointerEvents: 'none', zIndex: 0,
      }} />

      <div
        className="glass-solid"
        style={{ position: 'relative', zIndex: 1, width: 360, borderRadius: 20, padding: '50px 42px 46px', animation: 'fadein 0.7s ease both' }}
      >
        {/* Logo */}
        <div style={{ textAlign: 'center', marginBottom: 38 }}>
          <img
            src="https://stardustchi.com/wp-content/uploads/2025/04/Stardust-Logo-Blue-1024x332.png"
            alt="Stardust Chicago"
            style={{ width: 196, marginBottom: 18 }}
          />
          <GoldDivider />
          <div style={{ fontSize: 9, letterSpacing: '3.5px', color: 'rgba(155,143,212,0.6)', textTransform: 'uppercase', fontFamily: fonts.mono, marginTop: 12 }}>
            Club Organizer
          </div>
        </div>

        {/* Email */}
        <div style={{ marginBottom: 14 }}>
          <label style={labelSt}>Email</label>
          <input
            type="email" value={email} onChange={e => setEmail(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleLogin()}
            autoComplete="email" style={inputSt}
          />
        </div>

        {/* Password */}
        <div style={{ marginBottom: 30 }}>
          <label style={labelSt}>Password</label>
          <input
            type="password" value={password} onChange={e => setPassword(e.target.value)}
            onKeyDown={e => e.key === 'Enter' && handleLogin()}
            autoComplete="current-password" style={inputSt}
          />
        </div>

        {error && (
          <div style={{ color: '#e06060', fontSize: 12, marginBottom: 20, padding: '10px 14px', background: 'rgba(224,96,96,0.07)', border: '1px solid rgba(224,96,96,0.2)', borderRadius: 8, fontFamily: fonts.body, animation: 'fadein 0.2s ease' }}>
            {error}
          </div>
        )}

        <button
          onClick={handleLogin}
          disabled={loading}
          style={{
            width: '100%',
            background: loading
              ? 'rgba(212,168,74,0.2)'
              : 'linear-gradient(105deg, #b8862e 0%, #d4a84a 40%, #e8c06a 60%, #d4a84a 100%)',
            backgroundSize: '200% auto',
            color: loading ? 'rgba(212,168,74,0.5)' : '#09080f',
            border: 'none', borderRadius: 10, padding: '13px',
            fontSize: 10, fontFamily: fonts.mono, letterSpacing: '3.5px', textTransform: 'uppercase',
            animation: loading ? 'none' : 'shimmer 4s ease-in-out infinite',
            boxShadow: loading ? 'none' : '0 4px 24px rgba(212,168,74,0.18)',
          }}
        >
          {loading ? '· · ·' : 'Enter'}
        </button>
      </div>
    </div>
  )
}

function GoldDivider() {
  return (
    <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', gap: 12 }}>
      <div style={{ height: 1, width: 52, background: 'linear-gradient(to right, transparent, rgba(212,168,74,0.3))' }} />
      <span style={{ color: 'rgba(212,168,74,0.45)', fontSize: 8, lineHeight: 1 }}>✦</span>
      <div style={{ height: 1, width: 52, background: 'linear-gradient(to left, transparent, rgba(212,168,74,0.3))' }} />
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
            opacity: op,
            '--op': op,
            boxShadow: isGold ? `0 0 ${size * 5}px rgba(212,168,74,0.3)` : 'none',
            animation: `twinkle ${3 + (i % 5)}s ease-in-out infinite`,
            animationDelay: `${(i * 0.31) % 5}s`,
          }} />
        )
      })}
    </div>
  )
}

const labelSt = {
  display: 'block', fontSize: 9, letterSpacing: '2px',
  color: 'rgba(155,143,212,0.65)', textTransform: 'uppercase',
  marginBottom: 7, fontFamily: "'DM Mono', monospace",
}
const inputSt = {
  width: '100%', background: 'rgba(0,0,0,0.42)',
  border: '1px solid rgba(255,255,255,0.1)', borderRadius: 8,
  padding: '11px 14px', color: '#f0e8d0', fontSize: 14,
  fontFamily: "'DM Sans', sans-serif",
}
