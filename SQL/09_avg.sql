-- Average value across entire table
select avg(charge_amount) as avg_charge from visits;

-- average value with where clause

select avg(charge_amount) as avg_charge_patient1 from visits where patient_id = 1;

-- grouped with group by 
select patient_id ,avg(charge_amount) as avg_charge from visits group by patient_id order by patient_id;
select doctor_id , avg(charge_amount) as avg_charge from visits group by doctor_id order by doctor_id;