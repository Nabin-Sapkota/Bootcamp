use hospital_db;
-- left outer join
select p.patient_id, p.name, v.visit_date, v.diagnosis from patients p 
left outer join 
visits_one v on p.patient_id = v.patient_id;

select v.patient_id, pr.provider_id,  pr.provider_name, pr.speciality from providers pr
left outer join 
visits_one v on pr.provider_id = v.provider_id order by provider_name desc;

-- right outer join

select pr.provider_id, pr.provider_name, v.visit_id, v.visit_date, v.diagnosis
from visits_one v
right outer join providers pr on v.provider_id = pr.provider_id;

-- full outer join

select p.patient_id, p.name, v.visit_id, v.visit_date, v.diagnosis from patients_one p 
left join 
visits_one v on p.patient_id = v.patient_id
union
select p.patient_id, p.name, v.visit_id, v.visit_date, v.diagnosis from visits_one v
left join 
patients_one p on p.patient_id = v.patient_id;

-- multiple table join

select visit_id, v.visit_date, v.diagnosis, p.name as patient_name, provider_name as doctor_name, speciality
from visits_one v
join 
    patients_one p ON v.patient_id = p.patient_id
join
    providers pr on v.provider_id = pr.provider_id;
