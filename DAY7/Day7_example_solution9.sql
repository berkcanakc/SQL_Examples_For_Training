SELECT title, film_id, length, rating
FROM film f1
WHERE length = (SELECT MAX(length)
				FROM film f2
				WHERE f1.rating = f2.rating)