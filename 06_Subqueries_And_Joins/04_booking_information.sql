SELECT
	b.booking_id,
	a.name AS apartment_owner,
	a.apartment_id,
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM
	apartments AS a
FULL JOIN
	bookings AS b
USING
	(booking_id)
FULL JOIN
	customers AS c
USING
	(customer_id)
ORDER BY
	b.booking_id,
	apartment_owner,
	customer_name;
