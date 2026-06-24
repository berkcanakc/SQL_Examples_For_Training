SELECT *, (SELECT SUM(amount) 
			FROM payment p2
			WHERE p1.customer_id = p2.customer_id),
			(SELECT COUNT(*)
			FROM payment p3
			WHERE p3.customer_id = p1.customer_id)
FROM payment p1
ORDER BY customer_id, amount DESC