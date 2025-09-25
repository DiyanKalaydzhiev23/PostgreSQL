ALTER TABLE
	countries_rivers

ADD CONSTRAINT 
	countries_countries_rivers_river_id_fkey
FOREIGN KEY
	(river_id)
REFERENCES
	rivers(id)
ON UPDATE CASCADE,

ADD CONSTRAINT 
	countries_countries_rivers_country_code_fkey
FOREIGN KEY
	(country_code)
REFERENCES
	countries(country_code)
ON UPDATE CASCADE;
