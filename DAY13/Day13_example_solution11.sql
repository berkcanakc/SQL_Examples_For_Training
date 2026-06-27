SELECT
first_name,
position_title,
salary
FROM
(
SELECT
*,
RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS salary_rank
FROM employees
)
WHERE salary_rank = 1
ORDER BY salary DESC;

SELECT
first_name,
position_title,
salary,
avg_in_pos
FROM
(
SELECT
*,
RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS salary_rank,
ROUND(AVG(salary) OVER(PARTITION BY position_title),2) as avg_in_pos
FROM employees
)
WHERE salary_rank = 1
ORDER BY salary DESC;

SELECT
first_name,
position_title,
salary,
avg_in_pos
FROM
(
SELECT
*,
RANK() OVER(PARTITION BY position_title ORDER BY salary DESC) AS salary_rank,
ROUND(AVG(salary) OVER(PARTITION BY position_title),2) as avg_in_pos
FROM employees
)
WHERE salary_rank = 1
AND avg_in_pos <> salary
ORDER BY salary DESC