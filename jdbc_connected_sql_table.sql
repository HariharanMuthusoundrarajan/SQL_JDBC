create database session;
use session;
create table employees (employee_id int(10) primary key , employee_name varchar(30),salary decimal (10,2));
INSERT INTO employees (employee_id, employee_name, salary) VALUES
(201, 'John Miller',  80000),
(202, 'Sarah Wilson',  55000),
(203, 'Raj Patel', 60000),
(204, 'Linda Gomez',  82000),
(205, 'Tom Nguyen',  58000);
select * from employees;

create table manager(
manager_id  int(10) primary key ,
manager_name varchar(20) ,
salary decimal(10,2)
);
drop table manager;
 
INSERT INTO manager (manager_id, manager_name, salary) VALUES
(201, 'Kumaruh',  807800),
(202, 'Peetruh',  594000),
(203, 'Kalaiuh', 608200),
(204, 'Raamuh',  825900),
(205, 'Pandiyuh',  58370);


select * from manager;






