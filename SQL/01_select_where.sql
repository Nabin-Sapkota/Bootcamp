create database if not exists training;
use training;
create table employees(
	eId int primary key,
    eName varchar(25),
    eAddress varchar(100),
    joiningDate date
 );
    
alter table employees modify eName varchar(25) not null;
    
INSERT INTO employees (eid, ename, eAddress, joiningdate) VALUES
(1, "Nabin Sapkota", "Chitwan", '2025-10-15'),
(2, "Sita Sharma", "Kathmandu", '2025-09-12'),
(3, "Ram Thapa", "Pokhara", '2025-08-25'),
(4, "Aarav Karki", "Butwal", '2025-07-30'),
(5, "Nisha Shrestha", "Biratnagar", '2025-07-15'),
(6, "Ravi Poudel", "Lalitpur", '2025-06-18'),
(7, "Anusha Joshi", "Dharan", '2025-06-18'),
(8, "Dipesh Basnet", "Hetauda", '2025-06-20'),
(9, "Pooja Bhandari", "Chitwan", '2025-07-10'),
(10, "Kushal Shrestha", "Bhaktapur", '2025-08-01'),
(11, "Sneha Adhikari", "Janakpur", '2025-05-12'),
(12, "Nabin Sapkota", "Chitwan", '2025-10-15'),
(13, "Krishna Dhakal", "Birgunj", '2025-08-05'),
(14, "Bikash Gautam", "Pokhara", '2025-07-20'),
(15, "Aayush Kunwar", "Itahari", '2025-06-10'),
(16, "Sarita Pandey", "Kathmandu", '2025-06-11'),
(17, "Sunil Lama", "Damauli", '2025-09-01'),
(18, "Bibek Giri", "Lalitpur", '2025-07-05'),
(19, "Sushma Subedi", "Pokhara", '2025-06-25'),
(20, "Ritesh Kharel", "Chitwan", '2025-05-30'),
(21, "Bipin Shahi", "Chitwan", '2025-05-30'),
(22, "Ritesh Kharel", "Kathmandu", '2025-05-30'),
(23, "Bina Rai", "Lalitpur", '2025-07-15'),
(24, "Rupa Sharma", "Pokhara", '2025-08-25'),
(25, "Ganesh Neupane", "Biratnagar", '2025-09-20'),
(26, "Sita Sharma", "Bhaktapur", '2025-09-12'),
(27, "Manish Tamang", "Dhangadhi", '2025-07-08'),
(28, "Deepa Acharya", "Narayangadh", '2025-07-08'),
(29, "Kriti Koirala", "Chitwan", '2025-10-15'),
(30, "Bishal Basnet", "Kathmandu", '2025-06-10'),
(31, "Sanjay Puri", "Pokhara", '2025-08-12'),
(32, "Elina Baral", "Lalitpur", '2025-08-13'),
(33, "Rachana Maharjan", "Bhaktapur", '2025-09-14'),
(34, "Sameer Kunwar", "Butwal", '2025-09-15'),
(35, "Prerana Dahal", "Chitwan", '2025-10-01'),
(36, "Kabita Bista", "Biratnagar", '2025-10-02'),
(37, "Sujan K.C.", "Hetauda", '2025-10-03'),
(38, "Laxmi Shahi", "Dang", '2025-10-04'),
(39, "Abhishek Joshi", "Nepalgunj", '2025-10-05'),
(40, "Sandhya Singh", "Janakpur", '2025-10-06'),
(41, "Nisha Shrestha", "Lalitpur", '2025-07-15'),
(42, "Rajiv Poudel", "Chitwan", '2025-06-20'),
(43, "Kavita Ghimire", "Pokhara", '2025-08-25'),
(44, "Ramesh Bhattarai", "Kathmandu", '2025-10-10'),
(45, "Ankit Shah", "Dharan", '2025-09-22'),
(46, "Sabina Magar", "Chitwan", '2025-10-15'),
(47, "Subash Basnet", "Bharatpur", '2025-06-18'),
(48, "Kabir Thapa", "Lalitpur", '2025-07-10'),
(49, "Asha Bhusal", "Itahari", '2025-06-18'),
(50, "Sunita Khadka", "Pokhara", '2025-08-05');

Select distinct eAddress , eName, joiningDate from employees;
select eAddress from employees group by eAddress having count(*) > 1;

select * from employees where eName in (select eName from employees group by eName having count(*) > 1);

select * from employees where eAddress is null or eName is null or JoiningDate is null;

select * from employees order by eName desc;
select * from employees order by joiningDate desc;


