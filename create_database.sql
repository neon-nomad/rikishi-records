CREATE TABLE Tournament (
    tournament_id INTEGER PRIMARY KEY AUTOINCREMENT,
    basho TEXT,          -- The name of the tournament
    day INTEGER CHECK(day > 0),  -- The day of the tournament
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
    day INTEGER CHECK(day > 0),    -- Day of the match
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
