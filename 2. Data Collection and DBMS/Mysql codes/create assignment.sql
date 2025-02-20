
create database assignment;
use assignment;

# 1] Write a SQL statement to create a simple table of countries including columns country_id,country_name and region_id.

create table countries (country_id int(5), country_name varchar(50), region_id int(5));

# 2] Write a SQL statement to create a simple table of countries including columns country_id,country_name and region_id which already exists.

create table if not exists countries (country_id int(5), country_name varchar(50), region_id int(5));

# 3] Write a SQL statement to create the structure of a table dup_countries similar to countries.

create table dup_countries as select * from countries where 1=0;

# 4] Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries.

create table dup_countries as select * from countries;

# 5] Write a SQL statement to create a table where countries set a constraint NULL.

create table countries_2 (country_id int(3) null, country_name varchar(30), beach_len float null);
desc countries_2;

# 6] Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeds the upper limit 25000.

create table jobs (job_id int(3), job_title varchar(20), min_salary float, max_salary float, check(max_salary > 25000));

# 7] Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

CREATE TABLE countries_3 (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(255) NOT NULL,
    region_id INT,
    CONSTRAINT chk_country_name CHECK (country_name IN ('Italy', 'India', 'China'))
);



# 8] Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure 
# that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

CREATE TABLE job_histry (
    employee_id INT NOT null,
    start_date DATE NOT NULL,
    end_date VARCHAR(10) NOT NULL,
    job_id INT NOT NULL,
    department_id INT NOT NULL,
    CONSTRAINT chk_end_date_format CHECK (end_date LIKE '__/__/____')
);
    
insert into job_histry values(1,'2024/10/10','10/10/2034',55,9558);

select * from job_histry;

# 9] Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

create table countries_4(
	country_id int unique,
    country_name varchar(50),
    region_id int
);

insert into countries_4 values(1, 'India', 23);
insert into countries_4 values(1, 'China', 23);
insert into countries_4 values(3, 'India', 14);
select * from countries_4;

# 10] Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

create table jobs (
	job_id int,
    job_title varchar(20) default '',
	min_salary int default 8000,
    max_salary int default null
);

insert into jobs values (1, "teacher", 7500, 25999);
insert into jobs values (2, "constructer", 8500, default);
insert into jobs values (3, "carpenter", default, 30000);
select * from jobs;

# 11] Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that the country_id column will be a key field which will not contain any duplicate data at the time of insertion.

create table countries_5 (
	country_id int primary key,
    country_name varchar(50),
    region_id int
);


# 12] Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the column country_id will be unique and store an auto incremented value.

create table countries_6(
	country_id int auto_increment unique,
    country_name varchar(50),
    region_id int
);

insert into countries_6 (country_name, region_id) values ("India", 24);
insert into countries_6 (country_name, region_id) values ("Russia", 4);
insert into countries_6 (country_name, region_id) values ("America", 2);
select * from countries_6;

# 13] Write a SQL statement to create a table countries including columns country_id, country_name and region_id and make sure that the combination of columns country_id and region_id will be unique.

create table countries_7(
	country_id int ,
    country_name varchar(50),
    region_id int,
    primary key(country_id, region_id)
);

insert into countries_7 values (1, "India", 24);
insert into countries_7 values (2, "Russia", 4);
insert into countries_7 values (3, "America", 2);
insert into countries_7 values (3, "Brazil", 2);

# 14] Write a SQL statement to create a table job_history including columns employee_id, start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

create table jobs_2 (
	job_id varchar(10) primary key,
    job_title varchar(35), 
    min_salary decimal(6,0),
    max_salary decimal(6,0)
);



CREATE TABLE job_histry_2 (
    employee_id INT primary key,
    start_date DATE NOT NULL,
    end_date VARCHAR(10) NOT NULL,
    job_id varchar(10),
    department_id INT NOT NULL,
    constraint foreign key (job_id) references jobs_2(job_id)
);

desc job_histry_2;


# 15] Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, 
# the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

create table departments (
	department_id decimal(4,0) ,
    department_name varchar(30),
    manager_id decimal(6, 0),
    location_id decimal(4, 0) default 0,
    constraint primary key(department_id, manager_id)
);

create table employees_2 (
	employee_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),
    phone_number int(10),
	hire_date date,
    job_id int(3),
    salary int,
    commission int,
    manager_id decimal(6, 0),
    department_id decimal(4,0),
    constraint check (email like "%@%"),
    constraint foreign key (department_id, manager_id) references departments(department_id, manager_id)

);

desc employees_2;

# 16] Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table.
# "A foreign key constraint is not required merely to join two tables. For storage engines other than InnoDB, it is possible when defining a column to use a REFERENCES tbl_name(col_name) clause, which has no actual effect, and serves only as a memo or comment to you that the column which you are currently defining is intended to refer to a column in another table."

create table employees_3 (
	employee_id int primary key,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),
    phone_number int(10),
	hire_date date,
    job_id int(3),
    salary int,
    commission int,
    manager_id decimal(6, 0),
    department_id decimal(4,0),
    constraint check (email like "%@%"),
    constraint foreign key (department_id, manager_id) references departments(department_id, manager_id)

);

CREATE TABLE employees_4 (
    employee_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE NOT NULL,
    job_id VARCHAR(10),
    salary DECIMAL(10, 2) NOT NULL,
    commission DECIMAL(10, 2),
    manager_id INT,
    department_id INT,
    PRIMARY KEY (employee_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);


