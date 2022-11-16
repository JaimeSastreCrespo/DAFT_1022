CREATE DATABASE RECAP16;
USE RECAP16;

CREATE TABLE IF NOT EXISTS employee( 
	employee_id INT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    salary INT,
    joining_date DATE,
    depart VARCHAR(25)
    );
    
    
INSERT INTO employee (employee_id, first_name, last_name, salary, joining_date , depart )
VALUES  ('1', 'Bob', 'Kinto', '1000000', '2019-01-20', 'Finance'),
		('2', 'Jerry', 'Kansxo', '6000000', '2019-01-15', 'IT'),
        ('3', 'Philip', 'Jose', '8900000', '2019-02-05', 'Insurance'),
		('4', 'John', 'Abraham', '2000000', '2019-02-25' , 'Finance'),
        ('5', 'Michael', 'Mathew', '2200000', '2019-02-28', 'Finance'),
		('6', 'Alex', 'chreketo', '4000000', '2019-05-10', 'IT'),
        ('7', 'Yohan', 'Soso', '1230000', '2019-06-20', 'Banking')
;

-- Get List of unique departments

SELECT DISTINCT depart
FROM employee;

-- Get the first character of “FIRST_NAME” column, concat this character 
-- with Last name to obtain the emails in format: k.ilchenko@company.com

SELECT 
  CONCAT(LOWER(LEFT(first_name, 1)), '.',  LOWER(last_name) , '@company.com') AS emails
FROM employee;

-- Get the position of the letter l in First_name

SELECT POSITION("I" IN First_name) AS position
FROM employee;



