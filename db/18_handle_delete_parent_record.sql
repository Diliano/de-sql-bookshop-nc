\c test_bookshop

-- Deleting a book:
-- Modify the books_genres table in section 14 first

-- Delete a book here:

DELETE FROM books
WHERE books.title = 'The Little Prince';

-- Deleting an author:
-- Modify the books table in section 09 first

-- Modify the books_genres table in section 14 first

-- Delete an author here:

DELETE FROM authors
WHERE authors.author_name = 'Jane Austen';