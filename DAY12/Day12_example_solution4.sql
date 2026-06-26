SELECT
f1.title,
f2.title,
f1.length
FROM film f1
INNER JOIN film f2
ON f1.length = f2.length
AND f1.title <> f2.title
ORDER BY 3 DESC