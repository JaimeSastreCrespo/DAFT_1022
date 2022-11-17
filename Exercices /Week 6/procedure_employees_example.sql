USE employees_mod;

DELIMITER $$
CREATE PROCEDURE emp()
BEGIN
SELECT * FROM t_employees
LIMIT 1000;
END$$



CALL emp();
