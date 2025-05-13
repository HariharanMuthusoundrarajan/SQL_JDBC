create database  HCL;
use HCL;
create table employees (employee_id int(10) primary key , employee_name varchar(30),department_id int(10),salary decimal (10,2));
select * from employees;


create table departments(department_id int(10) primary key , department_name varchar(30));

select * from departments;
INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

select * from departments;
INSERT INTO employees (employee_id, employee_name, department_id, salary) VALUES
(201, 'John Miller', 2, 80000),
(202, 'Sarah Wilson', 1, 55000),
(203, 'Raj Patel', 3, 60000),
(204, 'Linda Gomez', 2, 82000),
(205, 'Tom Nguyen', 4, 58000);
select * from employees;

select e.employee_name , d.department_id from employees e inner join  departments d on e.department_id = d.department_id;


select d.department_name  from departments d left join employees e on d.department_id = e.department_id;

select e.employee_name from employees e

left join departments d on e.department_id = d.department_id
where d.department_id is null;


/*select d.department_name , sum(e.salary) as Total_salary from departments d left join employees e on d.department_id = e.department_id group by d.department_id;*/


create database assignments;
use assignments;

create table projects (project_id int(10) primary key not null, project_name varchar(40),
start_date date,
end_date date

);

create table projects_assignments ( assignment_id int (10) primary key ,
project_id int (10),
employee_id int (10),
assigned_date date
);
select * from projects_assignments;

INSERT INTO projects (project_id, project_name, start_date, end_date) VALUES
(101, 'Website Redesign', '2024-01-15', '2024-04-30'),
(102, 'Mobile App Launch', '2024-03-01', '2024-07-15'),
(103, 'CRM Integration', '2024-02-20', '2024-06-30'),
(104, 'Security Audit', '2024-05-01', '2024-05-20'),
(105, 'Cloud Migration', '2024-04-01', '2024-08-31');

select * from projects;
INSERT INTO projects_assignments (assignment_id, project_id, employee_id, assigned_date) VALUES
(1, 101, 201, '2024-01-20'),
(2, 102, 202, '2024-03-05'),
(3, 103, 203, '2024-02-25'),
(4, 105, 201, '2024-04-10'),
(5, 104, 204, '2024-05-02');

select * from projects_assignments;
select project_name , datediff( end_date , start_date) as No_of_days from projects order by datediff(end_date,start_date )desc limit 1;

select employee_id from projects_assignments where project_id not in (select project_id from projects);
select project_name from projects where start_date > (select avg(start_date) from projects);
select project_name from projects where project_id not in (select project_id from projects_assignments);
select * from projects;

select employee_name from employee where salary in (select salary from employee order by salary desc limit 2)  <>  salary not in (select max(salary) from employee);










