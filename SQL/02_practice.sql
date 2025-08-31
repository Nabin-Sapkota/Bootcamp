use healthcare;

create table claims(
claim_id int primary key, 
member_id int, 
provider_id int, 
service_date date, 
diagnosis_code varchar(10),
procedure_code varchar(10),
claim_amount decimal(10,2),
paid_amount decimal(10,2),
claim_status varchar(20)
);

INSERT INTO claims VALUES
(201, 101, 1001, '2025-02-01', 'E11', '99213', 200.00, 150.00, 'Approved'),
(202, 102, 1002, '2025-02-02', 'I10', '99214', 500.00, 400.00, 'Approved'),
(203, 103, 1001, '2025-02-02', 'J20', '99213', 1200.00, 0.00, 'Denied'),
(204, 104, 1003, '2025-02-05', 'E11', '83036', 2500.00, 0.00, 'Denied'),
(205, 101, 1001, '2025-02-01', 'E11', '99213', 200.00, 150.00, 'Duplicate'),
(206, 105, 1004, '2025-02-07', 'C50', '19120', 12000.00, 10000.00, 'Approved'),
(207, 106, 1002, '2025-02-08', 'I10', '93000', 100.00, 80.00, 'Approved');


-- identify high value claims
select claim_id, member_id, claim_amount from claims 
where claim_amount >= 5000;

-- identify duplicate claims
select member_id, service_date, procedure_code, count(*) as duplicate_count
from claims
group by member_id, service_date, procedure_code
having count(*) > 1;

-- total claim amount by provider
select provider_id, sum(claim_amount) as total_claim_amount
from claims 
group by provider_id;

-- approval vs denial rate
select claim_status, count(*) as total
from claims
group by claim_status;

-- find top three providers with highest claims
select provider_id, sum(claim_amount) as total 
from claims 
group by provider_id order by total desc limit 3;

-- average paid amount for each diagnosis
select diagnosis_code, avg(claim_amount) as average
from claims 
group by diagnosis_code;

-- find members who have  claims in feb 2025 with count
select member_id, count(*) as total_claims 
from claims 
where service_date >= '2025-02-01' and service_date < '2025-03-01'
group by member_id;

-- alternate way
select member_id, count(*) as total_claims 
from claims 
where extract(month from service_date) = 2
  and extract(year from service_date) = 2025
group by member_id;

-- find claims where paid amount is zero or denied
select * from claims where paid_amount = 0;
