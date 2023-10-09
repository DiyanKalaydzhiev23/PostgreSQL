SELECT 
	cr.id AS car_id,
	cr.make AS make,
	cr.mileage AS mileage,
	COUNT(co.id) AS count_of_courses,
	ROUND(AVG(co.bill), 2) AS average_bill
FROM 
	cars AS cr
LEFT JOIN 
	courses AS co
ON 
	cr.id = co.car_id
GROUP BY
	cr.id
HAVING 
	COUNT(co.id) <> 2
ORDER BY
	count_of_courses DESC,
	cr.id ASC;