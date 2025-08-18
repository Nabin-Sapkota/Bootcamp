use healthcare;
create table if not exists ptable_one(
id int primary key,
name varchar(50),
age int, 
insurance_id int
);

insert into ptable_one values
(1, 'Alice Johnson', 34, 101),
(2, 'Bob Smith', 45, 102),
(3, 'Charlie Brown', 29, NULL),
(4, 'Diana Prince', 52, 101),
(5, 'Ethan Hunt', 39, 103);

create table ctable_one (
id int primary key,
patient_id int, 
amount decimal(10,2),
status varchar(20),
claim_date date
) ;

insert into ctable_one values
(201, 1, 250.00, 'Approved', '2023-01-12'),
(202, 1, 120.00, 'Pending', '2023-02-05'),
(203, 2, 600.00, 'Rejected', '2023-02-15'),
(204, 3, 450.00, 'Approved', '2023-03-01'),
(205, 5, 900.00, 'Approved', '2023-03-10');

create table itable_one(
id int primary key,
provider_name varchar(50)
);

insert into itable_one values 
(101, 'Blue Cross'),
(102, 'United Health'),
(103, 'Aetna'),
(104, 'Cigna');

-- example queries
-- find total claim amount per patient

select p.name, sum(c.amount) as total_claims from ptable_one p 
join ctable_one c on p.id = c.patient_id group by p.name;

select c.status , avg(c.amount) as avg_claim from ctable_one c 
group by c.status;

-- find patients with insurance andd their total claims
select p.name, i.provider_name, sum(c.amount) as total_claims from ptable_one p
left join itable_one i on p.insurance_id = i.id 
left join ctable_one c on p.id = c.patient_id  where i.provider_name is not null 
group by p.name, i.provider_name having sum(c.amount) is not null;

-- find insurance providers with no claims
select i.provider_name from itable_one i 
left join ptable_one p on i.id = p.insurance_id 
where p.id is null;
