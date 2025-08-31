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