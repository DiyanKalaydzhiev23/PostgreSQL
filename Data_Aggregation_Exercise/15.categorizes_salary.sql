SELECT 
	job_title,
	CASE 
		WHEN AVG(salary) > 45800 THEN 'Good'
		WHEN AVG(salary) BETWEEN 27500 AND 45800 THEN 'Medium'
		WHEN AVG(salary) < 27500 THEN 'Need Improvement'
	END AS "Category"
FROM 
	employees
GROUP BY 
	job_title
ORDER BY
	"Category" ASC,
	job_title ASC;