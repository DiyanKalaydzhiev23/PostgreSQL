SELECT
	continent_name,
	TRIM(TRAILING FROM continent_name) AS "trim"
    -- RTRIM(continent_name) AS "trim"  option 2
FROM
	continents;