create database lab4;

create table customers(
  customer_id integer,
  cust_name varchar(255),
  city varchar(255),
  grade integer,
  salesman_id integer
);

select * from customers where grade > 100;

select * from customers where city = 'New York' and grade > 100;

select * from customers where city = 'New York' or grade > 100;

select * from customers where city = 'Paris' or city = 'Rome';

select * from customers where cust_name like 'B%';

create table orders(
  order_id serial,
  customer_id integer,
  description text,
  purch_amt integer,
  constraint p_key primary key(order_id)
);

select * from orders where customer_id in (select customer_id from customers where city = 'New York');

select * from customers where customer_id in (select customer_id from orders group by customer_id having count(order_id) > 10);

select sum(purch_amt) from orders;

select avg(purch_amt) from orders;

select * from customers where cust_name is not null;

select max(purch_amt) from orders;