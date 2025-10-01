import './globals.css';

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body className="bg-gray-950 text-gray-100 min-h-screen">
        <main className="max-w-xl mx-auto p-4">{children}</main>
      </body>
    </html>
  );
}