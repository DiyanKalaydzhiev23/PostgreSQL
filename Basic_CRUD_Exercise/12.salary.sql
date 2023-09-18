SELECT
	CONCAT(
		first_name, 
		' ', 
		last_name
	) AS "Full Name",
	job_title,
	salary
FROM 
	employees
WHERE 
	salary IN (12500, 14000, 23600, 25000)
ORDER BY
	salary DESC;