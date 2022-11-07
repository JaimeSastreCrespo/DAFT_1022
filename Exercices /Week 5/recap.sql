CREATE DATABASE IF NOT EXISTS recap;
USE recap;

CREATE TABLE employees(
	ID INT,
	name_emp VARCHAR(30),
    role_emp VARCHAR(30),
    salary_emp INT
);

INSERT INTO employees(ID, name_emp,role_emp,salary_emp)
VALUES 	('2343', 'Alex','Manager','65000' ), 
		('2344', 'Sandra','IT Specialist','72000' ), 
		('2345', 'Sven','HR','44000' ), 
        ('2346', 'Boris','Economist','47000' )
		;
        
-- Write a query to find all the employees whose salary is between 50000 to 100000.

SELECT name_emp, salary_emp
FROM employees e
WHERE e.salary_emp between 50000 and 100000
;

-- Write a query to find the names of employees that begin with ‘S’

SELECT *
FROM employees
WHERE name_emp LIKE 'S%';
