create database employee_wf;
show databases;
use employee_wf;
CREATE TABLE employee(
 EMPID VARCHAR(4),
 NAME VARCHAR(100),
 JOB VARCHAR(50),
 SALARY int(20));
 
 DESC employee;
 
INSERT INTO employee(EMPID,NAME,JOB,SALARY) values
(201, 'ANIRUDDHA','ANALYST',2100),
(212, 'LAKSHAY','DATA ENGINEER',2700),
(209, 'SIDDHARTH','DATA ENGINEER',3000),
(232, 'ABHIRAJ','DATA SCIENTIST',2500),
(205, 'RAM','ANALYST',2500),
(222, 'PRANAV','MANAGER',4500),
(202, 'SUNIL','MANAGER',4800),
(233, 'ABHISHEK','DATA SCIENTIST',2800),
(244, 'PURVA','ANALYST',2500),
(217, 'SHAROON','DATA SCIENTIST',3000),
(216, 'PULKIT','DATA SCIENTIST',3500),
(200, 'KUNAL','MANAGER',5000);


select * from employee;

-- CTE for selecting avg salary of position and total salary of employees along with all the records
with table_2 as (
select 
JOB,
avg(SALARY) as avg_salary_job
from employee
group by job)
select 
e.EMPID,
e.name,
e.job,
e.salary,
t.avg_salary_job,
(select sum(salary) as total_salary from employee) as total_salary
from employee e
left join table_2 t on
e.job = t.job
group by empid;

-- window function same example

select * , 
avg(salary) over(partition by job) as avg_salary_job,
sum(salary) over() as total_salary
from employee;