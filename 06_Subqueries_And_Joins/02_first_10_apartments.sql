SELECT
	a.name,
	a.country,
	TO_CHAR(b.booked_at, 'YYYY-MM-DD') AS booked_at
FROM
	apartments AS a
LEFT JOIN
	bookings AS b
USING
	(apartment_id)
LIMIT 10;