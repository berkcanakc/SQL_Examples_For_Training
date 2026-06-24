SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id 
			FROM payment
			WHERE DATE(payment_date) = '2020-01-25'
			ORDER BY customer_id ASC)