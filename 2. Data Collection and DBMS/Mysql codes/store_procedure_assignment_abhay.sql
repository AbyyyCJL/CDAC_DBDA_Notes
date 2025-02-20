
create database stor_fxn_ass;
use hr_aug; 

CREATE TABLE salary_history (
    emp_id INT,
    first_name VARCHAR(50),
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    department_id INT
);

CREATE TABLE employee (
  employee_id INT auto_increment ,
  namer VARCHAR(50),
  salary FLOAT default 0,
  department_id INT,
  primary key(employee_id)
);
drop table employee;
INSERT INTO employee (employee_id, namer, salary, department_id)
VALUES
  (1, 'John Smith', 50000.0, 101),
  (2, 'Jane Doe', 60000.0, 102),
  (3, 'Bob Johnson', 55000.0, 101),
  (4, 'Mary Brown', 65000.0, 103),
  (5, 'Tom Davis', 70000.0, 102);


# 1] Write a stored procedure to retrieve all employees from the Employees table for a given department ID.

delimiter $$
create procedure retr_emp(in dept_id int)
begin

	select * from employees 
    where department_id = dept_id; 

end ;;
$$
delimiter ;

drop procedure retr_emp;

call retr_emp(90);

# 2] Create a function that calculates the total salary expenditure for a given department ID.

delimiter $$
create function calc_tot_sal (dept_id int) 
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

select calc_tot_sal(90);

# 3] Develop a stored procedure that accepts an employee ID as an input parameter and increases the salary of that employee by a specified percentage.

delimiter $$
create procedure inc_sal(in emp_id int, in perc_inc float(10, 2))
begin

	update employees set salary = salary + salary * perc_inc
    where employee_id = emp_id;

end;;
$$
delimiter ;

drop procedure inc_sal;
select * from employees;
call inc_sal(105, 0.25);




# 4] Write a function to determine the average salary for employees in a specific job title category.

delimiter $$
create function avg_sal(job_t varchar(100))
returns decimal(10, 2)
deterministic
begin
	declare ans decimal(10, 2) ;
    select avg(e.salary) into ans
    from employees e
    join jobs j
    on e.job_id = j.job_id
    where j.job_title = job_t;
    
    return ans;

end;;
$$

delimiter ;

drop function avg_sal;

select avg_sal('President');

# 5] Create a stored procedure that takes an employee's first name and last name as input parameters and returns the full name in uppercase letters.

delimiter $$
create procedure ret_full_name(in fname varchar(30), in lname varchar(30))
begin

	select upper(concat(fname, ' ', lname)) as Full_Name;

end;;
$$
delimiter ;

drop procedure ret_full_name;

call ret_full_name('Abhay', 'patil');

# 6] Write a stored procedure to insert a new employee into the Employees table with the provided first name, last name, and department ID.

delimiter $$
create procedure emp_add(in f_name varchar(30), in l_name varchar(30), in dept_id int) 
begin

	insert into employee (namer, department_id) values (concat(f_name, ' ', l_name), dept_id);

end;;
$$
delimiter ;

drop procedure emp_add;

call emp_add('Abhay', 'Patil', 25);
select * from employee;



# 7] Create a function to calculate the total number of employees in a specific department.

delimiter $$
create function tot_no_emp (dept_id int)
returns int
deterministic
begin
	declare ans int;
    select count(*) into ans
    from employees
    group by DEPARTMENT_ID
    having DEPARTMENT_ID = dept_id;
    
    return ans;
    
end;;
$$

delimiter ;

select tot_no_emp(50);

# 8] Develop a stored procedure that accepts an employee ID as input and deletes that employee's record from the Employees table.

delimiter $$
create procedure del_emp(in emp_id int)
begin

	delete from employee where employee_id = emp_id;

end;;
$$
delimiter ;

call del_emp(6);

select * from employee;



# 9] Write a function to determine the highest salary in the Employees table.

delimiter $$
create function high_sal ()
returns int
deterministic 
begin
	declare ans int;
    select max(salary) as maxSalary into ans
    from employees;
    
    return ans;
end;;
$$

delimiter ;

select high_sal();

# 10] Create a stored procedure that takes a department ID as an input parameter and 
# returns the list of employees sorted by their salary in descending order within that department.

delimiter $$
create procedure lst_emp_sal_desc(in dept_id int)
begin

	select * from employees
    where department_id = dept_id
    order by salary desc;

end;;
$$
delimiter ;

drop procedure lst_emp_sal_desc;

call lst_emp_sal_desc(90);

# 11] Write a stored procedure to update the job title of an employee based on their employee ID.

delimiter $$ 
create procedure update_job_title(
    in emp_id int, 
    in new_job_title varchar(50)
)
begin
    update employees
    set job_id = new_job_title
    where employee_id = emp_id;
end$$
delimiter ;


drop procedure update_job_title;

call update_job_title(102, 'AD_NEW_VP');

select * from employees;

# 12] Create a function that returns the number of employees hired in a specific year.

delimiter $$
create function no_of_emp (sp_year int)
returns int
deterministic
begin
	declare ans int;
    select count(*) into ans
    from employees
    where year(hire_date) = sp_year;
    
    return ans;
end;;
$$

delimiter ;

select no_of_emp(1987);

# 13] Develop a stored procedure that accepts an employee ID as input and retrieves the employee's details, including their name, department, and salary.

delimiter $$
create procedure emp_details (in emp_id int)
begin

	select e.first_name First_name, e.last_name Last_name, d.department_name Dept_name, e.salary as Salary
    from employees e
    join departments d
    on e.department_id = d.department_id
    where e.employee_id = emp_id;

end;;
$$
delimiter ;

drop procedure emp_details;

call emp_details(105);

# 14] Write a function to calculate the average tenure (in years) of employees in the company.

select * from job_history;
drop function avg_ten;
tenure = (year(end_date) - year(start_date))

delimiter $$
create function cal_avg_tenure()
returns float
deterministic
begin
	declare avg_tenure float; 
    SELECT avg(datediff(coalesce(end_date, curdate()), start_date) / 365.2524) into avg_tenure
	FROM job_history;
    return avg_tenure;
end$$
delimiter ;
drop function cal_avg_tenure;
SELECT cal_avg_tenure();


delimiter $$

CREATE FUNCTION avg_ten ()
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE ans FLOAT;

    SELECT AVG(TIMESTAMPDIFF(YEAR, j.start_date, IFNULL(j.end_date, CURDATE()))) 
    INTO ans
    FROM employees e
    JOIN job_history j ON e.employee_id = j.employee_id;

    RETURN ans;
END;
$$

delimiter ;

SELECT avg_ten();

select * from employees;


# 15] Create a stored procedure that takes a department ID as an input parameter and returns the department name along with the count of employees in that department.

delimiter $$
create procedure dept_emp_count(in dept_id int)
begin

	select d.department_name , count(e.employee_id)
    from employees e 
    join departments d 
    on e.department_id = d.department_id
    group by d.department_id
    having d.department_id = dept_id ;

end;
$$
delimiter ;

drop procedure dept_emp_count;

call dept_emp_count(90);

# 16] Write a stored procedure to retrieve the top N highest-paid employees in the company, where N is an input parameter.

delimiter $$
create procedure highest_n_emps(in nums int)
begin 

	select * from employees 
    order by salary desc
    limit nums;

end;;
$$
delimiter ;

drop procedure highest_n_emps;

call highest_n_emps(5);



# 17] Create a function that calculates the total bonus amount for all employees based on their performance ratings.



# 18] Develop a stored procedure that accepts a salary threshold as an input parameter and retrieves all employees with salaries above that threshold.

delimiter $$
create procedure sal_threshold(in sal int)
begin

	select * from employees
    where salary > sal;

end;;
$$
delimiter ;

drop procedure sal_threshold;

call sal_threshold(15000);


# 19] Write a function to determine the average age of employees in the company based on their birthdates.

select * from job_history;

# 20] Create a stored procedure that takes an employee's last name as an input parameter and returns all employees with a similar last name.

delimiter $$
create procedure last_name_emp(in lname varchar(30)) 
begin

	select * from employees 
    where last_name = lname;

end;;
$$
delimiter ;

drop procedure last_name_emp;

call last_name_emp('King');

# 21] Write a stored procedure to update the email address of an employee based on their employee ID.

delimiter $$
create procedure update_email(in emp_id int) 
begin

	update employees set email = concat(email, '_updated') where employee_id = emp_id;

end;;
$$
delimiter ;

drop procedure update_email;

call update_email(100);



# 22] Create a function that calculates the total experience (in years) of all employees combined in the company.

delimiter $$
create function tot_exp ()
returns int
deterministic
begin
	
    declare ans int;
    select sum(timestampdiff(year, start_date ,IFNULL(end_date, CURDATE()))) into ans
    from job_history;
    return ans;
    
    
end;;
$$

delimiter ;

drop function tot_exp;

select tot_exp();

-- delimiter $$
-- create function cal_avg_tenure()
-- returns float
-- deterministic
-- begin
-- 	declare avg_tenure float; 
--     SELECT avg(datediff(coalesce(end_date, curdate()), start_date) / 365.2524) into avg_tenure
-- 	FROM job_history;
--     return avg_tenure;
-- end$$
-- delimiter ;
-- drop function cal_avg_tenure;
-- SELECT cal_avg_tenure();

delimiter $$

create function tot_exp2 ()
returns bigint
deterministic
begin
    declare ans bigint;
    
    select sum(timestampdiff(year, start_date , IFNULL(end_date, CURDATE()))) 
    into ans
    from job_history
    where start_date is not null;  -- Ensures we don't include rows with null start dates

    return ans;
end;
$$

delimiter ;

-- To call the function:
select tot_exp2();



# 24] Write a function to determine the number of employees who have been with the company for more than a specified number of years.

delimiter $$
create function check_tot_exp (years int)
returns int
deterministic
begin
	 # sum(timestampdiff(year, start_date ,IFNULL(end_date, CURDATE())))
    declare ans int;
    select count(*) into ans
    from job_history
    where timestampdiff(year, start_date ,IFNULL(end_date, CURDATE())) > years;
    
    return ans;
    
    
end;;
$$

delimiter ;

select check_tot_exp(2);

# 27] Create a function that calculates the total number of working hours for an employee in a given month.


# 29] Write a function to determine the total number of employees hired in each year, grouped by the year of hire.

delimiter $$
create function tot_emp_hired (years int)
returns int
deterministic
begin
	declare ans int;
    select count(year(hire_date)) into ans
    from employees
    where year(hire_date) = years
    group by year(hire_date);
    
    return ans;
    
end;;
$$

delimiter ;

drop function tot_emp_hired;

select tot_emp_hired(1986);


# 32] Create a function that calculates the total sales revenue generated by each employee in the Sales department, considering both individual and team contributions.



# 34] Write a function that determines the average number of projects handled by employees in each department and identifies departments with exceptionally high or low project volumes.



# 37] Create a function that determines the average time taken to resolve customer issues for each support agent, considering different issue categories and urgency levels.



# 39] Write a function that calculates the employee turnover rate for each department, considering the number of new hires and the number of departures over a specified time frame.

