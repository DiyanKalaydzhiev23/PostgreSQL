CREATE VIEW 
	view_addresses
AS
SELECT 
	e.first_name || ' ' || e.last_name AS "Full Name",
	e.department_id,
	a.number || ' ' || a.street AS "Address"
FROM 
	employees AS e
JOIN 
	addresses AS a
		ON 
	e.address_id = a.id
ORDER BY 
	"Address" ASC;