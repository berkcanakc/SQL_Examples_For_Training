SELECT first_name, last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
						FROM payment
						GROUP BY customer_id
						HAVING SUM(amount)>100
					    ORDER BY customer_id)
AND address_id IN(SELECT address_id 
					FROM address
					WHERE district = 'California')
ORDER BY customer_id
