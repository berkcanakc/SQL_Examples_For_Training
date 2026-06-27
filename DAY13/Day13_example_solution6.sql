SELECT position_title, ROUND(AVG(salary),2) as avarage_salary
FROM employees
GROUP BY position_title