\c test_bookshop

\echo '\n Here is a list of book titles with the corresponding author:\n'

SELECT books.title, authors.author_name
FROM books
JOIN authors on books.author_id = authors.author_id;

\echo '\n Here is a list of authors without an associated book:\n'

SELECT author_name
FROM authors
LEFT JOIN books on authors.author_id = books.author_id
WHERE books.author_id is NULL;