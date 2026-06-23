SELECT 
COUNT(*),
SUBSTRING(b.seat_no, LENGTH(b.seat_no)) AS seat_line
FROM seats s
LEFT OUTER JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY SUBSTRING(b.seat_no,LENGTH(b.seat_no))
ORDER BY COUNT(*) DESC;