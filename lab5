drop DATABASE lab5;
create database lab5;
use lab5;
CREATE TABLE employees(
Emp_id int(11) NOT NULL,
First_Name varchar(255) NOT NULL,
Last_name varchar(55) NOT NULL,
DOB date NOT NULL,
Gender enum('M','F') DEFAULT NULL,
Salary int NOT NULL,
Entry_date datetime NOT NULL DEFAULT current_timestamp(),
PRIMARY KEY(Emp_id)
);


INSERT INTO employees (Emp_id, First_Name, Last_name,DOB, Gender, Salary)
VALUES (1, 'Sabbir', 'Rahman','1998-08-02', 'M', 30000),
(2, 'Sakib', 'Hasan','1998-08-02', 'M', 20000),
(3, 'Ananna', 'Rahman','1998-08-02', 'F', 40000),
(4, 'Jannat', 'Hasan','1998-08-02', 'F', 45000),
(5, 'Sabbir ', 'Rahman','1998-08-02', 'M', 30000);

SELECT DISTINCT First_Name, Last_name FROM employees;

select First_Name,Last_name,Salary from employees where Emp_id=2;
delete from employees where Emp_id=2;
