-- define schema and tables
use hospital_db;
create table patients_two (
patient_id int primary key, 
name varchar(100), 
dob date, 
gender varchar(10), 
phone varchar(20));

create table providers_two (
provider_id int primary key, 
provider_name varchar(100), 
speciality varchar(50),
phone varchar(20));

create table claims_two (
claim_id int primary key, 
patient_id int, 
provider_id int, 
claim_date date, 
diagnosis_code varchar(10),
procedure_code varchar(10),
claim_amount decimal(10,2),
constraint fk_patient_two foreign key (patient_id)
references patients_two(patient_id), 
constraint fk_provider_two  foreign key (provider_id)
references providers_two(provider_id)
);

-- insert sample patients
insert into patients_two (patient_id, name, dob, gender, phone) values
(1, 'anna blue', '1985-03-22', 'female', '555-0101'),
(2, 'brian white', '1970-07-15', 'male', '555-0202'),
(3, 'catherine green', '1992-11-30', 'female', '555-0303');

-- insert sample providers
insert into providers_two (provider_id, provider_name, speciality, phone) values
(201, 'dr. smith', 'oncology', '555-1000'),
(202, 'dr. patel', 'endocrinology', '555-1100');

-- insert sample claims
insert into claims_two (claim_id, patient_id, provider_id, claim_date, diagnosis_code, procedure_code, claim_amount) values
(5001, 1, 201, '2025-01-15', 'c34', '99201', 300.00),
(5002, 2, 201, '2025-01-20', 'e11', '99202', 250.00),
(5003, 3, 202, '2025-02-01', 'e66', '99203', 400.00),
(5004, 1, 202, '2025-02-10', 'c50', '99204', 350.00);

-- list all claims with patient and provider details
select c.claim_id, p.name as patient_namee, pr.provider_name, c.claim_date, c.diagnosis_code, c.claim_amount 
from claims_two c
join patients_two p on c.patient_id = p.patient_id
join providers_two pr on c.provider_id = pr.provider_id;

-- find patients with no claims
select p.patient_id , p.name from patients_two p
left join claims_two c on p.patient_id = c.patient_id where c.claim_id is null;

-- find patients with claims less than a certain amount
select p.patient_id, p.name , c.claim_amount from patients_two p 
left join claims_two c on p.patient_id = c.patient_id where c.claim_amount <400;

-- find duplicate claims 
select patient_id, provider_id, claim_date, procedure_code, count(*) as duplicate_number
from claims_two 
group by patient_id, provider_id, claim_date, procedure_code 
having count(*) > 1;

