SELECT
LOWER(first_name),
LOWER(last_name),
LOWER(email) FROM customer 
WHERE LENGTH(first_name) > 10
OR LENGTH(last_name) > 10