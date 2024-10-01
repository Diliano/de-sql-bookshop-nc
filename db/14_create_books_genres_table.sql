\c test_bookshop

CREATE TABLE books_genres (
    book_id INTEGER REFERENCES books(book_id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, genre_id)
);