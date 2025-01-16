SELECT
	latitude,
	ROUND(latitude, 2) AS "round",
	TRUNC(latitude, 2) AS "trunc"
FROM
	apartments;