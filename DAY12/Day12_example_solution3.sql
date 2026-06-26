SELECT
customer_id,
dates,
title,
SUM(amount) AS total_amount
FROM(
SELECT p.customer_id, 
DATE(payment_date) as dates, 
title, 
amount 
FROM payment p
INNER JOIN rental r
ON r.rental_id = p.rental_id
INNER JOIN inventory i
ON i.inventory_id = r.inventory_id
INNER JOIN film f
ON f.film_id = i.film_id
)
GROUP BY
CUBE(1,2,3)
ORDER BY 1,2,3