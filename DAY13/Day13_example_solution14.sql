SELECT
emp_id,
position_title,
department,
salary
FROM
(SELECT
*,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) salary_ranking
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id)
WHERE salary_ranking = 1