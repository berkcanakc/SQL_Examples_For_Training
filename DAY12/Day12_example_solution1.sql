SELECT 
first_name,
last_name,
staff_id,
SUM(amount)
FROM payment p
INNER JOIN customer c
ON c.customer_id = p.customer_id
GROUP BY
	GROUPING SETS(
	(first_name,last_name,staff_id),
	(first_name,last_name)
	)
ORDER BY first_name, last_name