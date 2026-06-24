SELECT
title,
CASE
WHEN rating = 'PG' OR rating = 'PG-13' OR length > 210 THEN 'Great rating or long (Tier1)'
WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier2)'
WHEN description LIKE '%Drama%' AND length <= 90 THEN 'Short drama (tier3)'
WHEN rental_rate < 1 THEN 'Very cheap (tier 4)'
END AS rating
FROM film
WHERE 
CASE
WHEN rating = 'PG' OR rating = 'PG-13' OR length > 210 THEN 'Great rating or long (Tier1)'
WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier2)'
WHEN description LIKE '%Drama%' AND length <= 90 THEN 'Short drama (tier3)'
WHEN rental_rate < 1 THEN 'Very cheap (tier 4)'
END is not null