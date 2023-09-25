SELECT 
	last_name,
	COUNT(notes) AS "Notes with Dumbledore"
FROM 
	wizard_deposits
WHERE 
	notes LIKE '%Dumbledore%'
GROUP BY 
	last_name;
