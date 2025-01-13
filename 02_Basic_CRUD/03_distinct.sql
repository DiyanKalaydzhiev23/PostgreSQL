SELECT DISTINCT ON (name) 
	name,
	area AS area_km2
FROM
	cities
ORDER BY
	name DESC;