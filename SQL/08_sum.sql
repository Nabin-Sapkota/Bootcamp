use hospital_db;
create table visits (
visit_id int auto_increment primary key,
patient_id int, 
visit_date date, 
doctor_id int, 
charge_amount decimal(10,2),
constraint fk_patient foreign key (patient_id) references patients_new(patient_id));

INSERT INTO visits (patient_id, visit_date, doctor_id, charge_amount) VALUES
(1, '2024-01-15', 100, 150.00),
(2, '2024-01-20', 101, 200.00),
(1, '2024-02-10', 102, 100.00),
(3, '2024-02-15', 100, 300.00),
(4, '2024-03-01', 103, 250.00),
(2, '2024-03-05', 101, 180.00),
(3, '2024-04-10', 100, 220.00),
(1, '2024-05-14', 102, 170.00),
(5, '2024-06-20', 104, 190.00),
(6, '2024-07-01', 105, 210.00),
(5, '2024-07-15', 104, 200.00),
(6, '2024-07-20', 105, 230.00),
(7, '2024-08-10', 106, 300.00),
(8, '2024-08-15', 107, 400.00),
(7, '2024-09-01', 106, 350.00),
(9, '2024-09-12', 108, 500.00),
(10, '2024-10-05', 109, 450.00),
(8, '2024-10-20', 107, 420.00),
(9, '2024-11-11', 108, 550.00),
(10, '2024-11-25', 109, 600.00);

-- different cases using sum() 

-- total charges across all visits
select sum(charge_amount) as total_revenue from visits;

-- total charges for a specific patient 
select sum(charge_amount) as total_charges_patient1 from visits where patient_id = 1;

-- sum of charges grouped ny patient
select patient_id, sum(charge_amount) as total_charges_per_patient from visits group by patient_id order by patient_id;

-- sum of charges grouped by doctor
select doctor_id, sum(charge_amount) as total_charges from visits group by doctor_id order by total_charges desc;

-- count visitors per doctor
select doctor_id ,count(doctor_id) as visitors from visits group by doctor_id;

-- sum of revenue after a date

select sum(charge_amount) as revenue_after_july from visits where visit_date > '2024-07-31';

-- sum charges for patients with more than one visits
select sum(charge_amount) as total_charges_of_multiple_visitors from visits where patient_id in (
select patient_id from visits group by patient_id having count(*) >1);


