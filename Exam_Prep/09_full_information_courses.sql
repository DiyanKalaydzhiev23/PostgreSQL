SELECT
	a.name AS address,
	CASE
		WHEN EXTRACT(HOUR FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
		ELSE 'Night'
	END AS day_time,
	co.bill,
	cl.full_name,
	ca.make,
	ca.model,
	cat.name AS category_name
FROM
	cars AS ca
JOIN
	courses AS co
ON
	co.car_id = ca.id
JOIN
	addresses AS a
ON
	co.from_address_id = a.id
JOIN
	categories AS cat
ON
	cat.id = ca.category_id
JOIN
	clients AS cl
ON
	cl.id = co.client_id
ORDER BY
	co.id ASC;