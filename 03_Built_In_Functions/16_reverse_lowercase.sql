UPDATE
	countries
SET
	country_code = LOWER(REVERSE(country_code)); -- AD -> DA -> da