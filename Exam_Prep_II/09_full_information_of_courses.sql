SELECT
	a.name AS address,
	CASE
		WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	co.bill,
	cl.full_name,
	cr.make,
	cr.model,
	ca.name AS category_name
FROM
	courses AS co
JOIN
	addresses AS a
ON
	a.id = co.from_address_id
JOIN
	cars AS cr
ON
	cr.id = co.car_id
JOIN
	categories AS ca
ON
	ca.id = cr.category_id
JOIN
	clients AS cl
ON
	cl.id = co.client_id
ORDER BY
	co.id ASC;