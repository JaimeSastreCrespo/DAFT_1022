CREATE DATABASE if not exists bootcamps;
use bootcamps;

CREATE TABLE courses(
course_id int primary key,
title VARCHAR(30));


create table if not exists student (
s_id int ,
name_s varchar(25),
c_id int
/*,FOREIGN KEY (c_id) REFERENCES courses(course_id)*/);


INSERT INTO courses(course_id, title)
values (11, "DA"), (22,"UI UX"), (33,"WD");

INSERT INTO student (s_id, name_s, c_id)
VALUES (1, "Tim", 11) , (2, "Bob", 22),(3,"Rim", 44);

/*drop table courses;
drop table student;*/

# wanna know the course titles for all our students

SELECT s.name_s, c.title
from student s
LEFT JOIN courses c
on c.course_id=s.c_id;




# wanna know the names of students who study on existing courses

SELECT s.name_s, c.title
from student s
left join courses c
on c.course_id=s.c_id;

select s.name_s, c.title
from courses c
inner join student s
on c.course_id=s.c_id;



