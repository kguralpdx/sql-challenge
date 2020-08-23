-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS departments
(
    dept_no CHARACTER(4) NOT NULL UNIQUE,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(dept_no)
);

CREATE TABLE IF NOT EXISTS titles
(
    title_id CHARACTER(5) NOT NULL UNIQUE,
    title VARCHAR(50) NOT NULL,
    PRIMARY KEY(title_id)
);

CREATE TABLE IF NOT EXISTS salaries
(
    emp_no INTEGER NOT NULL UNIQUE,
    salary INTEGER NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS employees
(
    emp_no INTEGER NOT NULL UNIQUE,
    emp_title_id CHARACTER(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex CHARACTER(1) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(emp_no)
);

CREATE TABLE IF NOT EXISTS dept_emp
(
    emp_no INTEGER NOT NULL,
    dept_no CHARACTER(4) NOT NULL,
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE IF NOT EXISTS dept_manager
(
    dept_no CHARACTER(4) NOT NULL,
    emp_no INTEGER NOT NULL,
    PRIMARY KEY(dept_no, emp_no)
);

--****Load the data into the tables****
/* Load in the following order:
	departments
	salaries
	titles
	employees
	dept_emp
	dept_manager
*/

-- Create FKs 
ALTER TABLE employees
    ADD CONSTRAINT FK_salaries_employees_ref
    FOREIGN KEY (emp_no)
    REFERENCES salaries(emp_no)
    MATCH SIMPLE
;
    
ALTER TABLE employees
    ADD CONSTRAINT FK_titles_employees_ref
    FOREIGN KEY (emp_title_id)
    REFERENCES titles(title_id)
    MATCH SIMPLE
;

ALTER TABLE dept_emp
    ADD CONSTRAINT FK_departments_dept_emp_ref
    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_emp
    ADD CONSTRAINT FK_employees_dept_emp_ref
    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
  
ALTER TABLE dept_manager
    ADD CONSTRAINT FK_departments_dept_manager_ref
    FOREIGN KEY (dept_no)
    REFERENCES departments(dept_no)
    MATCH SIMPLE
;
    
ALTER TABLE dept_manager
    ADD CONSTRAINT FK_employees_dept_manager_ref
    FOREIGN KEY (emp_no)
    REFERENCES employees(emp_no)
    MATCH SIMPLE
;
    

-- Create Indexes
CREATE INDEX PK_dept_no_idx ON departments (dept_no);
CREATE INDEX PK_title_id_idx ON titles (title_id);
CREATE INDEX PK_salaries_emp_no_idx ON salaries (emp_no);
CREATE INDEX PK_employees_emp_no_idx ON employees (emp_no);
CREATE INDEX FK_emp_title_id_idx ON employees (emp_title_id);
