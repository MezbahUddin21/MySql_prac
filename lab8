drop database joinn;
create database joinn;
use joinn;
create table employee(
    empID int primary key,
    empFname varchar(20),
    empLname varchar(20),
    age int,
    EmailID varchar(30),
    phoneNo varchar(11),
    address varchar(20)
    );
    
create table project(
	projectID int,
    empID int,
    clientID int,
    projectName varchar(20),
    projectStartDate date,
    FOREIGN key(empID) REFERENCES employee(empID)

);
create table client(
	clientID int,
    clientFname varchar(20),
    clientLname varchar(20),
    age int,
    clientEmailID varchar(30),
    phoneNo varchar(11),
    address varchar(20),
    empID int,
    FOREIGN key(empID) REFERENCES employee(empID)
);


insert into employee (empID, empFname, empLname, age, EmailID, phoneNo, address)
values 
    (1, 'Abul', 'Hasan', 30, 'abul@example.com', '017XXXXXXXX', 'Dhaka'),
    (2, 'Karim', 'Ahmed', 35, 'karim@example.com', '018XXXXXXXX', 'Chittagong'),
    (3, 'Jamal', 'Uddin', 28, 'jamal@example.com', '019XXXXXXXX', 'Rajshahi');

insert into project (projectID, empID, clientID, projectName, projectStartDate)
values 
    (1, 1, 1, 'Web Development', '2024-05-01'),
    (2, 2, 2, 'Mobile Application', '2024-05-10'),
    (3, 3, 3, 'Data Analysis', '2024-06-01');

insert into client (clientID, clientFname, clientLname, age, clientEmailID, phoneNo, address, empID)
values 
    (1, 'Rahim', 'Khan', 40, 'rahim@example.com', '015XXXXXXXX', 'Sylhet', 1),
    (2, 'Karim', 'Mia', 45, 'karim_client@example.com', '016XXXXXXXX', 'Khulna', 2),
    (3, 'Monwar', 'Hossain', 38, 'monwar@example.com', '014XXXXXXXX', 'Barishal', 3);



SELECT employee.empID, employee.empFname, client.clientID, client.clientEmailID, project.projectName
FROM employee
INNER JOIN client ON employee.empID = client.clientID
INNER JOIN project ON client.empID = project.projectID
;
SELECT employee.empID, employee.empFname, client.clientID, client.clientEmailID, project.projectName
FROM employee
left JOIN client ON employee.empID = client.clientID
left JOIN project ON client.empID = project.projectID
;

SELECT employee.empID, employee.empFname, client.clientID, client.clientEmailID, project.projectName
FROM employee
right JOIN client ON employee.empID = client.clientID
right JOIN project ON client.empID = project.projectID
;


