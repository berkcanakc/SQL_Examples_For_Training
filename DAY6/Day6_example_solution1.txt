SELECT 
b.seat_no,
COUNT(*)
FROM seats s
LEFT OUTER JOIN boarding_passes b
ON s.seat_no = b.seat_no
GROUP BY b.seat_no
ORDER BY COUNT(*) DESC