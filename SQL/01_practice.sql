-- create a database
create database healthcare_db;
use healthcare_db;

-- create a eligibility table
create table eligibility(
member_id int primary key, 
member_name varchar(100),
dob date, 
gender varchar(10), 
plan_id varchar(10), 
coverage_start date, 
coverage_end date,
status varchar(20)

);

-- insert sample data

INSERT INTO eligibility (member_id, member_name, dob, gender, plan_id, coverage_start, coverage_end, status)
VALUES
(101, 'John Doe', '1985-05-12', 'M', 'PLAN_A', '2025-01-01', '2025-12-31', 'Active'),
(102, 'Jane Smith', '1990-07-23', 'Female', 'PLAN_B', '2025-02-01', '2025-12-31', 'Active'),
(103, 'Robert Lee', '1975-03-15', 'Male', 'PLAN_A', '2024-01-01', '2024-12-31', 'Inactive'),
(104, 'Alice Brown', '2000-11-05', 'F', 'PLAN_C', '2025-03-01', '2025-06-30', 'Active'),
(105, 'Michael Scott', '1980-02-20', 'M', 'PLAN_B', '2025-01-01', NULL, 'Active'), -- Missing coverage_end
(106, 'Emily Davis', '1995-09-17', 'FEMALE', 'PLAN_A', '2025-01-01', '2025-12-31', 'Active'),
(107, 'David Wilson', '1988-04-09', 'M', 'PLAN_B', '2025-01-01', '2025-12-31', 'Active'),
(108, 'Sophia Taylor', '2010-12-12', 'F', 'PLAN_A', '2025-01-01', '2025-12-31', 'Active'),
(109, 'John Doe', '1985-05-12', 'Male', 'PLAN_B', '2025-01-01', '2025-12-31', 'Active'); -- Duplicate member

-- find all active members under a plan

select member_id , member_name, plan_id from eligibility 
where status = 'Active';

-- find members whose coverage has expired

select member_id, member_name, plan_id from eligibility 
where coverage_end < current_date();

-- count number of members in each plan
select plan_id, count(member_id) as total from eligibility
group by plan_id;

-- find duplicate enrollment (same members in mulitple plans)
select member_name, dob, count(distinct plan_id) as plan_count
from eligibility 
group by member_name, dob
having count(distinct plan_id) > 1;

-- identify records with missing coverage_end dates

select member_id, member_name, plan_id from eligibility 
where coverage_end is null;

-- standardize gender values to just M and F, 
update eligibility 
set gender = case
when gender in ('M', 'Male', 'Male') then 'M'
When gender in ('F', 'Female', 'Female') then 'F'
else gender
end
where member_id >=0;

