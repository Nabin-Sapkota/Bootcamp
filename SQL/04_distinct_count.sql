insert into patients_new values(26, 'John Smith', '1980-05-23', 'Male', 'Diabetes');
insert into patients_new values(27, 'John Smith', '1980-05-23', 'Male', 'At risk');

select distinct patient_id, name from patients_new;
select count(distinct medical_condition) from patients_new;
select distinct gender from patients_new where dob > '1995-01-01';
select count(distinct medical_condition) from patients_new where medical_condition = 'Asthma'or medical_condition = 'At Risk';

