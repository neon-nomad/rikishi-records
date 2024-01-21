CREATE TABLE Tournament (
    tournament_id INTEGER PRIMARY KEY AUTOINCREMENT,
    basho TEXT,   -- The name of the tournament
    tournament_start DATE,  -- The date the tournament started
    tournament_end DATE, -- The date the tournament ended
);

CREATE TABLE Wrestler (
    wrestler_id INTEGER PRIMARY KEY AUTOINCREMENT,
    rank INTEGER,                -- The rank of the wrestler
    shikona TEXT,               -- The ring name of the wrestler
    heya TEXT,                  -- Heya (stable) of the wrestler
    name TEXT,                  -- Name of the wrestler
    total_wins INTEGER,         -- Number of Career wins
    total_loss INTEGER,         -- Number of career losses 
    ring_name_history TEXT,     -- Ring name history of the wrestler
    date_of_birth DATE,         -- Date of birth of the wrestler
    place_of_birth TEXT,        -- Place of birth of the wrestler
    height INTEGER,             -- Height of the wrestler in cm
    weight REAL,                -- Weight of the wrestler in kg
    favorite_grip_techniques TEXT,  -- Favorite grip/techniques of the wrestler
);

CREATE TABLE Bout (
    bout_id INTEGER PRIMARY KEY AUTOINCREMENT,
    kimarite TEXT,              -- The move used to win the bout
    duration INTEGER,           -- Duration of the bout in seconds
);

CREATE TABLE Match (
    match_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tournament_id INTEGER,         -- Foreign key referencing Tournament table
    match_date DATE,               -- Day of the match
    wrestler1_id INTEGER,          -- Foreign key referencing Wrestler table for the first wrestler
    wrestler2_id INTEGER,          -- Foreign key referencing Wrestler table for the second wrestler
    bout_id INTEGER,               -- Foreign key referencing Bout table
    wrestler1_win BOOLEAN,         -- Whether the first wrestler won or lost
    wrestler2_win BOOLEAN,         -- Whether the second wrestler won or lost

    FOREIGN KEY (tournament_id) REFERENCES Tournament(tournament_id),
    FOREIGN KEY (wrestler1_id) REFERENCES Wrestler(wrestler_id),
    FOREIGN KEY (wrestler2_id) REFERENCES Wrestler(wrestler_id),
    FOREIGN KEY (bout_id) REFERENCES Bout(bout_id),
);

CREATE TABLE MediaReference (
    media_id INTEGER PRIMARY KEY AUTOINCREMENT,
    wrestler_id INTEGER,          -- Foreign key referencing Wrestler table
    media_type TEXT,              -- Type of media coverage (interview, documentary, etc.)
    reference_link TEXT,          -- Link or reference to the media coverage
    description TEXT,             -- Description or summary of the media content
    date_published DATE,          -- Date when the media content was published

    FOREIGN KEY (wrestler_id) REFERENCES Wrestler(wrestler_id),
);

CREATE TABLE User (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,        -- Unique username for each user
    email TEXT UNIQUE,           -- Email address of the user
    password_salt TEXT,          -- Salt used for password hashing
    password_hash TEXT,          -- Hashed password for user authentication
    join_date DATE,              -- Date when the user joined the app
);

CREATE TABLE UserPrediction (
    prediction_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,             -- Foreign key referencing User table
    match_id INTEGER,            -- Foreign key referencing Match table
    predicted_winner INTEGER,    -- Foreign key referencing Wrestler table for predicted winner
    prediction_date DATE,        -- Date when the prediction was made

    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (match_id) REFERENCES Match(match_id),
    FOREIGN KEY (predicted_winner) REFERENCES Wrestler(wrestler_id),
);

CREATE TABLE UserStats (
    user_stats_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,             -- Foreign key referencing User table
    total_points INTEGER,        -- Total points earned by the user in predictions
    total_wins INTEGER,          -- Total number of correct predictions
    total_losses INTEGER,        -- Total number of incorrect predictions

    FOREIGN KEY (user_id) REFERENCES User(user_id),
);

CREATE TABLE Discussion (
    discussion_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,             -- Foreign key referencing User table
    title TEXT,                  -- Title of the discussion thread
    content TEXT,                -- Content of the discussion post
    post_date DATE,              -- Date when the discussion post was made

    FOREIGN KEY (user_id) REFERENCES User(user_id),
);

CREATE TABLE UserConnection (
    connection_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user1_id INTEGER,            -- Foreign key referencing User table for the first user
    user2_id INTEGER,            -- Foreign key referencing User table for the second user
    connection_date DATE,        -- Date when the connection was established

    FOREIGN KEY (user1_id) REFERENCES User(user_id),
    FOREIGN KEY (user2_id) REFERENCES User(user_id),
);

CREATE TABLE Leaderboard (
    leaderboard_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,             -- Foreign key referencing User table
    total_points INTEGER,        -- Total points earned by the user
    rank INTEGER,                -- Rank of the user in the leaderboard

    FOREIGN KEY (user_id) REFERENCES User(user_id),
);

CREATE TABLE UserMediaContribution (
    contribution_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,             -- Foreign key referencing User table
    media_id INTEGER,            -- Foreign key referencing MediaReference table
    contribution_text TEXT,      -- User's contribution or comment on the media content
    contribution_date DATE,      -- Date when the contribution was made

    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (media_id) REFERENCES MediaReference(media_id),
);
