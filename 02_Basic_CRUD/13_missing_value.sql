SELECT
	id,
	first_name,
	last_name
FROM
	employees
WHERE
	middle_name IS NULL
LIMIT 3;