UPDATE
	countries
SET
	iso_code = UPPER(LEFT(country_name, 3)) -- Bulgaria -> Bul -> BUL
WHERE 
	iso_code IS NULL;