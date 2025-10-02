CREATE TABLE IF NOT EXISTS logs(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	account_id INT,
	old_sum NUMERIC,
	new_sum NUMERIC
);


CREATE OR REPLACE FUNCTION trigger_fn_insert_new_entry_into_logs() 
RETURNS TRIGGER AS
$$
BEGIN
	INSERT INTO
		logs(account_id, old_sum, new_sum)
	VALUES
		(OLD.id, OLD.balance, NEW.balance);
		
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER	
	tr_account_balance_change
AFTER UPDATE OF balance ON accounts
FOR EACH ROW
WHEN 
	(NEW.balance <> OLD.balance)
EXECUTE FUNCTION
	trigger_fn_insert_new_entry_into_logs();
