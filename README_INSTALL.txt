# CineMatch: Installation Guide (Mini PC / Server)

This guide helps you install and run CineMatch (Next.js + Supabase backend) on a mini PC or any server.  
CineMatch is a simple full-stack app for rating and comparing movies/series.

---

## 1. Prerequisites

- **Node.js** (v18 or higher recommended)
- **npm** (comes with Node.js)
- **Supabase account** ([https://supabase.com/](https://supabase.com/))
- **Git** (optional, for cloning the repo)

---

## 2. Clone the Project

```bash
git clone https://github.com/viruzartz/CineMatch.git
cd CineMatch
```

Or download and unzip the source.

---

## 3. Supabase Setup

1. **Create a Supabase Project**  
   Go to [https://app.supabase.com/](https://app.supabase.com/) and start a new project.

2. **Run Migrations**  
   In the Supabase dashboard, open "SQL Editor", and paste the schema/migrations from `supabase/migrations/001_init_schema.sql` (provided in this repo or earlier in this chat).  
   Run the SQL to set up tables and RLS policies.

3. **Get API Keys**  
   - Go to Project Settings > API.
   - Copy the `SUPABASE_URL` and `SUPABASE_ANON_KEY`.

---

## 4. Configure Environment Variables

Create a `.env.local` file in your project root:

```env
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
```

Replace with your actual Supabase details.

---

## 5. Install Dependencies

```bash
npm install
```

---

## 6. Build and Start the App

```bash
npm run build
npm start
```

The app will be available at [http://localhost:3000](http://localhost:3000).

To make it accessible on your LAN, set the host in `.env.local`:

```env
HOST=0.0.0.0
PORT=3000
```

Then start with:

```bash
npm start
```

---

## 7. (Optional) Run in Development Mode

```bash
npm run dev
```

---

## 8. Usage

- Visit the site in your browser: `http://localhost:3000`
- Login/sign up (email or OAuth)
- Browse titles, rate, compare users

---

## 9. Updating

To update the app:

```bash
git pull
npm install
npm run build
npm start
```

---

## 10. Troubleshooting

- If port 3000 is busy, change the `PORT` in `.env.local`
- For errors, check terminal logs and Supabase settings
- Ensure migrations are correct in Supabase SQL Editor

---

## 11. Uninstalling

To remove CineMatch:

```bash
cd ..
rm -rf CineMatch
```

---

## 12. Customizing

- Edit `.env.local` for keys/host/port
- Change styles in `app/globals.css`
- Update code/pages as needed

---

## 13. Security

- Protect your Supabase keys
- Use strong passwords for Supabase
- Set RLS policies as described in the schema

---

## 14. Support

- For issues, open a GitHub issue at: [https://github.com/viruzartz/CineMatch/issues](https://github.com/viruzartz/CineMatch/issues)