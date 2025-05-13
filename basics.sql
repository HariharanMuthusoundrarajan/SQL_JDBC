create database PSNA1;
use PSNA1;
 CREATE TABLE student_details(
	student_name varchar(50) not null,
    student_reg_no int(20) not null,
    email varchar(50) not null,
    DOB date not null,
    dept varchar(20) not null,
    phno int not null
 );
 SHOW TABLES;
 insert into student_details values ("Dharanidharan" , 2323232,"dharani@gmail.com","2004:09:28","IT",7904906528);
 
create database tcs;
use tcs;

create table if exists employee(
	e_name varchar(50) not null,
    id varchar(20) not null,
    email varchar(30) not null,
    date_of_joining date not null,
    phno int not null,
    city varchar(20) not null,
    country varchar(20) not null,
    e_role varchar(10) not null,
    team varchar(10) not null
);
show tables;
insert into employee values ('Dharanidharan' , '7', 'nmdharan28@gmail.com','2025:03:28',790490528,'Banglore','India','Developer','A');

create table start_employee as select
e_name,
id,
e_role,
team
from employee;
select * from employee


create temporary table star(
employee_name varchar(30),
salary decimal
);

show tables;

select * from star;
insert into employee values ('Hariharan' , '8', 'hari@gmail.com','2025:04:28',7904904323,'Banglore','India','Developer','A'),
('kalaiselvan' , '9', 'kalai@gmail.com','2025:04:10',7904905723,'Banglore','India','Developer','B');


select * from managers;

show databases;

use CRUD;
select * from demo;





