drop database customerS;
create database customerS;
use customerS;

create table orders(
	ord_no int PRIMARY key,
    purch_amt float,
    ord_date date,
    customer_id int,
    salesman_id int
);

create table customer(
	customer_id int PRIMARY key,
    cust_name varchar(20),
    city varchar(20),
    grade int,
    salesman_id int
);

INSERT into customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(1, 'Abdul', 'Dhaka', 1, 101),
(2, 'Mosharrf', 'Chittagong', 2, 102),
(3, 'Salma', 'Sylhet', 3, 103),
(4, 'Kamrul', 'Khulna', 2, 104),
(5, 'Malek', 'Barisal', 1, 105),
(6, 'Hasan', 'Rajshahi', 3, 106);

INSERT into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(1001, 2500.50, '2024-01-15', 1, 101),
(1002, 1500.75, '2024-02-20', 2, 102),
(1003, 3000.00, '2024-03-18', 3, 103),
(1004, 4500.25, '2024-04-22', 4, 104),
(1005, 2000.10, '2024-05-12', 5, 105),
(1006, 3500.60, '2024-06-01', 6, 106);


select 
    o.ord_no,
    o.ord_date,
    c.cust_name,
    o.salesman_id
from  orders o
join   customer c on o.customer_id = c.customer_id;

select cust_name from customer
where   salesman_id is not null
order by  cust_name asc;
    
select cust_name from  customer
where  salesman_id is null
order by   cust_name asc;
