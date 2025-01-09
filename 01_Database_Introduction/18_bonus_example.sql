CREATE TYPE address AS (
	street VARCHAR(50),
	city VARCHAR(50),
	postal_code CHAR(4)
);

CREATE TABLE customers (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_name VARCHAR(100),
	customer_address address
);

INSERT INTO 
	customers(customer_name, customer_address)
VALUES
	('Pesho', ('ulitsa marica', 'sofia', '1600'));


SELECT 
	(customer_address).street,
	(customer_address).postal_code
FROM 
	customers;