drop DATABASE healthcare;
create database healthcare;
use healthcare;
-- create patients table
create table patients (
    patient_id int AUTO_INCREMENT primary KEY,
    first_name varchar(30),
    last_name varchar(30),
    date_of_birth date,
    gender enum('male', 'female'),
    address varchar(30),
    contact_number varchar(30),
    email_address varchar(30)
);



-- create doctors table
create table doctors (
    doctor_id int AUTO_INCREMENT primary key,
    first_name varchar(30),
    last_name varchar(30),
    specialization varchar(30),
    contact_number varchar(30),
    email_address varchar(30)
);


-- create medical records table
create table medicalrecords (
    record_id int auto_increment PRIMARY key,
    patient_id int,
    admission_date date,
    discharge_date date,
    diagnosis varchar(30),
    treatment text,
    doctor_id int,
    foreign key (patient_id) REFERENCES patients(patient_id),
    foreign key (doctor_id) REFERENCES doctors(doctor_id)
);


-- create appointments table
create table appointments (
    appointment_id int AUTO_INCREMENT primary key,
    patient_id int,
    doctor_id int,
    appointment_date date,
    appointment_time time,
    purpose varchar(255),
    foreign key (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- create prescriptions table
create table prescriptions (
    prescription_id int AUTO_INCREMENT PRIMARY key,
    patient_id int,
    doctor_id int,
    medication varchar(30),
    dosage varchar(30),
    frequency varchar(30),
    start_date date,
    end_date date,
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) REFERENCES doctors(doctor_id)
);

-- create lab tests table
create table labtests (
    test_id int AUTO_INCREMENT PRIMARY key,
    patient_id int,
    doctor_id int,
    test_name varchar(30),
    test_date date,
    result varchar(30),
    normal_range varchar(30),
    FOREIGN key (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) references doctors(doctor_id)
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
create table analyticsResults (
    result_id int AUTO_INCREMENT PRIMARY key,
    patient_id int,
    doctor_id int,
    analysis_date date,
    analysis_type varchar(30),
    analysis_result text,
    FOREIGN key (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) references doctors(doctor_id)
);

-- create administrative staff table
create table administrativeStaff (
    staff_id int AUTO_INCREMENT PRIMARY key,
    first_name varchar(30),
    last_name varchar(30),
    position varchar(30),
    contact_number varchar(30),
    email_address varchar(30)
);


create table insuranceDetail (
    insurance_id int AUTO_INCREMENT PRIMARY key,
    patient_id int,
    insurance_provider varchar(30),
    policy_number varchar(30),
    coverage_details text,
    FOREIGN key (patient_id) REFERENCES patients(patient_id)
);

-- create patient allergies table
create table patientAllergies (
    allergy_id int auto_increment primary key,
    patient_id int,
    allergy_name varchar(30),
    severity enum('mild', 'moderate', 'severe'),
    reaction_description text,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

-- create treatment plans table
create table treatmentPlans (
    plan_id int auto_increment primary key,
    patient_id int,
    doctor_id int,
    plan_description text,
    start_date date,
    end_date date,
    status enum('active', 'completed', 'on hold'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- create equipment inventory table
create table equipmentInventory (
    equipment_id int AUTO_INCREMENT primary key,
    equipment_name varchar(30),
    quantity int,
    status enum('available', 'in use', 'maintenance', 'retired'),
    location varchar(30)
);
