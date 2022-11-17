USE employees_mod;

CALL emp();

DELIMITER $$
CREATE PROCEDURE sal_avg()
BEGIN
SELECT AVG(salary)
	FROM t_salaries;
END$$



CALL sal_avg();

