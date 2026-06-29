BEGIN;
UPDATE employees
SET position_title = 'Head of Sales',
salary = 12587.00
WHERE emp_id = 2;
UPDATE employees
SET position_title = 'Head of BI',
salary = 14614.00
WHERE emp_id = 3;
COMMIT;

SELECT * FROM employees
ORDER BY emp_id