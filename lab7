drop DATABASE employee;
create DATABASE employee;
use employee;
create table regions(
	region_id int PRIMARY KEY,
    region_name varchar(25)
);
create table countries(
	country_id char(2) primary key,
	country_name varchar(40),
    region_id int,
    FOREIGN KEY(region_id) REFERENCES regions(region_id)
);
create TABLE locations (
	location_id int primary key,
    street_address varchar(28),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12),
    country_id char(2),
    FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

create table departments(
	department_id int primary key,
    department_name varchar(20),
    manager_id int,
    location_id int,
    FOREIGN KEY(location_id) REFERENCES locations(location_id)
);


create TABLE jobs(
	job_id varchar(10) primary key,
    job_title varchar(35),
    min_salary int,
    max_salary int
);

create table job_history(
	employee_id int primary key,
    start_date date,
    end_date date,
    job_id varchar(10),
    department_id int,
    FOREIGN KEY(job_id) REFERENCES jobs(job_id)
);

create table employees(
	employee_id int primary key,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
    phone_number varchar(20),
    hire_date date,
    job_id varchar(10),
    salary int,
    commission_pct int,
    mamager_id int,
    department_id int,
    FOREIGN key(department_id) REFERENCES departments(department_id),
    FOREIGN key(employee_id) REFERENCES job_history(employee_id),
    FOREIGN key(job_id) REFERENCES jobs(job_id)
);


create table jon_grades(
	grade_level varchar(2) primary key,
    lowest_sal int,
    highest_sal int
    
);
