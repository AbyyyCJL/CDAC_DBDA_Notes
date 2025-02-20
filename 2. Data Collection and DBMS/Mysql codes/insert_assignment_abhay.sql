create database insert_ass;
use insert_ass;


# 1] 

CREATE TABLE countries (
    COUNTRY_ID VARCHAR(2),
    COUNTRY_NAME VARCHAR(40),
    REGION_ID DECIMAL(10, 0)
);

insert into countries values ('US', 'America',4);
insert into countries values ('UK', 'England',14);
insert into countries values ('IN', 'India',40);
select * from countries;

# 2]

insert into countries values ('RU', 'Russia', default);
select * from countries;

# 3] 
CREATE TABLE country_new LIKE countries;
insert into country_new select * from countries;
select * from country_new;

# 4] Write a SQL statement to insert NULL values against the region_id column for a row of countries table.

insert into countries values ('AF', 'Nigeria', null);
select * from countries;

# 5] Write a SQL statement to insert 3 rows by a single insert statement.

insert into countries (country_id, country_name, region_id)
values
	('PK', 'Pakistan', 69),
    ('BZ', 'Brazil', 17),
    ('CD', 'Canada', 52)
;
select * from countries;

# 6] Write a SQL statement insert rows from country_new table to countries table.


CREATE TABLE country_new (
    COUNTRY_ID VARCHAR(10),
    COUNTRY_NAME VARCHAR(40),
    REGION_ID DECIMAL(10, 0)
);
insert into country_new (country_id, country_name, region_id)
values
	('C0001', 'India ', 1001),
    ('C0002', 'USA', 1007),
    ('C0003', 'UK', 1103)
;
alter table countries modify column country_id varchar(10);

insert into countries select * from country_new;
select * from countries;

# 7] Write a SQL statement to insert one row in the jobs table to ensure that no duplicate value will be entered in the job_id column.

CREATE TABLE IF NOT EXISTS `jobs` (
  `JOB_ID` varchar(10) NOT NULL DEFAULT '',
  `JOB_TITLE` varchar(35) NOT NULL,
  `MIN_SALARY` decimal(6,0) DEFAULT NULL,
  `MAX_SALARY` decimal(6,0) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


insert into jobs values ('101', 'IT_PROG', 2000, 10000);
insert into jobs values ('101', 'IT_PROG', 2000, 10000);
select * from jobs;

# 8] Write a SQL statement to insert a record into the table countries to ensure that a country_id and region_id 
# combination will be entered once in the table.

insert into countries (country_id, region_id) values ('AJ', 34);
select * from countries; 

# 9] Write a SQL statement to insert rows into the table countries in which the value of the 
# country_id column will be unique and auto incremented.

CREATE TABLE countries_3 (
    COUNTRY_ID int unique auto_increment,
    COUNTRY_NAME VARCHAR(40),
    REGION_ID DECIMAL(10, 0)
);

insert into countries_3 (country_name, region_id) values ('India', 1);
insert into countries_3 (country_name, region_id) values ('America', 12);
insert into countries_3 (country_name, region_id) values ('Russia', 7);
select * from countries_3;

# 10] Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any 
# duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' 
# if no value assigned for that column.

CREATE TABLE countries_4 (
    COUNTRY_ID int primary key auto_increment,
    COUNTRY_NAME VARCHAR(40) default 'N/A',
    REGION_ID DECIMAL(10, 0)
);

insert into countries_4 (country_name, region_id) values ('India', 1);
insert into countries_4 (country_name, region_id) values ('America', default);
insert into countries_4 (country_name, region_id) values ('China', default);
select * from countries_4;

# 11] Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which 
# exist in the job_id column of the jobs table.

CREATE TABLE IF NOT EXISTS `job_history` (
  `EMPLOYEE_ID` int auto_increment,
  `START_DATE` date default null,
  `END_DATE` date default null,
  `JOB_ID` varchar(10) default '',
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
drop table job_history;
desc jobs;

insert into job_history (job_id) select job_id from jobs;
select * from job_history;

# 12] Write a SQL statement to insert rows into the table employees in which a set of columns department_id and 
# manager_id contains a unique value and that combined values must have existed into the table departments.

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    manager_id INT
);

CREATE TABLE IF NOT EXISTS `employees` (
  `EMPLOYEE_ID` decimal(6,0) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) DEFAULT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` decimal(8,2) DEFAULT NULL,
  `COMMISSION_PCT` decimal(2,2) DEFAULT NULL,
  `MANAGER_ID` decimal(6,0) DEFAULT NULL,
  `DEPARTMENT_ID` decimal(4,0) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMP_EMAIL_UK` (`EMAIL`),
  KEY (department_id, manager_id),
  FOREIGN KEY (department_id, manager_id) REFERENCES departments(department_id, manager_id)

) ENGINE=MyISAM DEFAULT CHARSET=latin1;

drop table employees;

INSERT INTO employees (first_name, department_id, manager_id)
SELECT 'John', 1, 100
WHERE EXISTS (
    SELECT 1
    FROM departments
    WHERE department_id = 1
      AND manager_id = 100
);

INSERT INTO employees (first_name, department_id, manager_id)
SELECT 'John', 1, 100
WHERE EXISTS (
    SELECT 1
    FROM departments
    WHERE department_id = 1
      AND manager_id = 100
);

select * from employees;

# 13] Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id 
# contains the values which must have exists into the table departments and jobs


show tables;

CREATE TABLE departments_2 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

CREATE TABLE jobs_2 (
    job_id INT PRIMARY KEY,
    job_title VARCHAR(255) NOT NULL
);

CREATE TABLE employees_2 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    department_id INT,
    job_id INT,
    FOREIGN KEY (department_id) REFERENCES departments_2(department_id),
    FOREIGN KEY (job_id) REFERENCES jobs_2(job_id)
);

INSERT INTO employees_2 (name, department_id, job_id)
SELECT 'Alice Johnson', 1, 10
WHERE EXISTS (
    SELECT 1
    FROM departments_2
    WHERE department_id = 1
)
AND EXISTS (
    SELECT 1
    FROM jobs_2
    WHERE job_id = 10
);

select * from employees_2;



