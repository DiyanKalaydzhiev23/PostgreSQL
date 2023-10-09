CREATE OR REPLACE FUNCTION fn_courses_by_client(
	IN phone_num VARCHAR(20),
	OUT num_of_courses INT
) RETURNS INT AS 
$$
BEGIN
	num_of_courses := (
		SELECT
			COUNT(*)
		FROM
			courses
		JOIN 
			clients
		ON 
			courses.client_id = clients.id
		WHERE
			clients.phone_number = phone_num
	);
END;
$$
LANGUAGE plpgsql;