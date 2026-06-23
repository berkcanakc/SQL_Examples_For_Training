SELECT c.first_name, c.last_name,a.phone, a.district FROM customer c
RIGHT OUTER JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';

SELECT * FROM customer c
RIGHT OUTER JOIN address a
ON c.address_id = a.address_id
WHERE c.customer_id is null