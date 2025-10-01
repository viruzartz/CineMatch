'use client';

import { useEffect, useState } from 'react';

export default function TitleDetailPage({ params }: { params: { id: string } }) {
  const [title, setTitle] = useState<any>(null);
  useEffect(() => {
    fetch(`/api/titles?id=${params.id}`).then(r => r.json()).then(data => setTitle(data?.[0]));
  }, [params.id]);
  return (
    <div>
      {title ? (
        <>
          <h2 className="text-2xl font-bold">{title.name}</h2>
          <p>{title.description}</p>
        </>
      ) : <div>Loading...</div>}
    </div>
  );
}