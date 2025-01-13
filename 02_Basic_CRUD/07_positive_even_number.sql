SELECT
	CONCAT(number, ' ', street) AS address,
	city_id
FROM
	addresses
WHERE
	city_id > 0
		AND
	city_id % 2 = 0
ORDER BY
	city_id;