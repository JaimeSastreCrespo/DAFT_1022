CREATE DATABASE M2;
USE M2;


CREATE TABLE IF NOT EXISTS student( 
	student_id INT,
    score INT
    );
    
INSERT INTO student (student_id, score)
VALUES  ('1', '91'),
		('2', '72'),
        ('3', '98'),
        ('4', '62'),
        ('5', '62'),
		('6', '95'),
        ('7', '83'),
        ('8', '86'),
        ('9', '56'),
		('10', '97'),
        ('11', '58'),
        ('12', '71'),
        ('13', '87'),
		('14', '83'),
        ('15', '98')
;

-- Please find MEAN, SUM, STANDARD DEVIATION, VARIANCE, MIN and MAX.

SELECT avg(score) 
FROM M2.student;
-- Mean = 79.93

SELECT sum(score)
FROM M2.student;
-- Sum = 1199

SELECT std(score)
FROM M2.student;
-- Standard deviation = 14.69

SELECT variance(score)
FROM M2.student;
-- Variance = 215.93

SELECT score
FROM M2.student
ORDER BY score
LIMIT 1;
-- MIN = 56

SELECT score
FROM M2.student
ORDER BY score DESC
LIMIT 1;
-- MAX = 98