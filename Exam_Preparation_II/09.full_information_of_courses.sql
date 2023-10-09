SELECT	
	a.name,
	CASE
		WHEN EXTRACT(HOUR FROM c.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	c.bill,
	cl.full_name,
	cr.make,
	cr.model,
	cat.name AS category_name
FROM
	courses AS c
JOIN 
	clients AS cl
ON 
	c.client_id = cl.id
JOIN 
	cars AS cr
ON 
	cr.id = c.car_id
JOIN 
	categories AS cat
ON 
	cr.category_id = cat.id
JOIN 
	addresses AS a
ON
	c.from_address_id = a.id
ORDER BY
	c.id ASC;
