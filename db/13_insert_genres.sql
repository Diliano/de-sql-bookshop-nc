\c test_bookshop

INSERT INTO genres
    (genre_name)
VALUES
    ('science fiction'),
    ('children''s'),
    ('romance'),
    ('fantasy'),
    ('dystopian'),
    ('science'),
    ('adventure'),
    ('classics')
RETURNING *;