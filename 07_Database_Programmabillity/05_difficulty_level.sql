CREATE OR REPLACE FUNCTION fn_difficulty_level(
	level INT
) RETURNS VARCHAR
AS 
$$
DECLARE 
	difficulty_level VARCHAR;
BEGIN
	IF (level <= 40) THEN 
		difficulty_level := 'Normal Difficulty';
	ELSIF (level > 60) THEN 
		difficulty_level := 'Hell Difficulty';
	ELSE	
		difficulty_level := 'Nightmare Difficulty';
	END IF;
	
	RETURN difficulty_level;
END;
$$
LANGUAGE plpgsql;



SELECT
	user_id,
	level,
	cash,
	fn_difficulty_level(level)
FROM
	users_games
ORDER BY
	user_id ASC;





