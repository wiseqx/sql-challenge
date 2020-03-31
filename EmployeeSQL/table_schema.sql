-- Data Engineering
-- Drop Tables if Existing
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;

--Data Engineering
--Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
CREATE TABLE departments (
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL
);

ALTER TABLE departments ADD CONSTRAINT departments_pk PRIMARY KEY (dept_no);


CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY (emp_no);
ALTER TABLE  employees ADD CHECK (gender in ('M','F'));

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

ALTER TABLE dept_emp ADD CONSTRAINT dept_emp_pk PRIMARY KEY (emp_no, dept_no);
ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT FK_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);


CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);
ALTER TABLE dept_manager ADD CONSTRAINT dept_manager_pk PRIMARY KEY (emp_no, dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT FK_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);
ALTER TABLE dept_manager ADD CONSTRAINT FK_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);


CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);
ALTER TABLE salaries ADD CONSTRAINT salaries_pk PRIMARY KEY (emp_no);
ALTER TABLE salaries ADD CONSTRAINT FK_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);


CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

ALTER TABLE titles ADD CONSTRAINT titles_pk PRIMARY KEY (emp_no, from_date);
ALTER TABLE titles ADD CONSTRAINT FK_titles_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

