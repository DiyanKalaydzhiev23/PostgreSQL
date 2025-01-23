ALTER TABLE
	countries_rivers

ADD CONSTRAINT
	fk_countries_rivers_rivers
FOREIGN KEY
	(river_id)
REFERENCES
	rivers(id)
ON UPDATE CASCADE,

ADD CONSTRAINT
	fk_countries_rivers_countries
FOREIGN KEY
	(country_code)
REFERENCES
	countries(country_code)
ON UPDATE CASCADE;
