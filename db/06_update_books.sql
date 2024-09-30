\c test_bookshop

\echo '\n These books have been put on sale, due to excess stock:\n'

UPDATE books
SET price_in_pence = price_in_pence - (price_in_pence * 0.1)
WHERE quantity_in_stock > 10
RETURNING *;