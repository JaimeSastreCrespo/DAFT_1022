CREATE DATABASE IF NOT EXISTS costco;
USE costco;

CREATE TABLE users(
	name_users VARCHAR(30),
    date_joined DATE,
    PRIMARY KEY (name_users)
);

CREATE TABLE purchases(
	user_name VARCHAR(30),
    date_purchased DATE,
    item VARCHAR(20),
    price FLOAT
);

INSERT INTO users(name_users, date_joined)
VALUES 	('John', '2011-01-01'), 
		('Dave', '2009-04-02'), 
		('Mary', '2008-03-04')
		;
        
INSERT INTO purchases(user_name, date_purchased, item, price)
VALUES 	('John', '2011-02-04', 'SK2341', '34.54'), 
		('John', '2012-01-04', ' LS2414', '94.98')
		;
        
-- 1) What are total expenditures by user (all time)? 
-- What is the total expenditure by item?
-- What fraction of customers have never made a purchase?

SELECT user_name AS name , SUM(price) AS total_expenditures
FROM purchases
GROUP BY user_name
;

SELECT item AS item , SUM(price) AS total_expendituresitem
FROM purchases
GROUP BY item
;

SELECT SUM(t1.value=0)/COUNT(*)*100 as percent_users
FROM (
SELECT u.name_users, COUNT(p.item) AS value
FROM users u
LEFT JOIN purchases p
ON u.name_users = p.user_name
GROUP BY u.name_users
) t1;


-- 2) How would we tell if there’s a seasonal pattern for certain items? 
-- What queries might help us understand any seasonal patterns that exist? 

SELECT t.seasons, COUNT(*) 
FROM ( 
SELECT CASE 
WHEN date between month1 AND month2 then 'Jan' 
WHEN date between month2 AND month3 then 'Feb' 
… else 'Dec' 
end as seasons from purchases) t 
group by t.seasons;



-- Part 2
-- Suppose Costco has another database for tracking employees. 
-- In this database there is a table employees which contains rows 
-- for regular employees as well as managers. 
-- (The values in the manager_id field are the manager’s employee_id; 
-- for example Kate is Henry’s manager.)


-- 1) Write a query that will return a list of all employees and their managers 
-- (listing employees and managers by name).  Include employees with no manager in your list.



CREATE TABLE employees(
	employee_id INT,
    manager_id INT,
    employee_name VARCHAR(20)
);

INSERT INTO employees (employee_id, manager_id, employee_name)
VALUES 	('1', '2', 'Jane'), 
		('2', '3', 'Henry'),
        ('3', null, 'Kate' ) ,
        ('4', '2', 'Moe' ),
        ('5', '2', 'Larry')
		;


SELECT emp.employee_name as employee, manag.employee_name as manager
FROM employees emp
LEFT JOIN employees manag
ON emp.manager_id = manag.employee_id;


-- 2) Suppose there is another table training_details which contains information on the training 
-- sessions attended by an employee, the date of attendance, and their feedback on the training 
-- with a maximum score of 10. Write a query to get a list of employees’ names 
-- who attended more than one training session on the same day. 
-- Please include the names of the training sessions and their dates of attendance.

