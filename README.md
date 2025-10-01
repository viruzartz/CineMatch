# CineMatch

CineMatch is a simple, modern web app for discovering, rating, and comparing movies and series with friends.  
Built with **Next.js** and **Supabase**, it’s designed for speed, privacy, and ease of use—perfect for running on a mini PC or server.

---

## Features

- **User Authentication:**  
  Secure login via email (Supabase Auth).

- **Browse Titles:**  
  Discover movies and series with descriptions, genres, and tags.

- **Rate & Review:**  
  Add star ratings and comments for each title.

- **Compare with Friends:**  
  See how your ratings match with others.

- **Genres & Tags:**  
  Filter titles by genre and custom tags (e.g., “Must Watch”).

- **Simple API:**  
  All data is fetched via fast API routes.

- **Mobile-friendly:**  
  Responsive UI for all devices.

---

## Quick Start

1. **Clone the repository**
    ```bash
    git clone https://github.com/viruzartz/CineMatch.git
    cd CineMatch
    ```

2. **Configure Supabase**
    - Create a free project on [supabase.com](https://supabase.com/).
    - Run the migration in `supabase/migrations/001_init_schema.sql` (in Supabase SQL Editor).
    - Get your API keys and add them to `.env.local`.

3. **Install dependencies**
    ```bash
    npm install
    ```

4. **Run the app**
    ```bash
    npm run dev
    ```
    or build for production:
    ```bash
    npm run build
    npm start
    ```

5. **Open [http://localhost:3000](http://localhost:3000) in your browser**

---

## Project Structure

- `app/` – Next.js pages and API routes
- `lib/` – Supabase client setup
- `supabase/migrations/` – Database schema
- `app/globals.css` – Tailwind CSS styles

---

## License

MIT

---

## Contributing

Feel free to fork, submit pull requests, or open issues for feature requests and bug reports!
