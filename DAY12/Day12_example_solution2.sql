SELECT 
TO_CHAR(book_date, 'Q') AS quarter,
EXTRACT(month FROM book_date) AS month, 
TO_CHAR(book_date, 'W') AS week_in_month,
CAST(book_date AS DATE) as day,
SUM(total_amount)
FROM bookings
GROUP BY
ROLLUP (TO_CHAR(book_date, 'Q'),
EXTRACT(month FROM book_date), 
TO_CHAR(book_date, 'W'),
CAST(book_date AS DATE))
ORDER BY 1,2,3,4