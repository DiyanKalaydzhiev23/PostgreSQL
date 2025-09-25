SELECT 
	mountain_range,
	peak_name,
	elevation
FROM
	mountains AS m
JOIN
	peaks AS p
ON 
	p.mountain_id = m.id
WHERE
	m.mountain_range = 'Rila'
ORDER BY
	elevation DESC;