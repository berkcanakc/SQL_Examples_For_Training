SELECT
COUNT(*) AS no_of_movies
FROM film
WHERE description LIKE '%Saga%'
AND (title LIKE 'A%' OR title LIKE '%R');

SELECT
*
FROM customer
WHERE first_name LIKE '_A%' 
AND first_name LIKE '%ER%'
ORDER BY last_name DESC;

SELECT
COUNT(*)
FROM payment
WHERE payment_date BETWEEN '2020-05-01' AND '2020-05-02'
AND (amount = 0 OR amount BETWEEN 3.99 AND 7.99)