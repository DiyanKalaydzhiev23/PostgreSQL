SELECT
	mc.country_code,
	m.mountain_range,
	p.peak_name,
	p.elevation
FROM
	mountains_countries AS mc
JOIN
	mountains AS m
ON
	m.id = mc.mountain_id
JOIN
	peaks AS p
ON
	p.mountain_id = m.id
WHERE
	p.elevation > 2835
		AND
	country_code = 'BG'
ORDER BY
	elevation DESC;
	