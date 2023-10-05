CREATE OR REPLACE FUNCTION fn_calculate_future_value (
	initial_sum DECIMAL,
	yearly_interest_rate DECIMAL,
	number_of_years INT
) RETURNS DECIMAL
AS 
$$
BEGIN
	RETURN TRUNC(
		initial_sum * POWER(1 + yearly_interest_rate, number_of_years),
		4
	);
END;
$$
LANGUAGE plpgsql;