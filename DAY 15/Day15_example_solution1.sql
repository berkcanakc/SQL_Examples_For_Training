CREATE USER mia
WITH PASSWORD 'mia123';

CREATE ROLE analyst_emp;

GRANT USAGE
ON SCHEMA public
TO analyst_emp;

GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO analyst_emp;

GRANT INSERT
ON public.employees
TO analyst_emp;

GRANT UPDATE
ON public.employees
TO analyst_emp;

ALTER ROLE analyst_emp CREATEDB;

GRANT analyst_emp
TO mia