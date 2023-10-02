SELECT 
	COUNT(*)
FROM 
	bookings
JOIN 
	customers AS c
USING 
	(customer_id)
WHERE 
	c.last_name = 'Hahn';