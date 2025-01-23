CREATE TABLE IF NOT EXISTS cities(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	city_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS item_types(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	item_type_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS customers(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_name VARCHAR(50),
	birthday DATE,
	city_id INT,
	
	FOREIGN KEY (city_id)
	REFERENCES cities(id)
);

CREATE TABLE IF NOT EXISTS orders(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_id INT,
	
	FOREIGN KEY (customer_id)
	REFERENCES customers(id)
);

CREATE TABLE IF NOT EXISTS items(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	item_name VARCHAR(50),
	item_type_id INT,
	
	FOREIGN KEY (item_type_id)
	REFERENCES item_types(id)
);

CREATE TABLE IF NOT EXISTS order_items(
	order_id INT,
	item_id INT,
	
	CONSTRAINT pk_order_items
	PRIMARY KEY (order_id, item_id),
	
	FOREIGN KEY (order_id)
	REFERENCES orders(id),
	
	FOREIGN KEY (item_id)
	REFERENCES items(id)
);