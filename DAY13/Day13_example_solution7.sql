SELECT
division, ROUND(AVG(salary),2) AS avarage_salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY division