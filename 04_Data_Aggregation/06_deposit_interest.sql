SELECT
	deposit_group,
	SUM(deposit_interest) AS deposit_interest
FROM
	wizard_deposits
GROUP BY
	deposit_group
ORDER BY
	deposit_interest DESC;