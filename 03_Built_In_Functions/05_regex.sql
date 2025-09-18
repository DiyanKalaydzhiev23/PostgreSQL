SELECT
	(REGEXP_MATCHES("River Information", '([0-9]{1,4})'))[1]
	-- SUBSTRING("River Information", '([0-9]{1,4})')
FROM
	view_river_info;