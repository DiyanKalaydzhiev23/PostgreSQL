SELECT
	population,
	LENGTH(CAST(population AS VARCHAR))  -- LENGTH(population::text)
FROM 
	countries;