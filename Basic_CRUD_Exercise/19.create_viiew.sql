CREATE VIEW
	view_company_chart
AS
SELECT
	"Full Name",
	"Job Title"
FROM 
	company_chart
WHERE 
	"Manager ID" = 184;
	