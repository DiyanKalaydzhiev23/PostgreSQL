CREATE TABLE customers(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	customer_name VARCHAR(50)
);

CREATE TABLE contacts(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	contact_name VARCHAR(50),
	phone VARCHAR(50),
	email VARCHAR(50),
	customer_id INT REFERENCES customers(id) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Insert into customers
INSERT INTO customers (customer_name) VALUES
('BlueBird Inc'),
('Dolphin LLC');

-- Insert into contacts
INSERT INTO contacts (contact_name, phone, email, customer_id) VALUES
('John Doe', '(408)-111-1234', 'john.doe@bluebird.dev', 1),
('Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev', 1),
('David Wright', '(408)-222-1234', 'david.wright@dolphin.dev', 2);


DELETE FROM
	customers
WHERE 
	id = 1; 