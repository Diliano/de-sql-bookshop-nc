\c test_bookshop

INSERT INTO books_genres
    (book_id, genre_id)
VALUES
    (1, 1), (1, 7), (1, 8),
    (2, 2), (2, 4), (2, 8),
    (3, 2), (3, 8),
    (4, 3), (4, 8),
    (5, 5), (5, 1), (5, 8),
    (6, 5), (6, 1), (6, 8),
    (7, 1), (7, 7), (7, 8),
    (10, 3), (10, 8);

SELECT * FROM books_genres;