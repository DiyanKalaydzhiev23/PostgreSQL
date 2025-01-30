CREATE OR REPLACE FUNCTION fn_is_word_comprised(
	set_of_letters VARCHAR,
	word VARCHAR
) RETURNS BOOLEAN
AS
$$
BEGIN
	RETURN TRIM(LOWER(word), LOWER(set_of_letters)) = '';
END;
$$
LANGUAGE plpgsql;

-- CREATE OR REPLACE FUNCTION fn_is_word_comprised(
-- 	set_of_letters VARCHAR,
-- 	word VARCHAR
-- ) RETURNS BOOLEAN
-- AS
-- $$
-- DECLARE
-- 	i INT;
-- 	letter CHAR(1);
-- BEGIN
-- 	for i IN 1..LENGTH(word) LOOP
-- 		letter := SUBSTRING(LOWER(word), i, 1); -- in programming like that word[i]
		
-- 		IF POSITION(letter IN LOWER(set_of_letters)) = 0 THEN
-- 			RETURN FALSE;
-- 		END IF;
-- 	END LOOP;
	
-- 	RETURN TRUE;
-- END;
-- $$
-- LANGUAGE plpgsql;
