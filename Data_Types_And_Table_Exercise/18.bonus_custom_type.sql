
CREATE TYPE address AS (
	street TEXT,
	city TEXT,
	postalCode CHAR(4)
);

CREATE TABLE customers (
	id SERIAL PRIMARY KEY,
	customer_name TEXT,
	customer_address address
);


INSERT INTO 
	customers (customer_name, customer_address) 
VALUES ('Diyan', ('some street', 'sofia', '1616'));