SELECT first_name, email
FROM customer
WHERE customer_id IN (SELECT customer_id
			FROM payment
			GROUP by customer_id
			HAVING SUM(amount) > 30
			ORDER BY customer_id)