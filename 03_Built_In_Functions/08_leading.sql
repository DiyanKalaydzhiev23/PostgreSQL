SELECT
	continent_name,
	TRIM(LEADING FROM continent_name)
-- 	LTRIM(continent_name)
FROM
	continents;