create database hospital_db;
use hospital_db;

create table patients (
    patient_id int primary key,
    name varchar(100),
    dob date,
    gender varchar(10),
    medical_condition varchar(255)
);


insert into patients values
(1, 'alice smith', '1980-06-12', 'female', 'diabetes'),
(2, 'bob jones', '1975-04-23', 'male', 'hypertension'),
(3, 'clara johnson', '1990-11-05', 'female', 'asthma'),
(4, 'david lee', '1985-09-30', 'male', 'none'),
(5, 'eva green', '1962-02-14', 'female', 'heart disease')
;
insert into patients values 
(6, 'John Smith', '1980-05-23', 'Male', 'Diabetes'),
(7,'Jane Doe', '1990-07-14', 'Female', 'Hypertension'),
(8, 'Mike Johnson', '1975-11-30', 'Male', 'Diabetes'),
(9, 'Sarah Lee', '1985-03-18', 'Female', 'Asthma'),
(10, 'Tom Brown', '1992-08-02', 'Male', 'Hypertension'),
(11, 'Emily Davis', '1978-12-10', 'Female', 'Cancer'),
(12 ,'Anna Wilson', '1982-01-05', 'Female', 'Diabetes'),
(13, 'James Taylor', '1995-09-20', 'Male', 'Asthma'),
(14 ,'Lucy Martin', '1988-06-15', 'Female', 'Hypertension'),
(15, 'David Anderson', '1980-05-23', 'Male', 'Diabetes');

update patients set medical_condition  = "Asthma" where patient_id = 1;

delete from appointments where appointment_date > '2025-07-21';

select distinct name, medical_condition from patients;
select distinct  medical_condition from patients;

select distinct name, gender from patients;

select * from patients order by medical_condition desc;
select name from patients  order by dob desc;

select * from patients  order by gender desc , medical_condition asc;
