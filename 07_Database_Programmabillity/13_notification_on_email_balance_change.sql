CREATE TABLE IF NOT EXISTS notification_emails(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	recipient_id INT,
	subject VARCHAR,
	body TEXT
);

CREATE OR REPLACE FUNCTION trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER AS
$$
BEGIN
	INSERT INTO
		notification_emails(recipient_id, subject, body)
	VALUES
		(
			NEW.account_id,
			'Balance change for account: ' || NEW.account_id,
			'On ' || DATE(NOW()) || ' your balance was changed from ' || NEW.old_sum || ' to ' || NEW.new_sum || '.'
		);
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER
	tr_send_email_on_balance_change
AFTER UPDATE ON
	logs
FOR EACH ROW
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change();
