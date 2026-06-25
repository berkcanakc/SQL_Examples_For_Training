CREATE TABLE customer_spendings
AS
(
SELECT
first_name || ' ' || last_name AS name,
SUM(amount) AS total_amount
FROM customer c
INNER JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY name
ORDER BY 2 ASC
)
