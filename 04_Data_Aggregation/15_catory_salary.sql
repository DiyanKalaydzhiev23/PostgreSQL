SELECT
	job_title,
	CASE
		WHEN AVG(salary) > 45800 THEN 'Good'
		WHEN AVG(salary) < 27500 THEN 'Need Improvement'
		ELSE 'Medium'
	END AS category
FROM
	employees
GROUP BY
	job_title
ORDER BY
	category,
	job_title;