\c test_bookshop;

-- create the books table here

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price_in_pence INTEGER,
    quantity_in_stock INTEGER,
    release_date DATE,
    is_fiction BOOLEAN
);