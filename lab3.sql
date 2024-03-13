create database labtask;

use labtask;

create table employee(
    e_name varchar(20),
    street varchar(20),
    city varchar(10)
    );
    
create table company(
    company_name varchar(20),
    branch varchar(20),
    city varchar(10)
    );
    
    
create table works(
    w_name varchar(20),
    e_name varchar(20),
    company_name varchar(20),
	salary int
    );
    
    
 
    
    
INSERT INTO employee(e_name,street,city)
VALUES("sakib","0000@gmail.com"","dhaka");
  
INSERT INTO company(company_name,branch,city)
VALUES("netgaant","mirpur","dhaka");

insert into works(w_name,e_name,company_name,salary)
VALUES("software up","0000@gmail.com","netgaant",200000);

alter TABLE employee add COLUMN emp_id int;

alter TABLE employee add COLUMN entry_data varchar(50);

alter table employee CHANGE COLUMN city address varchar(30);

alter table employee add COLUMN email varchar(30);
