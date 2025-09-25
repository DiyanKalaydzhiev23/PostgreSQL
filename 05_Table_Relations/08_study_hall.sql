CREATE TABLE IF NOT EXISTS students(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	student_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS exams(
	id INT GENERATED ALWAYS AS IDENTITY (START WITH 101 INCREMENT BY 1) PRIMARY KEY,
	exam_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS study_halls(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	study_hall_name VARCHAR(50),
	exam_id INT REFERENCES exams(id)
);


CREATE TABLE IF NOT EXISTS students_exams(
	student_id INT REFERENCES students(id),
	exam_id INT REFERENCES exams(id)
);


-- Insert into students
INSERT INTO students (student_name) VALUES
('Mila'),
('Toni'),
('Ron');


-- Insert into exams
INSERT INTO exams (exam_name) VALUES
('Python Advanced'),
('Python OOP'),
('PostgreSQL');

-- Insert into students_exams
INSERT INTO students_exams (student_id, exam_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

-- Insert into study_halls
INSERT INTO study_halls (study_hall_name, exam_id) VALUES
('Open Source Hall', 102),
('Inspiration Hall', 101),
('Creative Hall', 103),
('Masterclass Hall', 103),
('Information Security Hall', 103);

