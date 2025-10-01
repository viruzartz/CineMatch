-- Profiles (users)
CREATE TABLE profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email text NOT NULL UNIQUE,
  username text NOT NULL UNIQUE,
  avatar_url text,
  created_at timestamp with time zone DEFAULT now()
);

-- Titles (movies/series)
CREATE TABLE titles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  description text,
  release_year integer,
  type text CHECK (type IN ('movie', 'series')),
  created_at timestamp with time zone DEFAULT now()
);

-- Genres
CREATE TABLE genres (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE
);

-- Tags (e.g., "Must Watch")
CREATE TABLE tags (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL UNIQUE
);

-- Title-Genres (many-to-many)
CREATE TABLE title_genres (
  title_id uuid REFERENCES titles(id) ON DELETE CASCADE,
  genre_id uuid REFERENCES genres(id) ON DELETE CASCADE,
  PRIMARY KEY (title_id, genre_id)
);

-- Title-Tags (many-to-many)
CREATE TABLE title_tags (
  title_id uuid REFERENCES titles(id) ON DELETE CASCADE,
  tag_id uuid REFERENCES tags(id) ON DELETE CASCADE,
  PRIMARY KEY (title_id, tag_id)
);

-- Ratings (per user per title)
CREATE TABLE ratings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES profiles(id) ON DELETE CASCADE,
  title_id uuid REFERENCES titles(id) ON DELETE CASCADE,
  stars integer NOT NULL CHECK (stars >= 0 AND stars <= 5),
  comment text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  UNIQUE (user_id, title_id)
);

-- Indexes for performance
CREATE INDEX idx_ratings_title_id ON ratings(title_id);
CREATE INDEX idx_ratings_user_id ON ratings(user_id);

-- Enable RLS
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE ratings ENABLE ROW LEVEL SECURITY;

-- RLS policy: Only allow users to view and update their own profile
CREATE POLICY "Profiles: Self view" ON profiles
  FOR SELECT USING (auth.uid() = id);

CREATE POLICY "Profiles: Self update" ON profiles
  FOR UPDATE USING (auth.uid() = id);

-- RLS policy: Users can insert/update/delete/select ratings they own
CREATE POLICY "Ratings: Owner" ON ratings
  FOR ALL USING (auth.uid() = user_id);

-- Open read-only access for titles, genres, tags, title_genres, title_tags
ALTER TABLE titles ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Titles: Public read" ON titles
  FOR SELECT USING (true);

ALTER TABLE genres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Genres: Public read" ON genres
  FOR SELECT USING (true);

ALTER TABLE tags ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Tags: Public read" ON tags
  FOR SELECT USING (true);

ALTER TABLE title_genres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "TitleGenres: Public read" ON title_genres
  FOR SELECT USING (true);

ALTER TABLE title_tags ENABLE ROW LEVEL SECURITY;
CREATE POLICY "TitleTags: Public read" ON title_tags
  FOR SELECT USING (true);

-- Insert/update/delete for admin only (customize as needed)
-- You can add admin policies for titles/genres/tags as required.