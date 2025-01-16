SELECT
	population,
	LENGTH(CAST(population AS VARCHAR)) AS "length"
FROM
	countries;