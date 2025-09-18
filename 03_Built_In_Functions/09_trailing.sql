SELECT
	continent_name,
	TRIM(TRAILING FROM continent_name)
--  RTRIM(continent_name)
FROM
	continents;