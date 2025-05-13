create database Projects_Database;
use Projects_Database;
create table projects(
project_id Int(10)  primary key auto_increment, 
project_name varchar(30),
cliend_name varchar(30),
start_date date,
end_date date,
status_ varchar(30),
budget decimal(10,2)
);
insert into projects values(NULL,'Website Redesign','TVS','2024-01-15','2024-06-30','In Progress',25000.00);
INSERT INTO projects VALUES (NULL, 'Mobile App Development', 'TechNova', '2023-10-01', '2024-04-15', 'Completed', 40000.00);
INSERT INTO projects VALUES (NULL, 'Cloud Migration', 'GreenLeaf Inc.', '2024-03-01', '2024-12-31', 'Planned', 75000.00);
INSERT INTO projects VALUES (NULL, 'CRM Integration', 'BrightPath', '2024-02-10', '2024-08-20', 'On Hold', 18500.00);
INSERT INTO projects VALUES (NULL, 'AI Chatbot Deployment', 'NeoSolutions', '2024-05-01', '2024-10-15', 'In Progress', 32000.00);

select * from projects;
select project_name from   projects order by  budget desc;
select project_id , project_name, status_ from projects where status_ = "In Progress";

select project_id, project_name , start_date from projects where year(start_date) > 2022;

select sum(budget)  as Total_Budget from projects where status_="Completed";

select cliend_name , count(*) as project_count from projects group by cliend_name;

select  project_id, project_name, abs(datediff(start_date, end_date)) as No_of_days from projects;

SELECT status_, GROUP_CONCAT(project_name) AS Project_Names, AVG(budget) AS Average_Budget FROM projects GROUP BY status_;

select project_name , abs(datediff(start_date,end_date)) as Number_of_days from  projects where datediff(start_date,end_date) = 
(select max(datediff(start_date,end_date)) from projects);

select project_id , project_name , end_date from projects where year(end_date)=2024; 

CREATE VIEW high_budget_projects AS SELECT *  FROM projects WHERE budget > 1000000;
SELECT * FROM high_budget_projects;

SELECT cliend_name, COUNT(*) AS number_of_projects, SUM(budget) AS total_budget FROM projects GROUP BY cliend_name;

select project_name, cliend_name,end_date from projects  where year(end_date) < 2010;

select concat( "The Best project is : ", project_name) from projects order by  datediff(end_date,start_date) asc limit 1;

select cliend_name , avg(budget) from projects group by cliend_name having avg(budget) > 500000 order by avg(budget) desc;   


