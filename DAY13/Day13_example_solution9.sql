SELECT 
emp_id,
salary,
start_date,
SUM(salary) OVER(ORDER BY start_date)as running_total_of_salary
FROM employees