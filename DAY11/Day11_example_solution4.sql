SELECT *
FROM
(SELECT first_name || ' ' || last_name AS fullname,
country,
DENSE_RANK() OVER(PARTITION BY country ORDER BY payment_count DESC) AS payment_rank,
payment_count
FROM
(
SELECT c.customer_id , 
first_name,
last_name,
address_id,
COUNT(*) AS payment_count
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
) i1
INNER JOIN address a
ON i1.address_id = a.address_id
INNER JOIN city ci
ON ci.city_id = a.city_id
INNER JOIN country co
ON co.country_id = ci.country_id
)
WHERE payment_rank BETWEEN 1 AND 3