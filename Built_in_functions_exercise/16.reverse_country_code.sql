UPDATE 
	countries
SET 
	country_code = LOWER(REVERSE(country_code));
