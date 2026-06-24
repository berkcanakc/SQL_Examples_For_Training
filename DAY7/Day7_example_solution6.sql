SELECT ROUND(AVG(daily_amount),2) AS average_daily
FROM(SELECT SUM(amount) AS daily_amount
	FROM payment
	GROUP BY DATE(payment_date)) subquery