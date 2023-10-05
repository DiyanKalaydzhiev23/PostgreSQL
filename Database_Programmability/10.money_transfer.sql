CREATE OR REPLACE PROCEDURE sp_transfer_money (
	sender_id INT,
	receiver_id INT,
	amount NUMERIC
) AS 
$$
DECLARE 
	current_balance NUMERIC;
BEGIN
	CALL sp_withdraw_money(sender_id, amount);
	CALL sp_deposit_money(receiver_id, amount);
	
	SELECT balance INTO current_balance FROM accounts WHERE id = sender_id;
	
	IF (current_balance < 0) THEN
		ROLLBACK;
	END IF;
END;
$$
LANGUAGE plpgsql;