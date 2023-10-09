CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address (
	IN address_name VARCHAR(100)
) AS
$$
BEGIN
	TRUNCATE search_results;
	
	INSERT INTO
		search_results(
			address_name,
			full_name,
			level_of_bill,
			make,
			condition,
			category_name
		)
	SELECT 
		a.name,
		cl.full_name,
		CASE 
			WHEN co.bill <= 20 THEN 'Low'
			WHEN co.bill <= 30 THEN 'Medium'
			ELSE 'High'
		END,
		cr.make,
		cr.condition,
		cat.name
	FROM
		addresses AS a
	JOIN 
		courses AS co
	ON 
		a.id = co.from_address_id
	JOIN
		cars AS cr
	ON 
		cr.id = co.car_id
	JOIN 
		categories AS cat
	ON
		cat.id = cr.category_id
	JOIN 
		clients AS cl
	ON
		cl.id = co.client_id
	WHERE 
		a.name = address_name
	ORDER BY
		cr.make ASC,
		cl.full_name ASC;
END;
$$
LANGUAGE plpgsql;
