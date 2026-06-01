ALTER TABLE 
	countries
ADD CONSTRAINT
	countries_continents_fkey
FOREIGN KEY
	(continent_code)
REFERENCES
	continents(continent_code)
ON DELETE CASCADE;


ALTER TABLE 
	countries
ADD CONSTRAINT
	countries_currencies_fkey
FOREIGN KEY
	(currency_code)
REFERENCES
	currencies(currency_code)
ON DELETE CASCADE;