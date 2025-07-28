-- having queries

-- number of patient per conditions , showing only conditions with multiple patients
select medical_condition, count(*) num_patients from patients group by medical_condition having count(*) > 1;

-- count an average charges for female patients by condition with multiple patients
select medical_condition, avg(age) as avg_age, count(*) as count from patients_new_db where gender = "Female"
group by medical_condition having count(*) > 1;