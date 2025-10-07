CREATE OR REPLACE PROCEDURE mark_student_absent(
  p_student_id INT,
  p_session_id INT
) AS $$
BEGIN

  IF NOT EXISTS (SELECT 1 FROM students WHERE id = p_student_id) THEN
    RAISE EXCEPTION 'Student with id % does not exists.', p_student_id;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM sessions WHERE id = p_session_id) THEN
    RAISE EXCEPTION 'Session with id % does not exists.', p_session_id;
  END IF;

  INSERT INTO
    attendance(student_id, session_id, attended)
  VALUES
    (p_student_id, p_session_id, FALSE)
  ON CONFLICT (student_id, session_id)
  DO UPDATE SET attended = FALSE;
   
END;
$$
LANGUAGE plpgsql;