CREATE OR REPLACE VIEW 
	view_river_info
AS
SELECT
	CONCAT_WS(' ',
		'The river', 
		river_name,
		'flows into the', 
		outflow, 
		'and is',
		"length",
		'kilometers long.'
	) AS "River Information"
FROM 
	rivers
ORDER BY 
	river_name;