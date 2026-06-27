SELECT
emp_id,
position_title,
salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM
(
SELECT
*
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
)