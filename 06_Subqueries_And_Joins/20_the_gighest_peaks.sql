WITH 
	results
AS (
	SELECT
		c.country_name,
		COALESCE(p.peak_name, '(no highest peak)') AS highest_peak_name,
		COALESCE(p.elevation, 0) AS highest_peak_elevation,
		COALESCE(m.mountain_range, '(no mountain)') AS mountain,
		ROW_NUMBER() OVER (PARTITION BY c.country_name ORDER BY p.elevation DESC) AS row_num
	FROM
		countries AS c
	LEFT JOIN
		mountains_countries AS mc
	USING
		(country_code)
	LEFT JOIN
		peaks AS p
	USING
		(mountain_id)
	LEFT JOIN
		mountains AS m
	ON
		m.id = p.mountain_id
)


SELECT
	country_name,
	highest_peak_name,
	highest_peak_elevation,
	mountain
FROM 
	results
WHERE 
	row_num = 1
ORDER BY
	country_name ASC,
	highest_peak_elevation DESC;



