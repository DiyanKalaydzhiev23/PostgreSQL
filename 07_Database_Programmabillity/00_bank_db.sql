CREATE TABLE IF NOT EXISTS account_holders (
  "id" SERIAL PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  ssn VARCHAR(10) NOT NULL
);


INSERT INTO account_holders (
	first_name, last_name, ssn
) 
VALUES 
	('Susan', 'Cane', '1234567890'),
	('Kim', 'Novac', '1234567890'),
	('Jimmy', 'Henderson', '1234567890'),
	('Steve', 'Stevenson', '1234567890'),
	('Bjorn', 'Sweden', '1234567890'),
	('Kiril', 'Petrov', '1234567890'),
	('Petar', 'Kirilov', '1234567890'),
	('Michka', 'Tsekova', '1234567890'),
	('Zlatina', 'Pateva', '1234567890'),
	('Monika', 'Miteva', '1234567890'),
	('Zlatko', 'Zlatyov', '1234567890'),
	('Petko', 'Petkov Junior', '1234567890');
	
	
CREATE TABLE IF NOT EXISTS accounts (
  "id" SERIAL PRIMARY KEY,
  account_holder_id INT NOT NULL,
  balance DECIMAL(19, 4) DEFAULT '0.0000',
  CONSTRAINT fk_accounts_account_holders
	FOREIGN KEY (account_holder_id) 
	REFERENCES account_holders("id")
	ON DELETE CASCADE
	ON UPDATE CASCADE
);


INSERT INTO accounts (
	account_holder_id, balance
) 
VALUES 
	(1, 123.1200),
	(3, 4354.2300),
	(12, 6546543.2300),
	(9, 15345.6400),
	(11, 36521.2000),
	(8, 5436.3400),
	(10, 565649.2000),
	(11, 999453.5000),
	(1, 5349758.2300),
	(2, 543.3000),
	(3, 10.2000),
	(7, 245656.2300),
	(5, 5435.3200),
	(4, 1.2300),
	(6, 0.1900),
	(2, 5345.3400),
	(11, 76653.2000),
	(1, 235469.8900);