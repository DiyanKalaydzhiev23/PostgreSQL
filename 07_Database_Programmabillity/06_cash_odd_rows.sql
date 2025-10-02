CREATE OR REPLACE FUNCTION fn_cash_in_users_games(
	game_name VARCHAR(50)
) RETURNS TABLE (
	total_cash NUMERIC
)
AS 
$$
BEGIN
	RETURN QUERY
	WITH 
		ranked_game_rows
	AS (
		SELECT 
			cash,
			ROW_NUMBER() OVER (ORDER BY cash DESC)
		FROM
			games AS g
		JOIN
			users_games AS ug
		ON
			ug.game_id = g.id
		WHERE 
			g.name = game_name
	)
	
	SELECT	
		ROUND(SUM(cash), 2) AS total_cash
	FROM	
		ranked_game_rows
	WHERE
		row_number % 2 <> 0;
END;
$$
LANGUAGE plpgsql;
