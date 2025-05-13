create database company;
use  company;
create table customers (customer_id Int(10) primary key  , customer_name varchar(20)not null, product_name varchar(20) not null , city varchar(30) not  null); 
drop table customers;

create table orders (
customer_id int(10) ,
product_name varchar(20),
Order_id int(10),
order_date date,
Delivery_date date,
Amount decimal(10,2)


);
drop table orders;
insert into customers values (1,'Sri','Samsung','Chennai');
insert into customers values (2,'Ram','Iphone 15 ','Cbe');
insert into customers values (3,'Mani','16 E ','Madurai');
insert into customers values (4,'Shan','Navzo 20 pro','Salem');
insert into customers values (5,'jack','16 E ','Erode');
select * from customers;
drop table customers;

insert into orders values(1,'Samsung',751,'2024-05-13','2024-05-20',13000);
insert into orders values(2,'Samsung',755,'2024-04-12','2024-04-20',15200);
insert into orders values(3,'IPhone',831,'2025-01-17','2025-01-28',20000);
insert into orders values(4,'Samsung',9324,'2024-10-17','2024-11-1',13700);
insert into orders values(5,'Nokia ',736,'2024-06-10','2024-06-11',13036);

select * from orders;

select customer_name from customers where product_name = (select product_name from customers where customer_name='jack');
select customer_name from  customers where customer_id in (select customer_id from orders where amount > 1500) ;

select customer_name from customers where customer_id in  (select customer_id from orders where delivery_date > curdate());

select customer_name from customers where customer_id =  (select customer_id from orders where amount = (select max(amount) from orders));
 
 select customer_name from customers where customer_id in (select customer_id from orders where order_date between '2024-05-01' and '2024-05-30'); 


use company;

alter table customers add column Order_id int(10) not null;
select * from customers;
alter table customers drop column Order_id;
alter table customers modify customer_id varchar(20) not null;
desc customers;
alter table customers rename column cus_name to customer_name;


 rename table customers to Cus;
 rename table cus to customers;
 select * from customers;

update customers set product_name='laptop' where customer_id='1';
select * from customers;

select customers.customer_id , Orders.order_id from customers inner join orders on customers.customer_id = orders.order_id;

-- students and courses 

select c.customer_name , o.Amount  , o.Order_id from customers c join orders o on c.customer_id=o.customer_id;













