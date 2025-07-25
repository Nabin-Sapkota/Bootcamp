--single column index
create index idx_condition on patients_new(medical_condition);

--multi column index

create index idx_gender_condition on patients_new(gender, medical_condition);

select * from patients_new where medical_condition = 'Diabetes';

select * from patients_new order by dob desc;
