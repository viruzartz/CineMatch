'use client';

import { useState } from 'react';
import { supabase } from '@/lib/supabaseClient';

export default function LoginPage() {
  const [email, setEmail] = useState('');
  const [msg, setMsg] = useState('');
  async function handleLogin(e: React.FormEvent) {
    e.preventDefault();
    const { error } = await supabase.auth.signInWithOtp({ email });
    setMsg(error ? error.message : 'Check your email for login link.');
  }
  return (
    <form onSubmit={handleLogin} className="flex flex-col gap-4">
      <input className="input" type="email" required placeholder="Email" value={email} onChange={e => setEmail(e.target.value)} />
      <button className="btn">Send Login Link</button>
      {msg && <p className="text-yellow-400">{msg}</p>}
    </form>
  );
}