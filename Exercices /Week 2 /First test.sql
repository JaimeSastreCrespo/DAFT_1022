CREATE DATABASE  apple_test;
CREATE DATABASE if not exists apple_test;
use apple_test;
select * from applestore;
select track_name, price from applestore;

select track_name, price from applestore
where price > 2 and rating_count_tot<4
order by track_name desc;

select track_name, avg(price)
from applestore
group by track_name;

select currency, avg(price)
from applestore
group by currency;

create table if not exists courses (
id int,
name char(30),
pt_ft char(10),
remote char(3),
start_date date,
duration int,
location char(10));
insert into courses (id, name, pt_ft, remote, start_date, duration, location)
values (1, "Data Analytics","ft",  "no", "2022-07-25", 9, "Paris"),
(2,"Data Analytics","pt",  "no", "2022-05-25", 24, "Paris" ),
(3, "Data Analytics", "ft", "yes", "2022-06-25", 9, "Paris"),
(4, "Data Analytics", "pt", "yes", "2021-07-25", 9, "Paris");


