SELECT
    mountain_range,
    peak_name,
    elevation
FROM
    mountains AS m
JOIN
    peaks AS p
ON
    p.mountain_id = m.id
WHERE
    mountain_range LIKE '%Rila%'
ORDER BY
    elevation DESC;