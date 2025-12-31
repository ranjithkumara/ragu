create database hospitalDB;
use hospitalDB;

create table Doctors (
    doctor_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    specialty varchar(50),
    contact_info varchar(30)
);
insert into Doctors (first_name, last_name, specialty, contact_info) values 
('Ranjith', 'Kumar', 'Orthopedic', 'ranjith@example.com'),
('Virat', 'Kholi', 'Neurologist', 'virat@example.com'),
('Nithin', 'Kumar', 'Orthopedic', 'nithin@example.com'),
('Diya', 'senthil', 'Neurologist', 'diya@example.com'),
('John', 'Doe', 'Cardiologist', 'johndoe@example.com'),
('Jane', 'Smith', 'Neurologist', 'janesmith@example.com'),
('Alex', 'Brown', 'Orthopedic', 'alexbrown@example.com');
select * from Doctors;

create table Patients (
    patient_id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    dob date,
    gender varchar(10),
    contact_info varchar(100)
);

insert into Patients (first_name, last_name, dob, gender, contact_info) values 
('Agastion', 'Savier', '1990-05-15', 'M', 'savier@example.com'),
('Sasirekha', 'Palaninisamy', '1980-10-25', 'F', 'sasi@example.com'),
('Monica', 'Sundar', '1990-06-15', 'F', 'monica@example.com'),
('Santhosh', 'Sanjay', '1990-07-15', 'M', 'charliedavis@example.com'),
('Prakash', 'Mani', '2025-06-15', 'M', 'prakash@example.com'),
('Bob', 'Jackson', '1985-07-19', 'M', 'bobjackson@example.com'),
('Charlie', 'Davis', '1985-06-15', 'M', 'charliedavis@example.com');
select * from Patients;

create table Appointments (
    appointment_id int primary key auto_increment,
    doctor_id int,
    patient_id int,
    appointment_date date,
    appointment_time time,
    description text,
    foreign key (doctor_id) references Doctors(doctor_id),
    foreign key (patient_id) references Patients(patient_id)
);
insert into Appointments (doctor_id, patient_id, appointment_date, appointment_time, description) values 
(1, 1, '2023-08-10', '10:00:00', 'Regular check-up'),
(2, 2, '2023-08-11', '14:00:00', 'Follow-up from last visit'),
(3, 3, '2025-05-12', '12:00:00', 'Follow-up from last visit'),
(4, 4, '2025-12-10', '10:00:00', 'Regular check-up'),
(5, 5, '2025-11-15', '11:00:00', 'Regular check-up');

select * from Appointments;

create table MedicalRecords (
    record_id int auto_increment,
    patient_id int,
    doctor_id int,
    visit_date date,
    diagnosis varchar(255),
    prescribed_medication varchar(255),
    notes text,
    primary key (record_id),
    foreign key (patient_id) references Patients(patient_id),
    foreign key (doctor_id) references Doctors(doctor_id)
);
insert into MedicalRecords (patient_id, doctor_id, visit_date, diagnosis, prescribed_medication, notes) values 
(1, 1, '2025-12-10', 'High blood pressure', 'Lisinopril', 'Patient to return in a month for check-up'),
(2, 2, '2025-10-11', 'Migraine', 'Topiramate', 'Patient to report any side effects immediately'),
(3, 3, '2025-11-11', 'Cancer', 'Topiramate', 'Patient to report any side effects immediately'),
(4, 4, '2025-12-11', 'High blood pressure', 'Topiramate', 'Patient to return in a month for check-up');
select * from MedicalRecords;

create table Billing (
    bill_id int auto_increment,
    patient_id int,
    bill_date date,
    amount_due decimal(10, 2),
    due_date date,
    payment_status varchar(50),
    primary key (bill_id),
    foreign key (patient_id) references Patients(patient_id)
);
insert into Billing (patient_id, bill_date, amount_due, due_date, payment_status) values 
(1, '2025-08-01', 150.00, '2025-08-31', 'Pending'),
(2, '2025-08-02', 200.00, '2025-08-31', 'Pending'),
(3, '2025-08-03', 200.00, '2025-08-31', 'Paid'),
(4, '2025-08-01', 200.00, '2025-08-31', 'Pending');
select * from Billing;

/*UPDATE Task*/
update Billing set payment_status='Paid' where patient_id=1;

/*select tasks with WHERE and AND */
select * from patients where gender='F';
select * from patients where patient_id=1 and gender='M';


/*JOINS*/
select * from Doctors d join Patients p on d.doctor_id=p.patient_id;
select d.first_name as Doctor_name,p.first_name as Patient_name,p.dob,p.gender,p.contact_info from Doctors d 
join Patients p on d.doctor_id=p.patient_id;

/*AGGREGATION FUNCTIONS Task*/
select count(*) as Total_Bill,payment_status from billing group by payment_status having Total_Bill>1;

/*SUBQUERY Task*/
select doctor_id,first_name from doctors where doctor_id=(select record_id from medicalrecords where record_id=1);

/*UNION AND UNION ALL Task*/
select doctor_id,first_name from doctors where doctor_id=1
union all
select doctor_id,first_name from doctors where doctor_id=2;

/*ORDER BY Task*/
select * from Billing order by amount_due desc,patient_id asc;

/*LIKE Task*/
select * from Patients where first_name like '%nic%';

/*NULL AND NOT NLL Task*/
select * from patients where last_name is null;
select * from patients where last_name is not null;

/*MIN AND MAX Task*/
select min(appointment_date) from appointments;
select max(Bill_date) from billing;

/*EXISTS Task*/
select first_name from doctors where exists(select * from patients where patient_id=doctors.doctor_id);

/*ALTER TABLE Task*/
alter table doctors add column availability varchar(30);

/*LEFT JOIN Task*/
select p.first_name,b.payment_status from patients p left join billing b on p.patient_id=b.patient_id;

/*RIGHT JOIN Task*/
select p.first_name,b.payment_status from patients p right join billing b on p.patient_id=b.patient_id;