SELECT title, replacement_cost, rating, (SELECT ROUND(AVG(replacement_cost),2)
											FROM film f1
											WHERE f1.rating = f2.rating)
FROM film f2
WHERE replacement_cost = (SELECT MAX(replacement_cost)
							FROM film f3
							WHERE f2.rating = f3.rating)
ORDER BY film_id