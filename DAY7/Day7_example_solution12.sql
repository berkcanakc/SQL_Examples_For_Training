SELECT payment_id, amount, (SELECT first_name 
							FROM customer c1
							WHERE c1.customer_id = p1.customer_id)
FROM payment p1
WHERE amount = (SELECT MAX(amount)
				FROM payment p2
				WHERE p1.customer_id = p2.customer_id)
ORDER BY customer_id