drop DATABASE healthcare;
create database healthcare;
use healthcare;


create table patients (
    patient_id int AUTO_INCREMENT primary KEY,
    first_name varchar(30),
    last_name varchar(30),
    date_of_birth date,
    gender enum('male', 'female'),
    address varchar(30),
    contact_number varchar(30),
    email_address varchar(30),
    cost int
);



create table doctors (
    doctor_id int AUTO_INCREMENT primary key,
    first_name varchar(30),
    last_name varchar(30),
    specialization varchar(30),
    contact_number varchar(30),
    email_address varchar(30)
);


create table medicalRecords (
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

create table billing (
    bill_id int auto_increment primary key,
    patient_id int,
    admission_date date,
    discharge_date date,
    total_bill_amount decimal(10, 2),
    payment_status enum('paid', 'unpaid'),
    foreign key (patient_id) references patients(patient_id)
);

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

create table patientAllergies (
    allergy_id int auto_increment primary key,
    patient_id int,
    allergy_name varchar(30),
    severity enum('mild', 'moderate', 'severe'),
    reaction_description text,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

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

create table equipmentInventory (
    equipment_id int AUTO_INCREMENT primary key,
    equipment_name varchar(30),
    quantity int,
    status enum('available', 'in use', 'maintenance', 'retired'),
    location varchar(30)
);

select patients.first_name,patients.last_name,appointments.appointment_date, appointments.appointment_time from patients
inner JOIN appointments on patients.patient_id =appointments.patient_id;

select doctors.first_name, doctors.last_name,prescriptions.medication,prescriptions.dosage from doctors
INNER join prescriptions on doctors.doctor_id= prescriptions.doctor_id;



INSERT into patients (patient_id,first_name, last_name, date_of_birth, gender, address, contact_number, email_address) 
VALUES
(1,'Abul', 'Hasan', '1980-05-12', 'male', '123 Main St, Dhaka', '01711111111', 'abul.hasan@example.com',0),
(2,'Fatema', 'Begum', '1992-11-22', 'female', '456 Park Ave, Chittagong', '01712222222', 'fatema.begum@example.com',0),
(3,'Karim', 'Uddin', '1985-02-15', 'male', '789 Market Rd, Sylhet', '01713333333', 'karim.uddin@example.com',0);

INSERT into doctors (first_name, last_name, specialization, contact_number, email_address) 
VALUES
('Dr. Ayesha', 'Rahman', 'Cardiology', '01811111111', 'ayesha.rahman@example.com'),
('Dr. Salman', 'Ahmed', 'Neurology', '01812222222', 'salman.ahmed@example.com'),
('Dr. Tahmina', 'Chowdhury', 'Pediatrics', '01813333333', 'tahmina.chowdhury@example.com');

INSERT into medicalRecords (patient_id, admission_date, discharge_date, diagnosis, treatment, doctor_id) 
VALUES
(1, '2024-01-10', '2024-01-15', 'Heart Attack', 'Angioplasty and medication', 1),
(2, '2024-02-20', '2024-02-25', 'Stroke', 'Thrombolysis and rehabilitation', 2),
(3, '2024-03-05', '2024-03-10', 'Pneumonia', 'Antibiotics and supportive care', 3);

INSERT into appointments (patient_id, doctor_id, appointment_date, appointment_time, purpose) 
VALUES
(1, 1, '2024-03-01', '09:00:00', 'Follow-up checkup'),
(2, 2, '2024-03-02', '10:00:00', 'Neurological assessment'),
(3, 3, '2024-02-03', '11:00:00', 'Child vaccination');

INSERT into prescriptions (patient_id, doctor_id, medication, dosage, frequency, start_date, end_date) 
VALUES
(1, 1, 'Aspirin', '75mg', 'Once daily', '2024-01-01', '2024-03-31'),
(2, 2, 'Atorvastatin', '20mg', 'Once daily', '2024-01-02', '2024-03-31'),
(3, 3, 'Amoxicillin', '500mg', 'Three times daily', '2024-01-03', '2024-03-10');

INSERT into labtests (patient_id, doctor_id, test_name, test_date, result, normal_range) 
VALUES
(1, 1, 'Lipid Profile', '2024-07-01', 'High cholesterol', 'Normal'),
(2, 2, 'MRI Brain', '2024-07-02', 'Ischemic stroke', 'Normal'),
(3, 3, 'CBC', '2024-07-03', 'Elevated WBC', 'Normal');

INSERT into billing (patient_id, admission_date, discharge_date, total_bill_amount, payment_status) 
VALUES
(1, '2024-01-10', '2024-01-15', 50000.00, 'paid'),
(2, '2024-02-20', '2024-02-25', 75000.00, 'unpaid'),
(3, '2024-03-05', '2024-03-10', 30000.00, 'paid');

INSERT into analyticsResults (patient_id, doctor_id, analysis_date, analysis_type, analysis_result) 
VALUES
(1, 1, '2024-03-01', 'Heart Risk Analysis', 'High risk due to cholesterol levels'),
(2, 2, '2024-03-02', 'Stroke Risk Assessment', 'Moderate risk, follow-up needed'),
(3, 3, '2024-03-03', 'Pediatric Health Analysis', 'Good health, vaccination up to date');

INSERT into administrativeStaff (first_name, last_name, position, contact_number, email_address) 
VALUES
('Farhana', 'Ahmed', 'Receptionist', '01911111111', 'farhana.ahmed@example.com'),
('Jamal', 'Uddin', 'Billing Manager', '01912222222', 'jamal.uddin@example.com'),
('Laila', 'Begum', 'HR Manager', '01913333333', 'laila.begum@example.com');

INSERT into insuranceDetail (patient_id, insurance_provider, policy_number, coverage_details) 
VALUES
(1, 'Delta Life Insurance', '21', 'Full coverage for hospitalization and treatment'),
(2, 'Pragati Life Insurance', '22', 'Partial coverage for hospitalization'),
(3, 'Jiban Bima Corporation', '23', 'Full coverage for outpatient services');

INSERT into patientAllergies (patient_id, allergy_name, severity, reaction_description) 
VALUES
(1, 'Peanuts', 'severe', 'Anaphylaxis'),
(2, 'Penicillin', 'moderate', 'Rash and itching'),
(3, 'Dust Mites', 'mild', 'Sneezing and runny nose');

INSERT into treatmentPlans (patient_id, doctor_id, plan_description, start_date, end_date, status) 
VALUES
(1, 1, 'Cardiac rehabilitation and lifestyle changes', '2024-01-01', '2024-4-31', 'active'),
(2, 2, 'Neurological therapy and medication', '2024-01-02', '2024-4-31', 'active'),
(3, 3, 'Antibiotic therapy and follow-up', '2024-01-03', '2024-5-10', 'completed');

INSERT into equipmentInventory (equipment_name, quantity, status, location) 
VALUES
('ECG Machine', 10, 'available', 'Cardiology Department'),
('MRI Scanner', 2, 'in use', 'Radiology Department'),
('Ventilator', 5, 'maintenance', 'ICU');


DELIMITER $$


-- after update trigger for billing
CREATE TRIGGER update_patient_balance AFTER INSERT ON billing FOR EACH ROW
    BEGIN
        UPDATE patients
  		SET cost = cost + new.total_bill_amount
  		WHERE patient_id = new.patient_id;
    END;
$$

DELIMITER ;

select * from patients;
