SELECT
	name, 
	start_date
FROM 
	projects
WHERE
	name LIKE 'MOUNT%'
ORDER BY
	id ASC;