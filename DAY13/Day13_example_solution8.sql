SELECT 
emp_id,
first_name,
last_name,
position_title,
salary,
ROUND(AVG(salary)OVER(PARTITION BY position_title),2) as avg_position_sal
FROM employees
ORDER BY emp_id;

SELECT 
COUNT(*)
FROM(
SELECT 
emp_id,
first_name,
last_name,
position_title,
salary,
ROUND(AVG(salary)OVER(PARTITION BY position_title),2) as avg_position_sal
FROM employees
ORDER BY emp_id) subq
WHERE salary < avg_position_sal