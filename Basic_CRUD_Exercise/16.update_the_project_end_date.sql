UPDATE 
	projects
SET 
	end_date = start_date + INTERVAL '5 months'
WHERE 
	end_date IS NULL;
