CREATE TABLE minions_birthdays (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(50),
	date_of_birth DATE,
	age INT,
	present VARCHAR(100),
	party TIMESTAMPTZ
);