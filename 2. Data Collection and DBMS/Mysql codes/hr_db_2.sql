
select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from locations;
select * from regions;

update employees set email='cdac@gmail.com' where employee_id=100;

update employees set salary = salary + (salary*.10);
set sql_safe_updates = 0;
update employees set salary = salary + (salary*.10);
set sql_safe_updates = 1;

CREATE TABLE IF NOT EXISTS `regions_check` (
  `REGION_ID` decimal(5,0) NOT NULL,
  `REGION_NAME` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`REGION_ID`),
  UNIQUE KEY `sss` (`REGION_NAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


INSERT INTO `regions_check` (`REGION_ID`, `REGION_NAME`) VALUES
('1', 'Europe\r'),
('2', 'Americas\r'),
('3', 'Asia\r'),
('4', 'Middle East and Africa\r');


select * from regions_check;
delete from regions_check;

rename table regions_check to check_delete;
show tables;

## INSERT

insert into check_delete values('1', 'europe');
select * from check_delete;

insert into check_delete(region_id) values ('2');

insert into check_delete values ('3', 'USA'), ('4', 'UK'), ('5','ASIA');

# Insert using select

delete from check_delete where region_name = 'asia';
delete from check_delete where region_name = 'europe';
delete from check_delete where region_id = '2';

delete from check_delete;

insert into check_delete (region_id, region_name) select * from regions; 


select * from check_delete;

desc employees;
describe employees;

show index from employees;

select * from information_schema.columns 
where table_schema='hr_aug_24' and table_name='employees';

explain select * from employees;

check table employees;

show table status;

show tables;
show databases;

show columns from employees;

#alias
select first_name, salary+salary*.15 as incremented_salary from employees;
select * from employees;


select email email_address from employees;


## Temporary table

create temporary table emp_temp as select * from employees;

select * from emp_temp;

## to see the table on the database

select * from information_schema.tables 
where table_schema='hr_aug_24' and table_type='temporary';

-- show tables like 'emp_temp';

# where

select * from employees where employee_id = 110;

# order by

select * from employees order by first_name; # ascending

select * from employees order by first_name desc; # descending

## RELATIONAL Operations in MySQL

# 1] 

select employee_id, first_name, salary, department_id from employees where salary >= 5000;

select employee_id, first_name, salary, department_id from employees where department_id > 20;

select employee_id, first_name, salary, department_id from employees where salary < 3000;

select employee_id, first_name, salary, department_id from employees where department_id <= 20;


select * from jobs where MIN_SALARY < 5000;

## not equal

select * from countries where region_id <> 4;
select * from countries where region_id != 1;


# Logical ops
select * from employees;
select first_name, last_name, department_id from employees where first_name= 'Alexander' and department_id='60';

# write a query to find data of employee whose fname is 'john' and salary is '1000'

select * from employees where first_name= 'John' and salary = '1000';

# write a query to find data of employee whose fname is 'david' and salary is > 400

select * from employees where first_name= 'David' and salary > '400';

## OR logical

select * from employees where first_name = 'John' or last_name = 'Austin';

select * from employees;

select * from employees where job_id = 'AD_PRES' or department_id = '90';

select * from employees where job_id = 'AD_PRES' or (department_id = 90 and department_id = 100);
select * from employees where job_id = 'AD_PRES' or (department_id = 90 or department_id = 100);

# NOT Logical

select * from employees;

select * from employees where not (department_id = 90 or department_id = 100) order by department_id;

select * from employees where not manager_id = 205 order by manager_id desc;

select * from departments;

select * from departments where (department_name='IT' or location_id = '1400');
select * from departments where (department_id=10 or manager_id=100);
select * from departments where (department_id=10 or manager_id=100) and (department_name='IT' or location_id = '1400');

select * from departments where not (department_name='IT' or location_id = '1400') and (department_id=10 or manager_id=100);


select * from departments where (department_id = 10 and manager_id = 100); #null
select * from departments where not (department_name = 'IT' or location_id = 1400);

select * from departments where not (department_name = 'IT' or location_id = 1400) or (department_id = 10 and manager_id = 100);


## IN operator

select * from employees where department_id in(10,20,30,40,100,120);

select * from employees where job_id in('AD_ASST','MK_MAN','AD_VP');

select * from employees where first_name not in ('Jennifer', 'Neena', 'Lex', 'Steven');

select * from employees where manager_id not in (101, 102, 103, 100) order by manager_id;

########## Between ##############

select* from employees where salary between 1000 and 10000;

select * from employees where first_name between 'a' and 'j' order by first_name;

select * from employees where salary between 1800 and 1000;

# LIKE ops

select * from employees where first_name like 'a%';

select * from employees where first_name like '%h';

select * from employees where last_name like '%aa%';

select * from employees where last_name like '__%i';

select * from employees where last_name like '____%a';

# NOT LIKE

select * from employees where last_name not like '%aa%';

select * from employees where last_name not like '%at';

select * from employees where employee_id not like '%0';

select * from employees where manager_id is not null;

# is null

select * from employees where department_id is null;

#################################################################
# String Function

select first_name, last_name , concat(first_name, ' ', last_name) as full_name from employees;


# instr

select first_name, instr(first_name, 'A') as first_occurrance_of_A from employees;

select first_name, instr(first_name, 'en') as first_occurrance_of_A from employees;

# find emp whose last name contains 'a' also display full name, empid and position of 'a' in their last name 

select employee_id,  concat(first_name, ' ', last_name) full_name, instr(last_name, 'a') as pos_of_a from employees where employees.last_name like '%a%';

# length
select first_name, length(first_name) as length_of_first_name_in_bytes from employees;

select * from employees;
select first_name, last_name, salary from employees where length(first_name) < 4;

# char_length

select first_name, char_length(first_name) as length_of_first_name_in_no_of_characters from employees;


# right

select first_name, right(first_name, 3) last_3_chars_of_fname from employees; 

# left

select first_name, left(first_name, 3) first_3_chars_of_fname from employees; 

# Q] extract last 4 digit of a phone no of emp and display it emp id, fullname, phoneno and extracted pasrt of phone no
desc employees;
select employee_id, concat(first_name, ' ', last_name) full_name, phone_number, right(phone_number, 4) last_4_digits from employees;


## substrings

select employee_id , concat(first_name, ' ', last_name) fullname, substr(first_name, 3) from employees;

select employee_id , concat(first_name, ' ', last_name) fullname, substr(first_name, 2, 4) from employees;

select employee_id , concat(first_name, ' ', last_name) fullname, substr(first_name, -2) from employees;


# substring index

select employee_id , concat(first_name, ' ', last_name) fullname, substring_index2(first_name, " ", 2) from employees; ## error yet to solve


# trim 

select trim("        Hello     ");
select trim("hello									");
select ltrim("     HELL             ");
select rtrim("        HELLOO         	");


# upper case and lower case

select lower("ABHAY");
select upper("abhay");

select upper(concat(first_name, " ", last_name)) as full_name from employees;

select lower(concat(first_name, " ", last_name)) as full_name from employees;

#case

select ucase(concat(first_name, " ", last_name)) as full_name from employees;

select lcase(concat(first_name, " ", last_name)) as full_name from employees;

# strcmp

select strcmp('cdac', 'CDAC_MUMBAI');
select strcmp('cdac', 'CDac');
select strcmp('cdac mumbai', 'CDAC MUMBAI');
select strcmp('cdac', 'cdac');

# locate : find position of substring inside a string, gives o/p as 1 if present

select locate("Stev", first_name) from employees ;
select first_name, locate("ELLEN", first_name) from employees order by first_name;


# find_in_set : find the position of the string within the column

select * from employees where find_in_set("AD_VP", job_id);

# reverse

select reverse(first_name) from employees;

# replace

select replace(first_name, 'll', 'abyyy') from employees;


############## Aggregate functions ########################


select sum(salary) from employees;
select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select count(salary) from employees;

select count(*) from employees;

select count(distinct(department_id)) from employees;

select count(*) from employees where salary > 1000;


# group_concat()

select abs(-10); # absolute - remove -ve
select ceil(4.3); # ceil - next max int
select floor(4.3); # floor - prev max int

select round(4.166552, 3);
select round(4.166552, 2);

select sqrt(9); # sqrt - calculates square root

select power(2, 3); # power - calculates exponential values

select mod(10, 3);
select mod(30, 2);
select mod(13, 5);

select greatest(10,2,40,32);
select least(10,2,40,32);

select coalesce(first_name, 'NA') from employees; # replaces null values with 'NA'



