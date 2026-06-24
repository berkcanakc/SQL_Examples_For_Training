SELECT
COUNT(*),
CASE
WHEN total_amount < 20000 THEN 'Low price ticket'
WHEN total_amount < 150000 THEN 'Mid price ticket'
ELSE 'High price ticket'
END AS price_range
FROM bookings
GROUP BY price_range
ORDER BY COUNT(*) DESC