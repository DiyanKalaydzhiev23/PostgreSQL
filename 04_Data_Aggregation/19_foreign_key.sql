CREATE TABLE employees_projects(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	employee_id INT,
	project_id INT,
	
	FOREIGN KEY (employee_id)
	REFERENCES employees(id),
	
	FOREIGN KEY (project_id)
	REFERENCES projects(id)
);