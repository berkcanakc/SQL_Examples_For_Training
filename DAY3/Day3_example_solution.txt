SELECT
DATE(payment_date),
customer_id,
ROUND(AVG(amount),2) as average_amount
FROM payment
WHERE amount != 0 AND DATE(payment_date) BETWEEN '2020-04-28' AND '2020-05-01'
GROUP BY DATE(payment_date), customer_id
HAVING COUNT(*) > 1
ORDER BY AVG(amount) DESC