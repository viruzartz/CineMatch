# CineMatch – Installation Guide for Ubuntu Linux (Mini PC / Server)

This guide describes how to install and run CineMatch on an Ubuntu Linux system (mini PC, server, or VM).

---

## 1. Update Your System

```bash
sudo apt update
sudo apt upgrade
```

---

## 2. Install Node.js and npm

**Recommended:** Node.js v18 or newer.

```bash
sudo apt install curl
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
```

Verify installation:

```bash
node -v
npm -v
```

---

## 3. Install Git

```bash
sudo apt install git
```

---

## 4. Clone the CineMatch Repository

```bash
git clone https://github.com/viruzartz/CineMatch.git
cd CineMatch
```

---

## 5. Create Supabase Project & Database

- Sign up at [https://app.supabase.com/](https://app.supabase.com/) and create a new project.
- In Supabase, go to **SQL Editor** and paste the migration from:
  ```
supabase/migrations/001_init_schema.sql
  ```
- Run the SQL to set up tables and policies.

---

## 6. Add Supabase Credentials

Create a file called `.env.local` in the CineMatch directory:

```
NEXT_PUBLIC_SUPABASE_URL=your-supabase-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-supabase-anon-key
```

Replace with your actual Supabase values.

---

## 7. Install Dependencies

```bash
npm install
```

---

## 8. Build and Start CineMatch

- **For production:**
  ```bash
  npm run build
  npm start
  ```
- **For development (auto-reload):**
  ```bash
  npm run dev
  ```

---

## 9. Access CineMatch

Open your browser and go to:

```
http://localhost:3000
```

Or use your Mini PC’s IP address for LAN access.

---

## 10. Open Port for LAN Access (optional)

If using a firewall (UFW):

```bash
sudo ufw allow 3000
```

---

## 11. Keeping the Server Running (optional)

For background operation, use [pm2](https://pm2.keymetrics.io/):

```bash
sudo npm install -g pm2
pm2 start npm --name "CineMatch" -- start
pm2 save
pm2 startup
```

---

## 12. Troubleshooting

- If you get errors, check terminal logs and Supabase settings.
- Make sure you have run the database migration.
- For port changes, set `PORT=xxxx` in `.env.local`.

---

## 13. Uninstalling

```bash
cd ..
rm -rf CineMatch
```

---

## 14. Need Help?

This is a student project with little prior experience.  
**We welcome all feedback, help, and suggestions!**

---