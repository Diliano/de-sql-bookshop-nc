\c test_bookshop

-- Add users to the database so that each review can be associated to a user. 

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL
);

INSERT INTO users
    (user_name)
VALUES
    ('Chris'),
    ('Ron'),
    ('Leslie'),
    ('Ann'),
    ('Andy');

SELECT * FROM users;


-- Use the ARRAY_AGG() function to get a list of each book in a single row, with all genres that the book belongs to.

SELECT books.title, ARRAY_AGG (genres.genre_name) genres
FROM books_genres
JOIN books ON books_genres.book_id = books.book_id
JOIN genres ON books_genres.genre_id = genres.genre_id
GROUP BY books.title;


-- Add the ability to add reviews to the books

CREATE TABLE users_books_ratings (
    user_id INT REFERENCES users(user_id),
    book_id INT REFERENCES books(book_id),
    rating INT NOT NULL CHECK(rating BETWEEN 1 AND 10),
    PRIMARY KEY (user_id, book_id, rating)
);

INSERT INTO users_books_ratings
    (user_id, book_id, rating)
VALUES
    (1, 1, 1), (2, 1, 3), (3, 1, 5), (4, 1, 7),
    (1, 5, 5), (2, 5, 7), (3, 5, 4), (4, 5, 6), (5, 5, 8),
    (1, 6, 6), (2, 6, 8), (3, 6, 3),
    (1, 7, 7), (2, 7, 9), (3, 7, 2);

SELECT * FROM users_books_ratings;


-- query all reviews of a specified book.

SELECT books.title, ARRAY_AGG (users_books_ratings.rating) AS all_ratings
FROM users_books_ratings
JOIN books ON users_books_ratings.book_id = books.book_id
GROUP BY books.title
HAVING books.title = 'Nineteen Eighty-Four: A Novel';


-- query the average rating of a book.

SELECT books.title, AVG(users_books_ratings.rating) as average_rating
FROM users_books_ratings
JOIN books ON users_books_ratings.book_id = books.book_id
GROUP BY books.title
HAVING books.title = 'Nineteen Eighty-Four: A Novel';


-- See only the most favourable and unfavourable reviews for a specified book.

SELECT books.title, MIN(users_books_ratings.rating) AS lowest_rating, MAX(users_books_ratings.rating) AS highest_rating
FROM users_books_ratings
JOIN books ON users_books_ratings.book_id = books.book_id
GROUP BY books.title
HAVING books.title = 'Nineteen Eighty-Four: A Novel';


-- List all books above a certain average rating.

SELECT books.title, AVG(users_books_ratings.rating) AS average_rating
FROM users_books_ratings
JOIN books ON users_books_ratings.book_id = books.book_id
GROUP BY books.title
HAVING AVG(users_books_ratings.rating) > 5;


-- Add users to the database so that each review can be associated to a user. MOVED TO TOP


-- List all reviews by a single user.

SELECT users.user_name, books.title, users_books_ratings.rating
FROM users_books_ratings
JOIN users ON users_books_ratings.user_id = users.user_id
JOIN books ON users_books_ratings.book_id = books.book_id
GROUP BY users.user_name, books.title, users_books_ratings.rating
HAVING users.user_name = 'Ron';


-- Find out the average rating that a user has given in all of their reviews.

SELECT users.user_name, ARRAY_AGG (users_books_ratings.rating) AS all_ratings, AVG(users_books_ratings.rating) AS average_rating
FROM users_books_ratings
JOIN users ON users_books_ratings.user_id = users.user_id
GROUP BY users.user_name
HAVING users.user_name = 'Ron';


-- List books that a user has not reviewed.

SELECT books.title
FROM books
EXCEPT
SELECT books.title
FROM users_books_ratings
JOIN users ON users_books_ratings.user_id = users.user_id
JOIN books ON users_books_ratings.book_id = books.book_id
WHERE users.user_name = 'Ron';


-- Get a list of all the unique prices that are on offer in the book table.

SELECT DISTINCT price_in_pence FROM books;