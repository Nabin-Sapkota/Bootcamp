create database if not exists hospital_db;

use hospital_db;
create  table if not exists patients_new (
    patient_id int primary key,
    name varchar(100),
    dob date,
    gender varchar(10),
    medical_condition varchar(255)
);

insert into patients_new values 
(1, 'John Smith', '1980-05-23', 'Male', 'Diabetes'),
(2, 'Jane Doe', '1990-07-14', 'Female', 'Hypertension'),
(3, 'Mike Johnson', '1975-11-30', 'Male', 'Diabetes'),
(4, 'Sarah Lee', '1985-03-18', 'Female', 'Asthma'),
(5, 'Tom Brown', '1992-08-02', 'Male', 'Hypertension'),
(6, 'Emily Davis', '1978-12-10', 'Female', 'Cancer'),
(7, 'Anna Wilson', '1982-01-05', 'Female', 'Diabetes'),
(8, 'James Taylor', '1995-09-20', 'Male', 'Asthma'),
(9, 'Lucy Martin', '1988-06-15', 'Female', 'Hypertension'),
(10, 'David Anderson', '1980-05-23', 'Male', 'Diabetes'),
(11, 'Chris White', '1970-02-10', 'Male', 'Heart Disease'),
(12, 'Patricia Green', '1993-04-22', 'Female', 'Cancer'),
(13, 'Robert Black', '1965-11-08', 'Male', 'Heart Disease'),
(14, 'Linda Blue', '1979-07-29', 'Female', 'Asthma'),
(15, 'Michael Yellow', '1987-10-11', 'Male', 'Cancer'),
(16, 'Barbara Purple', '1983-03-03', 'Female', 'At Risk'),
(17, 'William Red', '1976-05-25', 'Male', 'Healthy'),
(18, 'Elizabeth Pink', '1991-12-12', 'Female', 'Covid-19'),
(19, 'Joseph Orange', '1984-08-19', 'Male', 'At Risk'),
(20, 'Susan Gray', '1992-01-06', 'Female', 'Healthy');

set sql_safe_updates = 0;
update patients_new set medical_condition = 'Diabetes' where name = 'Barbara Purple';
update patients_new set medical_condition = "At Risk" where dob <= '1978-01-01';
select medical_condition from patients_new where medical_condition = 'Diabetes' or medical_condition = 'At Risk' order by medical_condition desc;

delete from patients_new where medical_condition like '%Hea%';
select * from patients_new where medical_condition = 'Healthy';

insert into patients_new values (21, 'Joseph Wilde', '1984-08-19', 'Male', 'Healthy');
select * from patients_new where patient_id = 21;

begin;
update patients_new set medical_condition = "Cancer" where patient_id = 21;
--rollback;

commit;