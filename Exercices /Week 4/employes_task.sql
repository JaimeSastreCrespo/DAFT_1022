-- 1. Select the information from the “dept_no” column of the “departments” table. Select all data from the “departments” table.

USE employees;

SELECT dept_no
FROM departments;

SELECT *
FROM departments;


-- 2. Select all people from the “employees” table whose first name is “Elvis”. 
  SELECT * FROM employees WHERE first_name='Elvis';


-- 3. Retrieve a list with all female employees whose first name is Kellie. 
 SELECT * 
 FROM employees
 WHERE first_name='Kellie' and gender ='F';

-- 4. Retrieve a list with all employees whose first name is either Kellie or Aruna.
 SELECT * 
 FROM employees
 WHERE first_name='Kellie' or first_name ='Aruna';

-- 5.  Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT *
FROM employees
WHERE first_name IN ('Denis' , 'Elvis');

-- 6. Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.

SELECT *
FROM employees
EXCEPT
SELECT *
FROM employees
WHERE first_name IN ('John' , 'Mark', 'Jacob');

-- 7. Extract all individuals from the ‘employees’ table whose first name contains “Jack”.
SELECT * 
 FROM employees 
 WHERE first_name LIKE '%Jack%';
 
-- 8. Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
-- Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
-- Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT *
FROM salaries s
INNER JOIN dept_emp de
ON s.emp_no = de.emp_no
INNER JOIN departments dep
ON de.dept_no = dep.dept_no
WHERE salary BETWEEN 66000 AND 70000
AND de.dept_no IN ('d003', 'd006')
AND de.emp_no NOT BETWEEN 10004 AND 10012;
     
-- 9. Select the names of all departments whose department number value is not null.

SELECT dept_name 
FROM departments
WHERE dept_no IS NOT NULL;


-- 10 Retrieve a list with data about all female employees who were hired in the year 2000 or after.
-- Hint: If you solve the task correctly, SQL should return 7 rows.
-- Extract a list with all employees’ salaries higher than $150,000 per annum.
-- Obtain a list with all different “hire dates” from the “employees” table.
-- Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output
-- rows displayed back to the default of 1000.
-- In the next lecture, we will show you how to manipulate the limit rows count. 
-- select col1+col2 
-- select sum(col1)
SELECT *
FROM employees
 WHERE YEAR(hire_date) >= 2000 and gender ='F';
 
 -- Extract a list with all employees’ salaries higher than $150,000 per annum.
 SELECT s.emp_no, e.first_name, e.last_name
FROM salaries s
INNER JOIN employees e
ON s.emp_no = e.emp_no
 WHERE s.salary > 150000;
 
 -- Obtain a list with all different “hire dates” from the “employees” table.
 SELECT DISTINCT(hire_date)
 FROM employees;

-- Expand this list and click on “Limit to 1000 rows”. This way you will set the limit of output rows displayed back to the default of 1000.
 SELECT DISTINCT(hire_date)
 FROM employees
 LIMIT 1000;
