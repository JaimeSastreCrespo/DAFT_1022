CREATE DATABASE recap28;

USE recap28;

CREATE TABLE employee (
    Id_emp      INT,
    name_emp  VARCHAR(25),
    salary   INT
);

INSERT INTO employee ( Id_emp, name_emp , salary) VALUES
					(1, 'Harpreet', 20000),
                    (2, 'John', 30000),
                    (3, 'Ted',10000),
                    (4, 'John', 30000),
                    (5, 'Harpreet', 20000),
					(6, 'Tim', 10000)
;


-- Delete the duplicate data, leaving the first observation (from duplicates)

CREATE TABLE dupl_empl LIKE employee;

INSERT INTO dupl_empl SELECT * FROM employee;

DELETE n1 FROM employee n1, dupl_empl  n2 
WHERE n1.Id_emp > n2.Id_emp AND n1.name_emp= n2.name_emp;

SELECT * FROM employee;

Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
