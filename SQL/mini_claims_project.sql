-- mini project 
-- high value claims report -- claims > 5000
select * from claims where claim_amount > 5000;

-- duplicate claim report Member ID + Service Date duplicates

select member_id, service_date, count(*) as count
from claims 
group by member_id, service_date having count > 1;


-- denial report claims with paid amount = 0

select * from claims where paid_amount = 0;

-- provider summary - total claims + avg amount per providers

select provider_id, count(*) as total_claims, avg(paid_amount) as paid_avg 
from claims group by provider_id order by paid_avg desc;

-- provider submits multiple claims for same member, same proccedure date how do you catch it

-- run a duplicate detection query
select member_id, service_date, procedure_code, count(*) as total
from claims
group by member_id, service_date, procedure_code
having total > 1;