create database if not exists healthcare;
use healthcare;
create table patients_table(
id int primary key,
name varchar(30),
dob date, 
insurance_id int
);

insert into patients_table (id, name, dob, insurance_id)values 
(1, 'John Doe', '1980-05-14', 101),
(2, 'Jane Smith', '1990-11-23', 102),
(3, 'Alice Johnson', '1975-07-30', 103),
(4, 'Bob Brown', '1988-02-12', NULL),
(5, 'Mary Davis', '1995-09-09', 105);

create table claims_table (
id int primary key,
patient_id int,
amount decimal(10,2),
claim_date date,
status varchar(20)
);
insert into claims_table (id, patient_id, amount, claim_date, status) values 
(201, 1, 500.00, '2024-07-01', 'Approved'),
(202, 2, 1200.50, '2024-07-03', 'Pending'),
(203, 3, 250.75, '2024-07-05', 'Denied'),
(204, 1, 300.00, '2024-07-10', 'Approved'),
(205, 5, 1500.00, '2024-07-12', 'Approved');

create table insurance_table(
id int primary key,
provider_name varchar(50),
plan_type varchar(20)
);

insert into insurance_table values
(101, 'BlueCross', 'HMO'),
(102, 'UnitedHealth', 'PPO'),
(103, 'Aetna', 'EPO'),
(104, 'Cigna', 'HMO');

-- inner join (only matching patients anc claims)
select p.name, c.id, c.amount, c.status from patients_table p
inner join claims_table c 
on  p.id = c.patient_id order by c.amount desc;
-- shows patients who have submitted claims

-- left join (all patients even if no claims)
select p.name, c.id, c.amount, c.status from patients_table p
left join claims_table c
on p.id = c.patient_id order by c.id; -- useful to find patients who have never submitted a claim

-- right join (all claims, even if patients not found)
select p.name, c.id, c.amount, c.status from patients_table p 
right join claims_table c 
on p.id = c.patient_id; -- helps detect claims that don't have a matching patient (possible data entry issues)

-- practice questions: 
-- find all patients who have at least one claim
select distinct p.name from patients_table p 
inner join claims_table c on p.id = c.patient_id;

-- list all patients who have never submitted claim
select p.name from patients_table p
left join claims_table c 
on p.id = c.patient_id where c.id is null;

-- Get claim details along with patient names where claim status is Approved.
select  distinct p.name, c.status from patients_table p 
left join claims_table c 
on p.id = c.patient_id where c.status = "Approved"; 

-- Find all claims that do not have a corresponding patient record 
select * from claims_table c 
left join patients_table p 
on c.patient_id = p.id where p.id is null;