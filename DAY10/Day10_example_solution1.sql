UPDATE film
SET rental_rate = 1.99
WHERE rental_rate = 0.99;

ALTER TABLE customer
ADD COLUMN initials VARCHAR(4);


UPDATE customer
SET initials = LEFT(first_name,1) || '.' || LEFT(last_name,1) || '.'