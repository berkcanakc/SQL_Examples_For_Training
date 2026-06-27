CREATE TABLE employees
(
emp_id SERIAL PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
job_position VARCHAR(30) NOT NULL,
salary numeric(8,2),
start_date DATE NOT NULL,
birth_date DATE NOT NULL,
store_id INT REFERENCES store(store_id),
department_id INT,
manager_id INT
);

CREATE TABLE departments
(
department_id SERIAL PRIMARY KEY,
department VARCHAR(20) NOT NULL,
division VARCHAR(20) NOT NULL
)