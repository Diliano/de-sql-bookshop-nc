\c test_bookshop

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL UNIQUE
);