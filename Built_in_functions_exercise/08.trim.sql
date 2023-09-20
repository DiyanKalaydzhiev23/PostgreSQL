SELECT 
	continent_name,
	TRIM(LEADING FROM continent_name) AS "trim"
FROM 
	continents;


-- both are the same

-- SELECT 
-- 	continent_name,
-- 	LTRIM(continent_name) AS "trim"
-- FROM 
-- 	continents;