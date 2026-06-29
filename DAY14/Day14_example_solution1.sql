CREATE FUNCTION name_search (first_name1 VARCHAR(15), last_name1 VARCHAR(15))
RETURNS numeric(5,2)
LANGUAGE plpgsql
AS
$$
DECLARE
total numeric(5,2);
BEGIN
SELECT 
SUM(amount)
INTO total
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
WHERE first_name1 = first_name
AND last_name1 = last_name
GROUP BY first_name, last_name;
RETURN total;
END;
$$

SELECT name_search('AMY','LOPEZ')