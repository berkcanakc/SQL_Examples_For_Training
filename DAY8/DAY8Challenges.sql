--A1
SELECT DISTINCT replacement_cost FROM film
ORDER BY replacement_cost DESC;

--A2
SELECT COUNT(*),
CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END AS replacement_group
FROM film
GROUP BY replacement_group;

--A3
SELECT title, length, c.name 
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name = 'Drama' OR c.name = 'Sports'
ORDER BY length DESC;

--A4
SELECT COUNT(*), c.name 
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY COUNT(*) DESC;

--A5
SELECT COUNT(*), first_name, last_name
FROM film f
INNER JOIN film_actor fa
ON fa.film_id = f.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC;

--A6
SELECT * FROM address a
LEFT JOIN customer c
ON a.address_id = c.address_id
WHERE c.customer_id is NULL;

--A7
SELECT city, SUM(amount), COUNT(*) FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY ci.city
ORDER BY 2 DESC;

--A8

SELECT country || ', ' || city AS country_city, SUM(amount) 
FROM country co
JOIN city ci
ON ci.country_id = co.country_id
JOIN address a
ON a.city_id = ci.city_id
JOIN customer c
ON c.address_id = a.address_id
JOIN payment p
ON p.customer_id = c.customer_id
GROUP BY 1
ORDER BY 2 ASC;

--A9
SELECT staff_id, AVG(total)
FROM (SELECT staff_id, customer_id, SUM(amount) total
FROM payment
GROUP BY staff_id, customer_id) AS summ
GROUP BY staff_id;

--A10
SELECT ROUND(AVG(total),2) 
FROM (SELECT SUM(amount) AS total, DATE(payment_date) FROM payment
WHERE EXTRACT(DOW from payment_date) = 0
GROUP BY DATE(payment_date))AS sundays;

--A11
SELECT title, length, replacement_cost
FROM film f1
WHERE length > (SELECT ROUND(AVG(length),2) as average_length 
				FROM film f2
				WHERE f1.replacement_cost = f2.replacement_cost
				GROUP BY replacement_cost)
ORDER BY length ASC;

--A12
SELECT district, ROUND(AVG(total),2)
FROM
(SELECT customer_id, SUM(amount) AS total
FROM payment p
GROUP BY customer_id) as sq
INNER JOIN customer c
ON c.customer_id = sq.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
GROUP BY district
ORDER BY ROUND(AVG(total),2) DESC;

--A13
SELECT payment_id, amount, c.name, (SELECT SUM(amount)
									FROM payment p2
									INNER JOIN rental r2
									ON p2.rental_id = r2.rental_id
									INNER JOIN inventory i2
									ON i2.inventory_id = r2.inventory_id
									INNER JOIN film_category fc2
									ON fc2.film_id = i2.film_id
									INNER JOIN category c2
									ON c2.category_id = fc2.category_id
									WHERE c.category_id = c2.category_id) AS categor_total
FROM payment p 
INNER JOIN rental r
ON p.rental_id = r.rental_id
INNER JOIN inventory i
ON i.inventory_id = r.inventory_id
INNER JOIN film_category fc
ON fc.film_id = i.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
ORDER BY 3 ASC,1 ASC;

--14
SELECT
title,
name,
SUM(amount) as total
FROM payment p
LEFT JOIN rental r
ON r.rental_id=p.rental_id
LEFT JOIN inventory i
ON i.inventory_id=r.inventory_id
LEFT JOIN film f
ON f.film_id=i.film_id
LEFT JOIN film_category fc
ON fc.film_id=f.film_id
LEFT JOIN category c
ON c.category_id=fc.category_id
GROUP BY name,title
HAVING SUM(amount) =     (SELECT MAX(total)
			  FROM 
                                (SELECT
			          title,
                                  name,
			          SUM(amount) as total
			          FROM payment p
			          LEFT JOIN rental r
			          ON r.rental_id=p.rental_id
			          LEFT JOIN inventory i
			          ON i.inventory_id=r.inventory_id
				  LEFT JOIN film f
				  ON f.film_id=i.film_id
				  LEFT JOIN film_category fc
				  ON fc.film_id=f.film_id
				  LEFT JOIN category c1
				  ON c1.category_id=fc.category_id
				  GROUP BY name,title) sub
			   WHERE c.name=sub.name)





