SELECT 
    event_date,
    SUM(salary_change) OVER(ORDER BY event_date) AS total_salary
FROM (
    SELECT 
        emp_id,
        salary AS salary_change,
        start_date AS event_date
    FROM employees

    UNION ALL

    SELECT 
        emp_id,
        -salary AS salary_change,
        end_date AS event_date
    FROM v_employees_info
    WHERE is_active = 'false'
) a
ORDER BY event_date;