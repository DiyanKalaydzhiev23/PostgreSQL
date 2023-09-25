CREATE VIEW 
	view_wizard_deposits_with_expiration_date_before_1983_08_17
AS SELECT 
	first_name || ' ' || last_name AS "Wizard Name",
	deposit_start_date AS "Start Date",
	deposit_expiration_date AS "Expiration Date",
	deposit_amount AS "Amount"
FROM 
	wizard_deposits
WHERE 
	deposit_expiration_date <= '1983-08-17'
GROUP BY 
	"Wizard Name",
	deposit_start_date,
	deposit_expiration_date,
	deposit_amount
ORDER BY
	deposit_expiration_date ASC;


-- CREATE VIEW 
-- 	view_wizard_deposits_with_expiration_date_before_1983_08_17
-- AS SELECT DISTINCT
-- 	first_name || ' ' || last_name AS "Wizard Name",
-- 	deposit_start_date AS "Start Date",
-- 	deposit_expiration_date AS "Expiration Date",
-- 	deposit_amount AS "Amount"
-- FROM 
-- 	wizard_deposits
-- WHERE 
-- 	deposit_expiration_date <= '1983-08-17'
-- ORDER BY
-- 	deposit_expiration_date ASC;
