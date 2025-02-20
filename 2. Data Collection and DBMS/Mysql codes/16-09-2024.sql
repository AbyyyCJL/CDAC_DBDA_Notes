
use hr_aug;


################################################################
#########################  VIEWS ###############################
################################################################

show tables;

select * from student;


create view v1 as
select concat(first_name, ' ', last_name) as FULL_NAME, department_id 
from employees;


select * from v1;


-- view using condition

CREATE VIEW v2 as 
SELECT concat(first_name, ' ', last_name) AS FULL_NAME, salary ,department_id 
FROM employees
WHERE department_id IN (90, 100, 50) AND salary > 5000;

select * from v2;

## VIEW can be updated if the table is updated 
create view v3_temp as
select * from student;

select * from v3_temp;

update student set name = 'ABHAY PATIL' where roll_no = 1;

update v3_temp set name = 'alex' where roll_no = 1;

update student set name = 'MAJNU' where roll_no = 2;

select * from student;
select * from v3_temp;
########################################3

# view using joins

create view v3 as
select concat(first_name, ' ', last_name) AS FULL_NAME, e.salary, d.department_id, d.department_name
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id ;


SELECT * FROM v3 ORDER BY department_id;

########################################################

CREATE VIEW v4 AS 
SELECT concat(first_name, ' ', last_name) AS FULL_NAME, salary
FROM employees 
WHERE salary = (
	SELECT max(salary) FROM employees
);


SELECT * FROM v4;

###################################################
# write a query for updating employees table and changing salary of employee_id 100 to 900000 

UPDATE employees SET salary = 900000 where employee_id = 100;

select * from employees;

###########################################################################

# create a new view using group 

CREATE VIEW v5 AS 
SELECT department_id, count(*) no_employees 
FROM employees 
GROUP BY department_id;

drop view v5;

SELECT * from v5;

update v5 set no_employees = 10 WHERE department_id = 0; 

############################################################################3

# alter a view



alter view emp_sal_details as select first_name,last_name,salary, hire_date
from employees where salary>5000;



###########################################################################
# create view from another view

select * from v3;

CREATE VIEW v6_v3 AS 
SELECT FULL_NAME, salary FROM v3 ;

select * from v6_v3;

ALTER VIEW v6_v3 AS 
SELECT FULL_NAME, salary FROM v3
WHERE salary > 50000;

select * from v6_v3;

####################################################################################################################################################################

#######################################################################
############################### DCL ###################################
#######################################################################


# 1] CREATE a user 

create user 'aug_user_1'@localhost identified by 'cdac' ;
create user 'aug_user_2'@localhost identified by 'cdac' ;


create user 'aug_user_3'@localhost identified by 'cdac' ;

# check list of users

select user, host from mysql.user;

# create a user hr

CREATE USER 'hr'@localhost IDENTIFIED BY 'cdac';

-- grant the permossions to user1 for database hr

GRANT ALL PRIVILEGES ON hr_aug.* TO 'aug_user_1'@'localhost';


GRANT ALL PRIVILEGES ON hr_aug.* TO 'aug_user_3'@'localhost';


-- granting selective privileges to the user

GRANT SELECT ON hr_aug.* TO 'aug_user_2'@'localhost';


-- grant on particulat table in database 

GRANT SELECT ON hr_aug.job_history TO 'aug_user_1'@'localhost';


-- view the grants

SHOW GRANTS FOR 'aug_user_1'@'localhost';


-- grant the permission to select all the table in all the database . i.e. presenmt in mysql 

GRANT SELECT ON *.* TO 'aug_user_2'@'localhost';


-- REVOKE ALL privileges

FLUSH PRIVILEGES ; 


################################################################################################

-- REVOKE 

REVOKE SELECT ON *.* FROM 'aug_user_1'@'localhost'; 

-- drop a user

drop user 'aug_user_1';

select * from accounts;

###########################################################################################################################

###########################################################
######################### INDEXES #########################
########################################################### 


EXPLAIN select * from employees where employee_id = 201;


EXPLAIN select * from employees where employee_id = 101;


EXPLAIN select * from employees where employee_id = 114;
select * from employees;

EXPLAIN SELECT * FROM employees WHERE department_id = 90;
SELECT * FROM employees WHERE department_id = 90;

select * from accounts;

select * from accounts WHERE account_id = 1;

EXPLAIN select * from accounts WHERE account_id = 1;

CREATE INDEX idx_dept ON employees (department_id); 

SHOW INDEX FROM employees;



select * from employees where department_id = 50;

