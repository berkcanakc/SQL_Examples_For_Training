SELECT COUNT(*), s.fare_conditions FROM boarding_passes b
INNER JOIN flights f
ON f.flight_id = b.flight_id
INNER JOIN seats s
ON b.seat_no = s.seat_no AND f.aircraft_code = s.aircraft_code
GROUP BY s.fare_conditions
ORDER BY COUNT(*) DESC
