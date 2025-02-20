create database student;
use student;

############### CONSTRAINTS ###############

create table uniq_con(user_name varchar(50), passwd varchar(20));

insert into uniq_con values("Abhay", "abyyyog@123");
insert into uniq_con values("Abhay", "abyyyog@123");
select * from uniq_con;


create table uniq_const(user_name varchar(50) unique, passwd varchar(20));
insert into uniq_const values("Abhay", "abyyyog@123");
insert into uniq_const values("Abhay", "abyyyog@123"); #no insertion cuz of UNIQUE constraint

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
create table stud_data(s_id int(5) unique, s_name varchar(20), course_id int(5));

insert into stud_data values (1, "Aayush", 201);
insert into stud_data values (2, "Abhay", 201);
insert into stud_data values (2, "Abhisheik", 201);

#######################################################################

create table uniq_ex (s_id int, 
s_name varchar(20), course_id varchar(20), mob_no int(10),
unique(s_id, mob_no));

insert into uniq_ex values(1, "Aayush", "PG-DBDA", 0123456789);

insert into uniq_ex values(1, "Aayush", "PG-DBDA", 0123456789);

insert into uniq_ex values(2, "Aayush", "PG-DBDA", 0123456789);

select * from uniq_ex;

create table uniq_ex2 (s_id int unique, 
s_name varchar(20), course_id varchar(20), mob_no int(10) unique);

insert into uniq_ex2 values(1, "Aayush", "PG-DBDA", 123456789);

insert into uniq_ex2 values(1, "Aayush", "PG-DBDA", 123456789);

insert into uniq_ex2 values(2, "Aayush", "PG-DBDA", 123456789);

insert into uniq_ex2 values(3, "Abhay", "PG-DBDA", 789456123);


select * from uniq_ex2;

####################### NOT NULL ########################

create table not_null_1(s_name varchar(20) not null, s_id int(3) not null, 
hostel_room_no int(3));

insert into not_null_1 values("Abhay", 102, 208);
insert into not_null_1 values("Anup", 123, null);
insert into not_null_1 values("Alex", null, 205);

select * from not_null_1;

#################### Primary Key Constraint ######################

create table prim_key_1(s_id int(3) unique not null, 
s_name varchar(20) not null, age int not null);

insert into prim_key_1 values(102, "Abhay", 23);
insert into prim_key_1 values(102, "Abhay", 23); #error
insert into prim_key_1 values(102, "Anup", null); #error

insert into prim_key_1 values(null, "Viraj", 40); #error
insert into prim_key_1 values(140, null, 40); #error


select * from prim_key_1;

#####################################
# self study
create table prim_key_2(s_id int(3) unique not null, 
s_name varchar(20) unique not null, age int not null);

###########################

create table prim_key_3(s_id int(3) primary key, 
s_name varchar(20) not null);

insert into prim_key_3 values (101, "Abhay Patil");
insert into prim_key_3 values (102, "Anup Shelar");
insert into prim_key_3 values (101, "Viraj Shirke");
insert into prim_key_3 values (null, "Alex");
insert into prim_key_3 values (120, null);

select * from prim_key_3;

################# Composite Key #################

-- create table comp_key_1(s_id int(3), s_name varchar(20), course_id int(3));

create table comp_key_1(address varchar(50), 
street_name varchar(20), 
pincode int(6), primary key(address, pincode));


insert into comp_key_1 values('galli no 420', "red street", "425136");
insert into comp_key_1 values('galli no 420', "red street", "425136");
insert into comp_key_1 values('galli no 150', "red street", "425136");

select * from comp_key_1;

#######################################################

create table uniq_pk_1(s_id int primary key, 
s_name varchar(20) not null, mobile_no int(10) unique, email varchar(50) unique);

desc uniq_pk_1;

##################### Foreign Key #########################


create table course_table (course_id int primary key, s_id int, course_name varchar(20), faculty_name varchar(20));

create table stud_table (s_id int primary key, s_name varchar(30), course_id int, faculty_name varchar(20), 
foreign key (course_id) references course_table(course_id));


desc stud_table;

########################### Default constraint ################################

create table def_1(s_id int, s_name varchar(20), course_id int, subjects varchar(20) default 'Unassigned');

insert into def_1 values(101, "Abhay", 401, "Science");
insert into def_1 values(102, "Anup", 402, null);
insert into def_1 (s_id, s_name, course_id) values(103, "Viraj", 402);

select * from def_1;

################

create table def_2 (s_id int, s_name varchar(20), subjects varchar(20) default 'PG-DBDA');

insert into def_2 (s_id, s_name) values(2, "Abhay");

select * from def_2;


############## CHECK Constraint ####################

create table chek_1 (order_id int(3), order_name varchar(20), quantity int check (quantity > 0)) ;

insert into chek_1 values (101, "Chicken Biryani", 2);
insert into chek_1 values (104, "Salad", 0);
insert into chek_1 values (107, "Butter Chicken", 2);

select * from chek_1;


create table chek_2 (username varchar(20) check (char_length(username) <= 8), password varchar(20));

insert into chek_2 values("Abhay", "asdfas");
insert into chek_2 values("Abhay Patil", "njnfdv"); #error

########################

create table ex1 (s_name varchar(20), age int(3) check(age >= 18));

insert into ex1 values ("Abhay", 20);
insert into ex1 values ("Anup", 15);

select * from ex1;

################################################

create table chek6 (user_name varchar(20), check (user_name REGEXP '^[A-Za-z]+$'));

insert into chek6 values ('cdac0');


###################################################

create table chek7 (user_name varchar(20), email varchar(20), check (user_name REGEXP '^[A-Za-z]+$'), 
check (email like '%@%'));

insert into chek7 values ('cdac', 'afsagasc');

insert into chek7 values ('cdac', 'askbcas@gmail.cm');

select * from chek7;

######################################################

create table chek9 (username varchar(20), email varchar(50), gender varchar(10), 
check(gender in ('Male', 'Female', 'Other')));

insert into chek9 values("Abhay", "asodjbc@gmail.com", 'Male');
insert into chek9 values("Viraj", "asasdfavbc@gmail.com", 'Female');
insert into chek9 values("Anup", "ohiovsc@gmail.com", 'Other');
insert into chek9 values("Alex", "ohiovsc@gmail.com", '6');
insert into chek9 values ("Aosnc", "aljdbv@gmail.ciom", "male");

select * from chek9;