
SELECT
payment_day,
daily_amount,
LAG(daily_amount) OVER(ORDER BY payment_day) as previous_day,
ROUND((daily_amount - LAG(daily_amount) OVER(ORDER BY payment_day)) /LAG(daily_amount) OVER(ORDER BY payment_day)*100 , 2) AS difference
FROM(
SELECT 
payment_day,
SUM(amount) AS daily_amount
FROM(
SELECT *,
CAST(payment_date AS DATE) AS payment_day
FROM payment
)p1
GROUP BY payment_Day
)