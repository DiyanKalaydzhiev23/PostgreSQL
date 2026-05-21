SELECT
	LTRIM(peak_name, 'M') AS left_trim,
	RTRIM(peak_name, 'm') AS right_trim
FROM
	peaks;