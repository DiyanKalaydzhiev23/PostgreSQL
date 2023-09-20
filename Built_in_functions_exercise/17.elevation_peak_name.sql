SELECT 
	CONCAT_WS(' ',
		elevation,
		REPEAT('-', 3) || REPEAT('>', 2),
		peak_name
	) AS "Elevation -->> Peak Name"
FROM 
	peaks
WHERE 
	elevation >= 4884;