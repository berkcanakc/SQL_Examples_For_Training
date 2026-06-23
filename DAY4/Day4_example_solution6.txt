SELECT 
EXTRACT(month from payment_date) AS months,
SUM(amount) AS total
FROM payment
GROUP BY months
ORDER BY total DESC;

SELECT 
EXTRACT(DOW from payment_date) AS day_of_week,
SUM(amount) AS total
FROM payment
GROUP BY day_of_week
ORDER BY total DESC;

SELECT 
EXTRACT(week from payment_date) AS weeks,
customer_id,
SUM(amount) AS total
FROM payment
GROUP BY weeks, customer_id
ORDER BY total DESC;