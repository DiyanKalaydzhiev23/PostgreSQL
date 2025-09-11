CREATE TYPE address AS (
	street VARCHAR(100),
	city VARCHAR(50),
	zip_code CHAR(4)
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	customer_address address
);

INSERT INTO
	customers(name, customer_address)
VALUES
	('Pesho', ('maritsa', 'Sofia', '1600'));
	
SELECT * FROM customers;