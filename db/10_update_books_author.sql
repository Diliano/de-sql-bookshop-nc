\c test_bookshop

UPDATE books
SET author_id = 
    CASE
        WHEN book_id = 1 THEN 3
        WHEN book_id = 2 THEN 2
        WHEN book_id = 3 THEN 7
        WHEN book_id = 4 THEN 14
        WHEN book_id = 5 THEN 13
        WHEN book_id = 6 THEN 15
        WHEN book_id = 7 THEN 12
        WHEN book_id = 10 THEN 14
    END
RETURNING *;