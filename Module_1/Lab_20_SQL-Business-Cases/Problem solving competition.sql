CREATE DATABASE if not exists company;
use company;## creat our own database, table of dp not needed, table of employees with 2 different dep to answer the
## questions properly and answer the questions

create table if not exists departments (
dep_id int ,
name varchar(10));

insert into departments (dep_id, name)
values (10, "Sales"),
(20,"Procur");

create table if not exists employees (
emp_id int ,
name_em varchar(10),
surname varchar(10),
dep_id varchar(10),
salary float(12,2));
insert into employees (emp_id, name_em, surname, dep_id, salary)
values (101, "Mark","Zuck","Sales", "2000"),
(102,"Leyla","Amrbosio","Sales", "3000"),
(103, "Peter", "Queen","Procur","3000"),
(104, "Laia", "Mckensy","Procur", "2000");


-- 1. Write a query to get unique department ID from employee table
select DISTINCT employees.dep_id from employees;

-- 2.Write a query to get the 2 columns Full name and Taxes  (20% from Salary).
select concat(name_em, surname) as fullname, (0.2*salary) as taxes from employees;


-- 3. Write a query to get the maximum and minimum salary from employees table

select max(salary), min(salary) from employees;

-- 4. Write a query to get the average salary per department.
select dep_id, avg(salary) from employees
group by dep_id;


