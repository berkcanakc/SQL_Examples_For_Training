CREATE VIEW films_category
AS
(SELECT title, length, name FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE name IN ('Action', 'Comedy')
ORDER BY length DESC)