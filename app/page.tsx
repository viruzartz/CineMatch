import Link from 'next/link';

export default function HomePage() {
  return (
    <div className="flex flex-col items-center gap-6 py-10">
      <h1 className="text-3xl font-bold">CineMatch</h1>
      <Link href="/login" className="btn">Login</Link>
      <Link href="/titles" className="btn">Browse Titles</Link>
    </div>
  );
}