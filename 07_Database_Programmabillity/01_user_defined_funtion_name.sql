CREATE OR REPLACE FUNCTION fn_full_name(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
) RETURNS VARCHAR(101)
AS
$$
BEGIN
	RETURN INITCAP(LOWER(first_name)) || ' ' || INITCAP(LOWER(last_name));
END;
$$
LANGUAGE plpgsql;