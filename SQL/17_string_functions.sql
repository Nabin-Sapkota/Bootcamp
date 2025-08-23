use healthcare;
select lower(name), upper(name) as uppercase from patients_table;

select left(name, 5) as firstFive from patients_table;
select right(name, 5) as lastFive from patients_table;

select substring( name, 3, 8) as substring from patients_table;

select name, length(name) as charsCount from patients_table;
select trim(name) as noSpaces from patients_table;
select ltrim(' Hello ') as noSpaces;
select rtrim(name) as noSpaces from patients_table;


select replace('John Doe', 'e', 'o') from patients_table;
select * from patients_table;

select reverse(name) from patients_table;
-- select stuff('Hello',2,3,'x') ;