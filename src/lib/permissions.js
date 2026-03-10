// Role definitions
// editor = you (full access to everything)
// manager = owner (view all, edit strategy/planning/posts/sound)

export const ROLES = {
  EDITOR: 'editor',
  MANAGER: 'manager',
}

// Which tabs each role can EDIT (all roles can VIEW everything)
export const EDIT_PERMISSIONS = {
  editor:  ['notes', 'posts', 'strategy', 'karaoke', 'djsets', 'planning', 'sound'],
  manager: ['posts', 'strategy', 'planning', 'sound'],
}

export function canEdit(role, section) {
  return (EDIT_PERMISSIONS[role] || []).includes(section)
}

// Tab definitions
export const TABS = [
  { id: 'notes',    label: '📋 Notes',       section: 'notes'    },
  { id: 'posts',    label: '📱 Social Posts', section: 'posts'    },
  { id: 'strategy', label: '🎯 Strategy',     section: 'strategy' },
  { id: 'karaoke',  label: '🎤 Karaoke',      section: 'karaoke'  },
  { id: 'djsets',   label: '🎧 DJ Sets',      section: 'djsets'   },
  { id: 'planning', label: '📅 Planning',     section: 'planning' },
  { id: 'sound',    label: '🔊 Sound & Tech', section: 'sound'    },
]
