SELECT
	b.booking_id,
	c.first_name AS customer_name
FROM
	bookings AS b
CROSS JOIN
	customers AS c
ORDER BY
	customer_name ASC;