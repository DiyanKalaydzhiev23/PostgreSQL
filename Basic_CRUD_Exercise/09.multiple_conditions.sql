SELECT
	number,
	street
FROM 
	addresses
WHERE 
	id BETWEEN 50 AND 100
		OR 
	number < 1000;
	