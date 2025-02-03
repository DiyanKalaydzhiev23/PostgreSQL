CREATE OR REPLACE FUNCTION fn_courses_by_client(
	phone_num VARCHAR(20)
) RETURNS INT AS 
$$
DECLARE
	num_courses INT;
BEGIN
	SELECT
		COUNT(*)
	INTO
		num_courses
	FROM
		courses AS co
	JOIN
		clients AS cl
	ON
		cl.id = co.client_id
	WHERE
		cl.phone_number = phone_num;
		
	RETURN num_courses;
END;
$$
LANGUAGE plpgsql;