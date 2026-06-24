SELECT title, film_id, replacement_cost, rating 
FROM film f1
WHERE replacement_cost = (SELECT MIN(replacement_cost)
							FROM film f2
							WHERE f1.rating=f2.rating);
