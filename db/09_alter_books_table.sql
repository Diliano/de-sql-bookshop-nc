\c test_bookshop

ALTER TABLE books
ADD COLUMN author_id INTEGER REFERENCES authors(author_id) ON DELETE CASCADE;

SELECT * FROM books;