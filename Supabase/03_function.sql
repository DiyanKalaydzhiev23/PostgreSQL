CREATE OR REPLACE FUNCTION get_absecnce_students_by_session_id(
  session_id INT
) RETURNS TABLE (
  name TEXT
)
AS
$$
BEGIN 
  RETURN QUERY 
  SELECT
    s.name
  FROM 
    absences AS a
  JOIN
    students AS s
  ON
    a.student_id = s.id
  WHERE 
    a.session_id = get_absecnce_students_by_session_id.session_id;
END;
$$
LANGUAGE plpgsql;