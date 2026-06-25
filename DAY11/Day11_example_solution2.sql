SELECT 
*, 
COUNT(*) OVER(PARTITION BY customer_id) AS number_of_payments, 
SUM(amount) OVER(PARTITION BY customer_id) AS total_amount 
FROM payment