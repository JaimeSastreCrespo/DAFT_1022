CREATE DATABASE IF NOT EXISTS task_13; 
USE task_13;

CREATE TABLE alumni (
  student_id int,
  name varchar(255),
  surname varchar(255),
  birth_date date,
  faculty varchar(255)
);
INSERT INTO alumni (student_id, name, surname, birth_date, faculty) VALUES
(347, 'Daniela', 'Lopes', '1991-04-26', 'Medical School'),
(348, 'Robert', 'Fischer', '1991-03-09', 'Mathematics');
CREATE TABLE exams (
  student_id int,
  class_id int,
  exam_date date,
  grade int
);
INSERT INTO exams (student_id, class_id, exam_date, grade) VALUES
(347, 74, '2015-06-19', 16),
(347, 87, '2015-06-06', 20),
(348, 74, '2015-06-19', 13);
CREATE TABLE classes (
  class_id int,
  class_name varchar(255),
  professor_id int,
  semester varchar(255)
);
INSERT INTO classes (class_id, class_name, professor_id, semester) VALUES
(74, 'algebra', 435, '2015_summer'),
(87, 'calculus', 532, '2015_summer'),
(46, 'statistics', 625, '2015_winter');

SELECT a.student_id, a.name, a.surname, a.birth_date, a.faculty, e.class_id, e.exam_date, e.grade, c.class_name, c.professor_id, c.semester
FROM alumni a
JOIN exams e ON a.student_id = e.student_id
JOIN classes c ON e.class_id = c.class_id
WHERE e.grade > 16
and c.class_name = 'calculus';
