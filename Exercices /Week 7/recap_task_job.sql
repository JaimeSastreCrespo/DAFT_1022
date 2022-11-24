CREATE DATABASE employee24;

USE employee24;

CREATE TABLE employee (
    Id_emp      INT,
    name_emp  VARCHAR(25),
    performance  INT,
    salary   INT
);


INSERT INTO employee ( Id_emp, name_emp, performance , salary) VALUES
					(1021, 'Mary', 12 , 5000),
                    (1023, 'John', 14 , 5300),
                    (1043, 'Rayan', 21 , 6000),
                    (1047, 'Silver', 34 , 6200),
                    (1054, 'Jerom', 17 , 6000),
					(1061, 'Tom', 49 , 5000)
;

-- TO VIZ
SELECT * 
FROM employee
ORDER BY salary DESC;    

-- FOR BOTH RESULTS BC THEY HAVE THE SAME SALARY
SELECT * 
FROM employee
ORDER BY salary DESC
LIMIT 4,4;


-- FOR ONE UNIQUE RESULT
SELECT * 
FROM employee
ORDER BY salary DESC
LIMIT 1 OFFSET 4;


-- Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments.
--  Output just the absolute difference in salaries.


CREATE TABLE db_employee
		(
		Id INT,
		first_name VARCHAR(20),
		last_name VARCHAR(20),
		salary INT,
		department_id INT
        )
;

CREATE TABLE db_dept
		(
		ID INT,
		Department VARCHAR(20)
        )
;

INSERT INTO db_employee ( Id, first_name, last_name , salary,department_id ) VALUES
					(2568, 'Pipo', 'Finito' , 4000 , 1568),
                    (2569, 'Filipo',  'Tito' ,5000 , 1569),
                    (2565, 'Infinito',  'Polito' ,6000 , 1565),
                    (2564, 'Lito', 'Chiquito' , 8000 , 1569),
                    (2563, 'Tipo', 'Estradito' , 8001 , 1568),
					(2562, 'Manuelito', 'Hijito' , 8002 , 1565)
                    ;
                    
INSERT INTO db_dept (ID, Department) 
		VALUES 
        (1568, 'sales'),
        (1569,'marketing'),
        (1565, 'engineering')
;
        
    
SELECT Abs(e.Salary - m.Salary) as Difference FROM
(SELECT e.Salary FROM db_employee e
LEFT JOIN db_dept d ON d.Id = e.Department_id
WHERE d.Department = 'Marketing'
ORDER BY e.Salary DESC LIMIT 1) m
LEFT JOIN (SELECT e.Salary FROM db_employee e
LEFT JOIN db_dept d ON d.Id = e.Department_id
WHERE d.Department = 'Engineering'
ORDER BY e.Salary DESC LIMIT 1) e ON True;

