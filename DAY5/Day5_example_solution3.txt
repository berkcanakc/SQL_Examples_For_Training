SELECT
COUNT(*) AS flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN (12, 1, 2) THEN 'Winter'
WHEN EXTRACT(month from scheduled_departure) IN (3, 4, 5) THEN 'Spring'
WHEN EXTRACT(month from scheduled_departure) IN (6, 7, 8) THEN 'Summer'
ELSE 'Fall'
END AS flight_season
FROM flights
GROUP BY flight_season
ORDER BY flights ASC