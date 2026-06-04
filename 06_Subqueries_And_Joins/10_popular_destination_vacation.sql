SELECT
	a.country,
	COUNT(b.booking_id) AS booking_count
FROM
	apartments AS a
JOIN
	bookings AS b
USING
	(apartment_id)
WHERE
	b.booked_at > '2021-05-18 07:52:09.904+03'
		AND
	b.booked_at < '2021-09-17 19:48:02.147+03'
GROUP BY
	a.country
ORDER BY
	booking_count DESC;