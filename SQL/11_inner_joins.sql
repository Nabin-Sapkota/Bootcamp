use hospital_db;
-- patients table
create table patients_one(
patient_id int primary key, 
name varchar(50),
gender varchar(10),
dob date );

-- providers table
create table providers (
provider_id int primary key, 
provider_name varchar(100),
speciality varchar(50));

-- visits table with foreign key references
create table visits_one(
visit_id int primary key, 
patient_id int, 
provider_id int, 
visit_date date,
diagnosis varchar(50),
foreign key (patient_id) references patients_one(patient_id),
foreign key (provider_id) references providers(provider_id));

-- insert patients 
insert into patients_one(patient_id, name, gender, dob) values
(1, 'Alice Smith', 'Female', '1980-04-21'),
(2, 'Bob Jones', 'Male', '1965-01-10'),
(3, 'Carol White', 'Female', '1974-06-30'),
(4, 'David Brown', 'Male', '1990-11-12'),
(5, 'Eva Green', 'Female', '2002-08-01');

-- insert providers
insert into providers (provider_id, provider_name, speciality) values
(1, 'Dr. Lee', 'Cardiologist'),
(2, 'Dr. Kumar', 'Pulmonologist'),
(3, 'Dr. Johnson', 'General Practitioner');

-- Insert Visits
insert into visits_one (visit_id, patient_id, provider_id, visit_date, diagnosis) values
(1, 1, 1, '2025-06-05', 'Hypertension'),
(2, 2, 3, '2025-06-10', 'Diabetes'),
(3, 3, 2, '2025-07-01', 'Asthma'),
(4, 2, 1, '2025-07-15', 'Regular Checkup'),
(5, 5, 3, '2025-07-20', 'Flu'),
(6, 1, 1, '2025-07-25', 'Regular Checkup');

-- inner join 
-- list all visits with patient names
select v.visit_id, p.name as patient_name, v.visit_date, v.diagnosis from visits_one v 
inner join patients_one p on v.patient_id = p.patient_id; 
-- this visits_one and patients_one and returns only visits with valid patient records

-- list visits with provider names and diagnosis
select v.visit_id , pr.provider_name, v.visit_date, v.diagnosis from visits_one v
inner join providers pr on v.provider_id = pr.provider_id;

-- list visits with patient name, provider name and diagnosis
select v.visit_id, p.name as patient_name, pr.provider_name, v.visit_date, v.diagnosis from visits_one v 
inner join patients_one p on v.patient_id = p. patient_id
inner join providers pr on v.provider_id = pr.provider_id;

-- find all visits by female patients
select v.visit_id, p.name as patient_name, v.visit_date, v.diagnosis from visits_one v
inner join patients_one p on v.patient_id = p.patient_id
where p.gender = 'Female';

-- get number of visits per patient
select p.name , count(v.visit_id) as visit_count from patients_one p
inner join visits_one v on p.patient_id = v.patient_id
group by p.name;

-- get provider wise patient count (how many different patientss each provider has seen)
select pr.provider_name, count(distinct v.patient_id) as unique_patients from providers pr 
inner join visits_one v on pr.provider_id = v.provider_id 
group by pr.provider_name;