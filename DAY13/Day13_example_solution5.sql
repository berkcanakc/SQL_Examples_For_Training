SELECT
e1.*,
CASE WHEN e1.end_date IS NULL THEN 'true'
ELSE 'false' 
END as is_active,
e2.first_name ||' '|| e2.last_name AS manager_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;

CREATE VIEW v_employees_info
AS
SELECT
e1.*,
CASE WHEN e1.end_date IS NULL THEN 'true'
ELSE 'false' 
END as is_active,
e2.first_name ||' '|| e2.last_name AS manager_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;