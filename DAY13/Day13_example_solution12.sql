SELECT
division,
department,
position_title,
SUM(salary),
COUNT(emp_id),
ROUND(AVG(salary),2)
FROM
(
SELECT
* 
FROM employees e
INNER JOIN departments d
ON d.department_id = e.department_id
)
GROUP BY
	ROLLUP(1,2,3)
ORDER BY 1,2,3
