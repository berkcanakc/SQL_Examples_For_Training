SELECT cu.first_name, cu.last_name, cu.email, co.country FROM customer cu
INNER JOIN address a
ON cu.address_id = a.address_id
INNER JOIN city ci
ON ci.city_id = a.city_id
INNER JOIN country co
ON ci.country_id = co.country_id
WHERE co.country = 'Brazil'