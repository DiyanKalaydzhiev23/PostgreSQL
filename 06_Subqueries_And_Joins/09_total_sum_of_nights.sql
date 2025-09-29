SELECT 
	a.name,
	SUM(b.booked_for)
FROM
	bookings AS b
JOIN
	apartments AS a
USING
	(apartment_id)
GROUP BY
	a.name
ORDER BY
	a.name;
