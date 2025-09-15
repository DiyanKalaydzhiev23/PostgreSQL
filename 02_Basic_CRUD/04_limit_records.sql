SELECT 
	id,
	CONCAT(first_name, ' ', last_name) AS full_name,
	job_title
FROM 
	employees
ORDER BY
	first_name ASC
LIMIT 50;