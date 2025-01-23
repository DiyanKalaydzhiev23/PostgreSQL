SELECT 
	mountain_range,
	peak_name,
	elevation
FROM
	mountains
JOIN 
	peaks
ON 
	peaks.mountain_id = mountains.id	
WHERE 
	mountain_range = 'Rila'
ORDER BY 
	elevation DESC;