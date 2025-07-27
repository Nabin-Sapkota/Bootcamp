-- count 
use hospital_db;
select count(*) from patients_new; -- count all rows in the table

select count( distinct medical_condition) from patients_new; -- count distinct medical condition in table


-- different cases 
-- counting all rows 
select count(*)  as total_patients from patients_new;

-- counting non null values
select count(medical_condition) as patient_with_condition from patients_new; -- null values in the specified column are excluded

-- counting distinct values
select count(distinct name) as distinct_name from patients_new;

-- counting with a where clause Conditional counting
select count(*) as female_patients from patients_new where gender = 'Female';
select count(*) as female_patients from patients_new where gender = 'Male';
select count(distinct name) as male_patients from patients_new where gender = 'Male';
select count(distinct name) as male_patients from patients_new where gender = 'Female';

select count(*) as diabetic_patients from patients_new where medical_condition = 'Diabetes';

-- counting grouped results group by 
select medical_condition as disease , count(*) as patients_count from patients_new group by medical_condition order by disease;



