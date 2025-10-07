ALTER TABLE 
  absences
ADD CONSTRAINT absences_students_fk FOREIGN KEY (student_id) REFERENCES students(id),
ADD CONSTRAINT absences_sessions_fk FOREIGN KEY (session_id) REFERENCES sessions(id);