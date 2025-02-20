
select * from employees;
select * from departments;
select * from locations;
select * from regions;
select * from countries;

##
# show the employee list/ details working in a particular city
# group_concat(concat(first_name, " ", last_name, " who works in ", d.department_name) separator ',')

# group_concat(concat(e.first_name, ' ', e.last_name, ' who works in ', d.department_id, ' which is in ' , l.city) separator ',');

use hr_aug;

delimiter $$
create function get_emp_with_city(cities varchar(200))
returns varchar(2000)
deterministic 
begin
	declare ans varchar(2000);
    select group_concat(concat(e.first_name, ' ', e.last_name, ' who works in ', d.department_name, ' which is in ' , l.city) separator ',') into ans 
    from employees e 
    left join departments d 
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    join locations l
    on d.LOCATION_ID = l.LOCATION_ID
    where l.city = cities;
    
    return ans;
    
end;;
$$

delimiter ;

drop function get_emp_with_city;

select get_emp_with_city('Roma');


##
# giv avg(saalary) take dept id

delimiter $$
create function get_avg_sal_dept(dept_id int)
returns decimal(10,2)
deterministic
begin
	declare ans decimal(10,2);
    
    select avg(salary) into ans
    from employees
    where DEPARTMENT_ID = c
    group by department_id;
    
    return ans;
end;;
$$

delimiter ;

drop function get_avg_sal_dept;

select get_avg_sal_dept(20);


################################################
############## Stored Procedure ################
################################################

delimiter $$

create procedure get_all_emp_details()
begin 

	select * from employees;

end ;;
$$
delimiter ;

call get_all_emp_details();

##
# create procedure to fetch values from department table

delimiter $$

create procedure get_all_dept_details()
begin 

	select * from departments;

end ;;
$$
delimiter ;

call get_all_dept_details();

##
# get emp with deparment details

delimiter $$
create procedure get_emp_dept_details()
begin
	
    select e.first_name, e.last_name, e.department_id, d.department_name
    from employees e
    join departments d
    on e.department_id = d.department_id;

end;;
$$
delimiter ;

drop procedure get_emp_dept_details;

call get_emp_dept_details();

##
# emp details using emp-id




delimiter $$
create procedure get_emp_from_id(in emp_id int)
begin
	
    select * from employees where employee_id = emp_id;

end;;
$$
delimiter ;

call get_emp_from_id(100);

##
# update using procedure

delimiter $$
create procedure update_sal_inemp(in emp_id int, in n_salary float(10,2))
begin
	
    update employees set salary = n_salary where employee_id = emp_id;

end;;
$$
delimiter ;

call update_sal_inemp(101, 69000);

select * from employees where employee_id = 101;

##
# create a dummy student table and create a procedure to insetrt into the table

create table student (roll_no int, name varchar(30), course varchar(30));

delimiter $$
create procedure insert_in_student(in r_num int, in nav varchar(30), in crs varchar(30))
begin
	
    insert into student values (r_num, nav, crs);
    
end;;
$$

delimiter ;

drop procedure insert_in_student;

call insert_in_student(1, 'Abhay', 'DBDA');
call insert_in_student(2, 'Atharva', 'DBDA');
call insert_in_student(3, 'Neelanjan', 'DBDA');

select * from student;

##
# find our emp_name, salary and dept_name  -- out condition
# emp_id -- in

delimiter $$
create procedure emp_detail_using_emp_id(in emp_id int, out full_name varchar(100), out sal float(10, 2), out dept_name varchar(100))
begin 

	select concat(first_name, ' ', last_name), salary , department_name into full_name, sal, dept_name
    from employees e
    join departments d 
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    where e.EMPLOYEE_ID = emp_id;

end;;
$$
delimiter ;

drop procedure emp_detail_using_emp_id;

call emp_detail_using_emp_id(100, @full_name, @sal, @dept_name);

-- To see the values of the output parameters
SELECT @full_name AS full_name, @sal AS salary, @dept_name AS department_name;

##
# write a query to find cities , depatment_name on the basis of deparntmen id


delimiter $$
create procedure get_city_N_dept_name(in dept_id int, out cities varchar(40), out dept_name varchar(40)) 
begin 

	select l.city, d.department_name into cities, dept_name
    from departments d
    join locations l
    on d.LOCATION_ID = l.LOCATION_ID
    where d.department_id = dept_id;

end;;
$$
delimiter ;

drop procedure get_city_N_dept_name;

call get_city_N_dept_name(90, @cities, @dept_name);

-- To see the values of the output parameters
SELECT @cities as City ,@dept_name AS department_name;

##
# 

delimiter $$
create procedure emp_dep_inout(inout emp_id int , out dept_id int , out full_name varchar(100))
begin

	select concat(first_name , ' ', last_name) , department_id into full_name, dept_id
    from employees where employee_id = emp_id;

end;;
$$

delimiter ;

drop procedure emp_dep_inout;

set @emp_id = 100;

call emp_dep_inout(@emp_id, @dept_id, @full_name);

select @emp_id as Employee_ID, @full_name as Full_name, @dept_id as Department_ID ;

##
# Q] write a procedure to perform join on employees , deaprtments where input will be gicen as deaprtment+_id and the
# procedure will return total salary of an employee in department adn no of employees in a department

delimiter $$
create procedure get_tot_sal_dpt_N_no_emp_dpt(inout dept_id int, out tot_sal decimal(10, 2), out cnt int)
begin

	select sum(salary) , count(*) into tot_sal, cnt
    from employees e
    join departments d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
    group by e.DEPARTMENT_ID
    having e.DEPARTMENT_ID = dept_id;

end;
$$

delimiter ;

drop procedure get_tot_sal_dpt_N_no_emp_dpt;

set @dept_id = 60;

call get_tot_sal_dpt_N_no_emp_dpt(@dept_id, @tot_sal, @cnt);

select @dept_id as Department_ID, @tot_sal as Total_Salary, @cnt as No_of_employees;

################################################
################### Trigger ####################
################################################


# 1]  Before Insert

delimiter $$
create trigger tri1
before insert on employee
for each row
begin
	-- new --- this take new values
    -- old --- this take old values in the table
    
    if new.salary is null then
		set new.salary = 15000;
	end if;


end;;
$$
delimiter ;

select * from employee;

INSERT INTO employee (employee_id, name, department_id)
VALUES
  (6, 'Abhay', 101);
  
  
##
#

delimiter $$
create trigger tri2
before insert
on employee
for each row
begin

	if new.department_id is null then
		set new.department_id = 1400;
        
	end if;

end;;
$$
delimiter ;

INSERT INTO employee (employee_id, name)
VALUES (7, 'Alex');

select * from employee;
show databases;

show triggers in experiment ;

##
#

delimiter $$
create trigger tri3
before insert
on employees
for each row
begin

	if new.email not like '%@%' then  
		signal SQLSTATE '45000'
			set message_text = 'Invalid email type';
            
	end if;

end;;
$$
delimiter ;

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('1001', 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', '24000.00', '0.00', '0', '90');


delimiter $$
create trigger tri4
before insert 
on employees 
for each row
begin

	if new.salary < 0 then
		signal SQLSTATE '45000'
        SET message_text = 'Cannot insert employee becuz of -ve salary andhe!!!';
	
    end if;

end;;
$$	
delimiter ;

INSERT INTO `employees` (`EMPLOYEE_ID`, `FIRST_NAME`, `LAST_NAME`, `EMAIL`, `PHONE_NUMBER`, `HIRE_DATE`, `JOB_ID`, `SALARY`, `COMMISSION_PCT`, `MANAGER_ID`, `DEPARTMENT_ID`) VALUES
('1000', 'Steve', 'King', 'SK@NF', '515.123.4567', '1987-06-17', 'AD_PRES', '-24000.00', '0.00', '0', '90');



delimiter $$
create trigger tri_prac 
before insert 



##
#
# check it later on
-- select * from employee;
-- delimiter $$
-- create trigger tri5 
-- before insert 
-- on employee 
-- for each row 
-- begin 

-- 	if name is null then 
-- 		signal SQLSTATE '45000'
-- 			set message_text = 'Naam bhul gaya bhai tu';
--             
-- 	end if;

-- end;;
-- $$
-- delimiter ;

-- select * from employee;

-- insert into employee (employee_id, salary, department_id) values (14, 69, 159);

# 2] After insert 



-- delimiter $$
-- create trigger tri6
-- after insert
-- on employees
-- for each row
-- begin



-- end ;;
-- $$
-- delimiter ;

-- DELIMITER $$
-- CREATE TRIGGER AFTER_INSERT_SALARY
-- AFTER INSERT ON EMPLOYEES
-- FOR EACH ROW
-- WHEN(NEW.SALARY<>OLD.SALARY)
-- BEGIN
-- 	INSERT INTO SALARY_HISTORY(EMPLOYEE_ID,FIRST_NAME,OLD_SALARY,NEW_SALARY,DEPARTMENT_ID)
--     VALUES(OLD.EMPLOYEE_ID,OLD.FIRST_NAME,OLD.OLD_SALARY,NEW.NEW_SALARY,OLD.DEPARTMENT_ID);	
-- END;
-- $$
-- DELIMITER 


-- Create a logging table to store the messages
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    log_message VARCHAR(255),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Create the trigger to log messages after employee insertions
DELIMITER $$


CREATE TRIGGER after_employee_insert
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    -- Insert the message into the logging table
    INSERT INTO employee_log (log_message)
    VALUES (CONCAT('A new employee has been inserted with ID: ', NEW.employee_id));
END;
$$
DELIMITER ;


INSERT INTO employee (employee_id, name, salary)
VALUES (10, 'John Doe', 50000.00);


select * from employee;
select * from employee_log;
 
# 3] Before Delete

-- DELIMITER $$
-- CREATE TRIGGER trg_employee_delete
-- BEFORE DELETE ON employee
-- FOR EACH ROW
-- BEGIN
--     IF (SELECT COUNT(*) FROM employee WHERE department_id = OLD.department_id) < 2
--     then
--        signal sqlstate '45000' set message_text='cannot delete bhaisaab';
--     END if;
-- END;
-- $$
-- DELIMITER ;

-- drop trigger trg_employee_delete;

-- DELETE FROM employee WHERE employee_id = 2;
-- select * from employee;


DELIMITER $$
CREATE TRIGGER before_employe_delete
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
    -- cancel the delete operation if the employee has been with the company for more than 10 years
    IF DATEDIFF(NOW(), OLD.hire_date) > 3650 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete employee - has been with company for more than 10 years';
    END IF;
END;
$$
DELIMITER ;


delete from employees where employee_id = 110;

##
# 

# 5] After Update 

delimiter $$
create trigger tri7
after update 
on employees
for each row
begin

	if new.salary <> old.salary then
		insert into salary_history( emp_id, first_name, old_salary, new_salary, department_id)
        values (old.employee_id, old.first_name, old.salary, new.salary, old.department_id);
        
	end if;

end;;

$$
delimiter ;


update employee set salary = 5000000 where employee_id = 5;
select * from salary_history; 
select * from employee;
select * from employees;

drop trigger tri7;



