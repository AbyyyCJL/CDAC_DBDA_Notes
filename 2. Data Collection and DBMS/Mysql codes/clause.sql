
create database ddl;
use ddl;

####################

create table employee (emp_id int(3), emp_name varchar(20), dept varchar(4), salary float);

insert into employee values(12, "Abhay", "DBDA", 23560);
insert into employee values(1, "Abhayog", "DBDA", 23560);
insert into employee values(2, "Abyyy", "DBDA", 23560);
insert into employee values(14, "Alex", "DBDA", 23560);


## if not clause 

create table if not exists employee (emp_id int(3), emp_name varchar(20), dept varchar(4), salary float);

select * from employee;

create table emp_new_using_select_navin as select * from employee;

select * from emp_new_using_select_navin;

create table navin_tab as select * from emp_new_using_select_navin where 1=0;
select * from navin_tab;

create table emp_new_using_select_2 as select * from employee where emp_id = 14;

select * from emp_new_using_select_2;

################ ALTER ###############

create table employee (emp_id int(3), emp_name varchar(20), dept varchar(4), salary float);

alter table employee add column age int(3);

desc employee;

alter table employee add column project varchar(20);

desc employee;

#############

alter table employee modify column salary decimal;

desc employee;

alter table employee modify column project varchar(70);

desc employee;

alter table employee modify employee_name varchar(80) not null;


###################

alter table employee change emp_name employee_name varchar(80);

desc employee;

###############

alter table employee drop project;

desc employee;

#####################

alter table employee add constraint unique(emp_id);

desc employee;

#####################

alter table employee alter column salary set default 25000;
desc employee;

#####################

alter table employee add constraint check (salary > 0);
desc employee;

insert into employee values (22, "Abhay", "DBDA", 19473, 23);
select * from employee;

#########################

alter table employee add primary key (emp_id);
desc employee;


#########################

alter table employee add column dept_id int(3);

desc employee;

create table department(dept_id int(3) PRIMARY KEY, dept_name varchar(20), location varchar(20));

desc employee;

desc department;

alter table employee add constraint foreign key (dept_id) references department(dept_id);

desc employee;

#########################

alter table employee rename to new_emp;

show tables;