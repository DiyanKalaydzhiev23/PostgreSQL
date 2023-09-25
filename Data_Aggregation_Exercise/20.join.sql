SELECT 
	*
FROM 
	departments
JOIN 
	employees 
ON 
	departments.id = employees.department_id;