CREATE TABLE employees_projects(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INT REFERENCES employees(id),
    project_id INT REFERENCES projects(id)
)