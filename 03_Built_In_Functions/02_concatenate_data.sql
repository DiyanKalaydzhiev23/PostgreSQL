CREATE VIEW
	view_continents_countries_currencies_details
AS
SELECT
	CONCAT(con.continent_name, ': ', con.continent_code) AS continent_details,
	CONCAT_WS(' - ', cou.country_name, cou.capital, cou.area_in_sq_km, 'km2') AS country_information,
	CONCAT(curr.description, ' ', '(', curr.currency_code, ')') AS currencies
FROM 
	continents AS con
JOIN 
	countries as cou
ON 
	con.continent_code = cou.continent_code
JOIN
	currencies AS curr
ON
	curr.currency_code = cou.currency_code
ORDER BY
	country_information ASC,
	currencies ASC;
	
