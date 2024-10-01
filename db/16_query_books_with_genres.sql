\c test_bookshop

\echo '\n Here are the genres for Emma:\n'

SELECT genres.genre_name 
FROM books_genres
JOIN books ON books_genres.book_id = books.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
WHERE books.title = 'Emma';

\echo '\n Here are all the dystopian books:\n'

SELECT books.title
FROM books_genres
JOIN books ON books_genres.book_id = books.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
WHERE genres.genre_name = 'dystopian';