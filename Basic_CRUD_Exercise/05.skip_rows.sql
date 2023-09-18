SELECT 
	id,
	CONCAT_WS(' ',
		first_name,
		middle_name,
		last_name
	) AS "Full Name",
	hire_date AS "Hire Date"
FROM 
	employees
ORDER BY
	hire_date ASC
OFFSET 9; -- offset start from 0; 0 - to 9 are 10 numbers/records