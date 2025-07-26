-- working with database

create database if not exists hospital_db;
use hospital_db;
create table if not exists patients_db(
	id int primary key auto_increment ,
    name varchar(50),
    dob date,
    gender varchar(10),
    medical_condition varchar(100)
    );
    
insert into patients_db(name, dob, gender, medical_condition) values
('John Smith', '1980-05-23', 'Male', 'Diabetes'),
('Jane Doe', '1990-07-14', 'Female', 'Hypertension'),
('Mike Johnson', '1975-11-30', 'Male', 'Diabetes'),
('Sarah Lee', '1985-03-18', 'Female', 'Asthma'),
('Tom Brown', '1992-08-02', 'Male', 'Hypertension'),
('Emily Davis', '1978-12-10', 'Female', 'Cancer'),
('Anna Wilson', '1982-01-05', 'Female', 'Diabetes'),
('James Taylor', '1995-09-20', 'Male', 'Asthma'),
('Lucy Martin', '1988-06-15', 'Female', 'Hypertension'),
('David Anderson', '1980-05-23', 'Male', 'Diabetes'),
('Chris White', '1970-02-10', 'Male', 'Heart Disease'),
('Patricia Green', '1993-04-22', 'Female', 'Cancer'),
('Robert Black', '1965-11-08', 'Male', 'Heart Disease'),
('Linda Blue', '1979-07-29', 'Female', 'Asthma'),
('Michael Yellow', '1987-10-11', 'Male', 'Cancer'),
('Barbara Purple', '1983-03-03', 'Female', 'At Risk'),
('William Red', '1976-05-25', 'Male', 'Healthy'),
('Elizabeth Pink', '1991-12-12', 'Female', 'Covid-19'),
('Joseph Orange', '1984-08-19', 'Male', 'At Risk'),
('Susan Gray', '1992-01-06', 'Female', 'Healthy');

-- retrieve all female patients with unique medical condition sorted alphabetically

select distinct medical_condition from patients_new where gender = 'Female' order by medical_condition;

-- find all patients born before 1985 sorted by date of birth ascending

select * from patients_new where dob < '1985-01-01' order by dob asc;

set sql_safe_updates = 0;
update patients_new set medical_condition = 'At Risk' where dob < '1980-01-01';

-- date_sub(curdate(), intercal 45 year)


-- delete table if there is no medical condition

delete from patients_db where medical_condition = null;

-- Create indexes on columns medical_condition and a composite index on (gender, medical_condition)

create index idx_condition on patients_db(medical_condition);
create index idx_gender_condition on patients_db(gender, medical_condition);

explain patients_db;

-- find duplicate count
insert into patients_db(name, dob, gender, medical_condition) values
('John Smith', '1980-05-23', 'Male', 'Diabetes'),
('Jane Doe', '1990-07-14', 'Female', 'Hypertension'),
('Mike Johnson', '1975-11-30', 'Male', 'Diabetes');

select name , count(*) as same_name from patients_db where gender = 'Male' group by name;

