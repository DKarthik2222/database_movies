CREATE DATABASE movies;
USE movies;

-- actor
DROP TABLE IF EXISTS actor;
CREATE TABLE actor(
    acr_id integer PRIMARY KEY,
    act_fname VARCHAR(20),
    act_lname VARCHAR(20),
    act_gender varchar(1)
);
ALTER TABLE actor RENAME COLUMN acr_id TO act_id;
INSERT INTO actor VALUES(1, 'Prabhas', 'Raju', 'M');
INSERT INTO actor VALUES
    (2, 'Kajal', 'Agarwal', 'F'),
    (3, 'Tom', 'Cruise', 'M'),
    (4, 'Samantha', NULL, 'F');
INSERT INTO actor VALUES
    (5, 'Jake', 'Sully', 'M'),
    (6, 'Robert', 'Downey', 'M');

-- director
CREATE TABLE director(
    dir_id INTEGER PRIMARY KEY,
    dir_fname VARCHAR(20),
    dir_lname VARCHAR(20)
);
INSERT INTO director VALUES
    (1, 'Rajamouli', 'SS'),
    (2, 'James', 'Camaron'),
    (3, 'Akhil', 'Borragala');
INSERT INTO director VALUES
    (4, 'Joe', 'Russo');

-- movie_direction
CREATE TABLE movie_direction(
    dir_id INTEGER,
    mov_id INTEGER,
    PRIMARY KEY(dir_id, mov_id),
    FOREIGN KEY(dir_id) REFERENCES director(dir_id) ON DELETE CASCADE
);
ALTER TABLE movie_direction
ADD FOREIGN KEY(mov_id) REFERENCES movie(mov_id) ON DELETE CASCADE;

INSERT INTO movie_direction VALUES
    (1, 1),
    (1, 2),
    (2, 5),
    (3, 3),
    (4, 4);

-- Movie Cast
CREATE TABLE movie_cast(
    act_id INTEGER,
    mov_id INTEGER,
    PRIMARY KEY(act_id, mov_id),
    role VARCHAR(30),
    FOREIGN KEY(act_id) REFERENCES actor(act_id) ON DELETE CASCADE
);
ALTER TABLE movie_cast
ADD FOREIGN KEY(mov_id) REFERENCES movie(mov_id) ON DELETE CASCADE;

INSERT INTO movie_cast VALUES
    (1, 1, 'Hero'),
    (2, 1, 'Heroin'),
    (1, 2, 'Hero'),
    (2, 2, 'Heroin'),
    (3, 3, 'Hero'),
    (4, 3, 'Heroin'),
    (5, 5, 'Hero'),
    (6, 4, 'Hero');

-- Movie
CREATE TABLE movie(
    mov_id INTEGER PRIMARY KEY,
    mov_title varchar(50),
    mov_year INTEGER,
    mov_time INTEGER,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country VARCHAR(10)
);
INSERT INTO movie VALUES
    (1, 'Bhahubali', 2017, 150, 'Telugu', '2017-04-28', 'India'),
    (2, 'Saaho', 2019, 140, 'Telugu', '2019-06-18', 'India'),
    (3, 'Mission Impossible-Fallout', 2018, 120, 'English', '2018-12-31', 'USA'),
    (4, 'Avangers End Game', 2019, 182, 'English', '2019-04-26', 'India'),
    (5, 'Avatar', 2009, 165, 'English', '2009-12-18', 'New York');

-- Reviewer
CREATE TABLE reviewer(
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30)
);
INSERT INTO reviewer VALUES
    (1, 'Blockboster'),
    (3, 'Sensational Hit'),
    (2, 'Epic Hit');

-- generes
CREATE TABLE genres(
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20)
);
INSERT INTO genres VALUES
    (1, 'Action'),
    (2, 'History'),
    (3, 'Adventure'),
    (4, 'Sci-fic');

-- movie_genres
CREATE TABLE movie_genres(
    mov_id INT,
    gen_id INT,
    PRIMARY KEY(mov_id, gen_id),
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY(gen_id) REFERENCES genres(gen_id)
);
INSERT INTO movie_genres VALUES
    (1, 2),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4);

-- rating
CREATE TABLE rating(
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY(mov_id, rev_id),
    FOREIGN KEY(mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY(rev_id) REFERENCES reviewer(rev_id)
);
INSERT INTO rating VALUES
    (1, 2, 5, 10),
    (2, 1, 4, 6),
    (3, 1, 4, 10),
    (4, 3, 5, 30),
    (5, 3, 5, 100);
