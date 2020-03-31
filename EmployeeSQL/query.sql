--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e
join salaries s
on e.emp_no=s.emp_no;

--2.List employees who were hired in 1986.
select * 
from employees
where hire_date between '1986-01-01' and '1987-01-01';
--or
select *
from employees
where EXTRACT(YEAR from hire_date)=1986;

--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select dm.dept_no, d.dept_name, dm.emp_no, e.last_name, 
e.first_name, dm.from_date, dm.to_date
from dept_manager dm
    join departments d on dm.dept_no=d.dept_no
    join employees e on dm.emp_no=e.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
    join departments d on de.dept_no=d.dept_no
    join employees e on de.emp_no=e.emp_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
select *
from employees
where first_name='Hercules' and last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
    join dept_emp de on de.emp_no=e.emp_no
    join departments d on de.dept_no=d.dept_no
where d.dept_name='Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
    join dept_emp de on de.emp_no=e.emp_no
    join departments d on de.dept_no=d.dept_no
where d.dept_name in ('Sales','Development');

--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as "Number of last names"
from employees
group by last_name
order by "Number of last names" desc;