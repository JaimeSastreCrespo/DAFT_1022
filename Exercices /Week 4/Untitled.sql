USE small_querie;

INSERT INTO school (school_id, school_name, city)
VALUES  ('1', 'Stanford', 'Stanford'),
		('2', 'University of Cali ', 'San Francisco'),
        ('3', 'Harvard University ', 'New York '),
        ('4', 'MIT', 'Boston'),
        ('5', 'Yale', 'New Haven')
;

CREATE TABLE IF NOT EXISTS student( 
	student_id INT,
    student_name VARCHAR(25),
    city VARCHAR(25),
    school_id INT
    );
    
INSERT INTO student (student_id, student_name, city, school_id)
VALUES  ('1001', 'Peter Brebec', 'New York', '1'),
		('1002', 'John Goorgy ', 'San Francisco', '2'),
        ('2003', 'Brad Smith', 'New York', '3'),
        ('1004', 'Fabian Johns', 'Boston', '5'),
        ('1005', 'Brad Cameron', 'Stanford', '1'),
        ('1006', 'Geoff Firby', 'Boston', '5'),
        ('1007', 'Johnny Blue', 'New Haven', '2'),
        ('1008', 'Johse Brook', 'Miami', '2')
;

-- Write an SQL statement that lists school names, student 
-- names, and their cities only if the school and the 
-- student are in the same city and the student is not from New York.

SELECT s.school_name,st.student_name,st.city
FROM school s
LEFT JOIN student st
ON s.school_id = st.school_id 
WHERE st.city <> 'New York' AND s.school_name = st.city;

SELECT * FROM schools 
WHERE (name='%name%' OR address='%name%' OR city='%name%'OR zip='%name%')