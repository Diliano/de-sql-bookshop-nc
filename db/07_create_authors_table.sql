\c test_bookshop

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL,
    fun_fact TEXT
);