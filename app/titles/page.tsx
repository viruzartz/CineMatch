'use client';

import { useEffect, useState } from 'react';
import Link from 'next/link';

export default function TitlesPage() {
  const [titles, setTitles] = useState([]);
  useEffect(() => {
    fetch('/api/titles').then(r => r.json()).then(setTitles);
  }, []);
  return (
    <div>
      <h2 className="text-2xl font-bold mb-4">Titles</h2>
      <ul className="space-y-2">
        {titles.map((t: any) => (
          <li key={t.id} className="bg-gray-800 rounded p-3">
            <Link href={`/titles/${t.id}`} className="text-lg font-semibold hover:underline">{t.name}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}