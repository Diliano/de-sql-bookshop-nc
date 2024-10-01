\c test_bookshop

\echo '\n Here is the total number of books we have by each author:\n'

SELECT authors.author_name, COUNT(books) AS num_books
FROM authors
JOIN books ON authors.author_id = books.author_id
GROUP BY authors.author_name
ORDER BY num_books DESC;

\echo '\n Here is the average price for dystopian books:\n'

SELECT AVG(price_in_pence) AS average_price
FROM books_genres
JOIN books ON books_genres.book_id = books.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
WHERE genres.genre_name = 'dystopian';