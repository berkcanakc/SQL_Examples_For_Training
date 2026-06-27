UPDATE employees
SET salary=7200, position_title = 'Senior SQL Analyst'
WHERE first_name = 'Jack' AND last_name = 'Franklin';

UPDATE employees
SET position_title = 'Customer Specialist'
WHERE position_title = 'Customer Support';

UPDATE employees
SET salary= salary*1.06
WHERE position_title LIKE ('%SQL Analyst%')

SELECT position_title, ROUND(AVG(salary),2) AS average_salary
FROM
(SELECT 
* 
FROM employees
WHERE position_title = 'SQL Analyst')dnm
GROUP BY position_title