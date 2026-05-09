drop database bank;
create database bank;
create table branch(branch_name varchar(10), branch_city varchar(10), assets int);

create table customer(customer_id int PRIMARY key,
                      customer_name varchar(20),customer_city varchar(10));
create table account (account_number int primary key,
                      branch_name varchar(10),
                      balance int );
create table loan ( loan_number int PRIMARY key, branch_name varchar(15),
                   amount int);
create table depositor(
    customer_name varchar(20),
    account_number int,
	FOREIGN key (account_number) REFERENCES account(account_number));

create table borrower(
    customer_name varchar(20),
    account_number int,
	FOREIGN key (account_number) REFERENCES account(account_number));

insert into branch VALUES
    ("mirpur","dhaka",1000),
    ("uttora","dhaka",1000),
        ("dhanmondi","dhaka",1000),
        ("motijeel","dhaka",1000),
        ("shabag","dhaka",1000);

insert into customer VALUES
    (1,"sakib",1000),
    (2,"mushfiq",1000),
        (3,"tamim",1000),
        (4,"taskin",1000),
        (5,"liton",1000);

insert into account VALUES
    (1,"mirpur",1000),
    (2,"uttora",1000),
        (3,"dhanmondi",1000),
        (4,"motijeel",1000),
        (5,"shabag",1000);

insert into loan values
    (1,"mirpur",1000),
    (2,"uttora",1000),
        (3,"dhanmondi",1000),
        (4,"motijeel",1000),
        (5,"shabag",1000);
insert into depositor values
    ("sakib",1),
    ("mushfiq",2),
        ("tamim",3),
        ("taskin",4),
        ("liton",5);

insert into borrower values
    ("sakib",1),
    ("mushfiq",2),
        ("tamim",3),
        ("taskin",4),
        ("liton",5);

SELECT * FROM customer
WHERE customer_city IN ('dhaka');

SELECT * FROM customer
WHERE customer_city not IN ('dhaka');

SELECT * FROM branch
WHERE assets=1000 and assets=2000;

SELECT * FROM branch
WHERE assets=1000 or assets=2000;

SELECT * FROM branch
WHERE branch_name not like 'mir%';

SELECT * FROM branch
WHERE assets BETWEEN 1000 and 2000;

SELECT * FROM branch
WHERE assets not BETWEEN 1000 and 2000;

SELECT * FROM customer
order by customer_name;
SELECT * FROM customer
order by customer_name DESC;
