
-- Data Analysis

-- Listing the employee number, last name, first name, sex, 
-- and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees e
JOIN salaries s on e.emp_no=s.emp_no;

-- Listing the first name, last name, and hire date for 
-- the employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';

-- Listing the manager of each department along with their 
-- department number, department name, employee number, 
-- last name, and first name
 
CREATE VIEW manager_info AS
SELECT dm.dept_no, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no=e.emp_no;

SELECT mi.dept_no, d.dept_name, mi.emp_no, mi.last_name, mi.first_name 
FROM manager_info mi
JOIN departments d ON mi.dept_no=d.dept_no;

-- Listing the department number for each employee along 
-- with that employee’s employee number, last name, 
-- first name, and department name
CREATE VIEW employee_dep AS
SELECT de.dept_no, d.dept_name, de.emp_no
FROM dept_emp de
JOIN departments d ON de.dept_no=d.dept_no;

CREATE VIEW employees_list AS
SELECT ed.dept_no, ed.dept_name, ed.emp_no, e.last_name, 
e.first_name
FROM employee_dep ed
JOIN employees e on ed.emp_no=e.emp_no;
---------------------------
-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins
-- with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- List each employee in the Sales department, including 
-- their employee number, last name, and first name
SELECT emp_no, last_name, first_name FROM employees_list
WHERE dept_name = 'Sales';

--Listing each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, 
-- and department name 
SELECT emp_no, last_name, first_name, dept_name FROM employees_list
WHERE dept_name = 'Sales'
	  OR dept_name = 'Development'
ORDER BY dept_name;

-- Listing the frequency counts, in descending order, 
-- of all the employee last names
SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;






