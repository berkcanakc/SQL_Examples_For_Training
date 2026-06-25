SELECT f.film_id, title, length, 
ROUND(AVG(length) OVER (PARTITION BY c.name),2) AS average_by_cat,
c.name FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
ORDER BY film_id