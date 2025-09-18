SELECT
	peak_name,
	LEFT(peak_name, 4) AS positive_left,
	LEFT(peak_name, -4) AS negative_left
FROM
	peaks