drop DATABASE healthcare;
create database healthcare;
use healthcare;
-- create patients table
create table patients (
    patient_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    date_of_birth date,
    gender enum('male', 'female', 'other'),
    address varchar(255),
    contact_number varchar(20),
    email_address varchar(100)
);



-- create doctors table
create table doctors (
    doctor_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    specialization varchar(100),
    contact_number varchar(20),
    email_address varchar(100)
);


-- create medical records table
create table medicalrecords (
    record_id int auto_increment primary key,
    patient_id int,
    admission_date date,
    discharge_date date,
    diagnosis varchar(255),
    treatment text,
    doctor_id int,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);


-- create appointments table
create table appointments (
    appointment_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    appointment_date date,
    appointment_time time,
    purpose varchar(255),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- create prescriptions table
create table prescriptions (
    prescription_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    medication varchar(100),
    dosage varchar(50),
    frequency varchar(50),
    start_date date,
    end_date date,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- create lab tests table
create table labtests (
    test_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    test_name varchar(100),
    test_date date,
    result varchar(255),
    normal_range varchar(100),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- create billing table
create table billing (
    bill_id int auto_increment primary key,
    patient_id int,
    admission_date date,
    discharge_date date,
    total_bill_amount decimal(10, 2),
    payment_status enum('paid', 'unpaid'),
    foreign key (patient_id) references patients(patient_id)
);

-- create analytics results table
create table analyticsresults (
    result_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    analysis_date date,
    analysis_type varchar(100),
    analysis_result text,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- create administrative staff table
create table administrativestaff (
    staff_id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    position varchar(100),
    contact_number varchar(20),
    email_address varchar(100)
);
