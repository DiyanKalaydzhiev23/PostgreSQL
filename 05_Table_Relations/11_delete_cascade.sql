ALTER TABLE
	countries
ADD CONSTRAINT
	continents_countries_fkey
FOREIGN KEY
	(continent_code)
REFERENCES
	continents(continent_code)
ON DELETE CASCADE;

ALTER TABLE
	countries
ADD CONSTRAINT
	currencies_countries_fkey
FOREIGN KEY
	(currency_code)
REFERENCES
	currencies(currency_code)
ON DELETE CASCADE;