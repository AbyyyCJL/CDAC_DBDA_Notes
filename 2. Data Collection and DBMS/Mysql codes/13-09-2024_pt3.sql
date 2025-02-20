

#########################################
######## stored function ################
#########################################


-- create function to_get_emp_details()
-- return return type
-- begin 

-- end

delimiter $$
create function to_get_emp_details(emp_id int)
returns varchar(100)
deterministic
begin 
	declare full_name varchar(100);
    select concat(first_name, ' ', last_name) into full_name from employees where employee_id  = emp_id;
    
    return full_name ;
end
$$
DELIMITER ;

select to_get_emp_details(115);

# drop function to_get_emp_details; to drop the function




select concat(first_name, ' ', last_name) as full_name from employees where employee_id  = 100;


#find the employee department_id using employee first_name

select department_id from employees where first_name = 'LEX'

delimiter $$
create function to_get_emp_dept(emp_name varchar(20))
returns int(10)
deterministic
begin 
	declare Department_IDs int(10);
    select department_id into Department_IDs from employees where first_name = emp_name;
    
    return Department_IDs ;
end
$$
DELIMITER ;

drop function to_get_emp_dept;

select to_get_emp_dept('LEX');


##
# find the salary of the employee using the employee_id

delimiter $$
create function get_emp_salary(emp_id int)
returns int(10)
deterministic
begin
	declare sal int(10);
    select salary into sal from employees where employee_id = emp_id;
    
    return sal;
    
end;;
$$
delimiter ;

select get_emp_salary(120);


##
# write a function to find the years of experience using employee_id

drop function get_exp;

delimiter $$
create function get_exp(emp_id int)
returns float
deterministic
begin
	declare exp float;
    #select floor((datediff(curdate(), hire_date))/365.2524) into exp from employees where employee_id = emp_id;
    
    select timestampdiff(year, hire_date, curdate()) into exp from employees where employee_id = emp_id;
    
    return exp;

end;;
$$
delimiter ;

select get_exp(100);



##
# function to write no of emplouee in adept

delimiter $$
create function get_no_of_emp(dept_id int)
returns int 
deterministic
begin
	declare emp_nos int;
    select count(*) into emp_nos
    from employees
    where department_id = dept_id; 
    
    return emp_nos;
end;;
$$

delimiter ;

select get_no_of_emp(90);



##
# write query to find total no of employee who is managed by a manager 
# do it by giving input as manager id

delimiter $$
create function get_emps_below_mgnr(mager_id int)
returns int
deterministic
begin
	declare no_of_emps int;
    select count(*) into no_of_emps
    from employees
    where manager_id = mager_id;
    
    return no_of_emps;
end;;
$$

delimiter ;

drop function get_emps_below_mgnr;

select get_emps_below_mgnr(100);


##
# find no of employees working in a dept with a specific job id and earning more than the min_sal

delimiter $$
create function get_emp_using_job_sal(j_id varchar(10), min_sal decimal(10, 2))
returns int
deterministic
begin
	declare no_of_emp int;
    select count(*) into no_of_emp
    from employees
    where job_id = j_id
    and salary > min_sal;
    
    return no_of_emp;
end;;
$$

delimiter ;

select get_emp_using_job_sal('IT_prog', 500);

##
# write a function to return total_salary for employee working in specific department

delimiter $$
create function ret_tot_sal (dept_id int)
returns int
deterministic
begin
	declare tot_sal int;
    select sum(salary) into tot_sal 
    from employees 
    where department_id = dept_id;
    
    
    return tot_sal;
    
end;;
$$
delimiter ;

select ret_tot_sal(50);


##
# get departname if department is located in the given location

delimiter $$
create function get_dept_name(dept_id int, loc_id int)
returns varchar(1000)
deterministic 
begin
	declare dept varchar(1000);
    -- select distinct(d.department_name) into dept
    select group_concat(department_name separator ',') into dept
    from employees e, departments d
    where e.DEPARTMENT_ID = d.DEPARTMENT_ID and d.LOCATION_ID = loc_id;
    
    return dept;

-- 	declare dept_name varchar(100);
--     select d.department_name into dept_name
--     from departments d 
--     join locations l
--     on department_id = dept_id and d.location_id = loc_id;
--     
--     return dept_name;
    
end;;
$$

delimiter ;

drop function get_dept_name;

select * from employees;
select * from departments;

select get_dept_name(50, 1500);


##
#

delimiter $$
create function getemployeewithdept(emp_id int)
returns varchar(2000)
deterministic
begin
	declare emp_details varchar(2000);
    select group_concat(concat(first_name, " ", last_name, " who works in ", d.department_name) separator ',')
    into emp_details from employees e
    join departments d
    on d.department_id = e.department_id 
    where employee_id = emp_id;
    
    return emp_details;
	
    
end;;
$$

delimiter ;


select getemployeewithdept(123);