CREATE TABLE students(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	student_name VARCHAR(50)
);

CREATE TABLE exams(
	id INT GENERATED ALWAYS AS IDENTITY (START WITH 101) PRIMARY KEY,
	exam_name VARCHAR(50)
);

CREATE TABLE study_halls(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	study_hall_name VARCHAR(50),
	exam_id INT REFERENCES exams(id)
);

CREATE TABLE students_exams(
	student_id INT REFERENCES students(id),
	exam_id INT REFERENCES exams(id),

	CONSTRAINT students_exams_pkey
	PRIMARY KEY (student_id, exam_id)
);

INSERT INTO 
	students(student_name)
VALUES
	('Mila'),
	('Toni'),
	('Ron');
	
INSERT INTO 
	exams(exam_name)
VALUES
    ('Python Advanced'),
	('Python OOP'),
	('PostgreSQL');
	
INSERT INTO 
	study_halls(study_hall_name, exam_id)
VALUES
    ('Open Source Hall', 102),
	('Inspiration Hall', 101),
	('Creative Hall', 103),
	('Masterclass Hall', 103),
	('Information Security Hall', 103);
	
INSERT INTO 
	students_exams(student_id, exam_id)
VALUES
    (1, 101),
	(1, 102),
	(2, 101),
	(3, 103), 
	(2, 102),
	(2, 103);