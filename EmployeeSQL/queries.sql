-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no
	, e.last_name
	, e.first_name
	, e.sex
	, s.salary
FROM
	employees e INNER JOIN salaries s
		ON e.emp_no = s.emp_no
ORDER BY
	e.emp_no


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	first_name
	, last_name
	, hire_date
FROM
	employees
WHERE
	extract(year from hire_date) = 1986
ORDER BY
	hire_date
	
	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	d.dept_no
	, d.dept_name
	, dm.emp_no
	, e.last_name
	, e.first_name
FROM
	departments d INNER JOIN dept_manager dm
		ON d.dept_no = dm.dept_no
	INNER JOIN employees e
		ON dm.emp_no = e.emp_no
ORDER BY
	d.dept_no
	, dm.emp_no


	
