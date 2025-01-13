CREATE VIEW
	view_initials
AS
SELECT
	LEFT(first_name, 2) AS initial,
	last_name
FROM
	employees
ORDER BY
	last_name;


-- SELECT
-- 	SUBSTRING(first_name, 1, 2) AS intial,
-- 	last_name
-- FROM
-- 	employees
-- ORDER BY
-- 	last_name;