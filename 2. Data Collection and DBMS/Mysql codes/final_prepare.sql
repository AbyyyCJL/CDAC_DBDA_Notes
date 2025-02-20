use hr_aug;

select * from employees;
select * from departments;
select * from job_history;

# 1]Select the first name, last name, and salary of employees whose salaries are greater than $50,000 and who work in the 'Sales' department.

select e.first_name, e.last_name, e.salary from employees e
join departments d
on e.department_id = d.department_id
where salary > 50000 and d.department_name = 'Sales';

# 2] Write a SQL query to retrieve the first name, last name, and hire date of employees who were hired in the last three years.

select first_name, last_name, hire_date from employees
where (year(curdate()) - year(hire_date)) <= 3;


# 3] Write a SQL query to find the average salary of employees in each department. Include the department name in the results.

select department_name, avg(e.salary) as AVG_SALARY from employees e 
join departments d 
on e.department_id = d.department_id 
group by d.department_name ;


# 4] Write a SQL query to find the top three highest-paid employees and display their names and salaries.

select concat(first_name, ' ', last_name) as FULL_NAME, salary from employees
order by salary desc
limit 3;

# 5] Write a SQL query to find all departments where the department name starts with 'S' and contains more than 5 characters.

select department_name from departments 
where left(department_name, 1) = 'S' and char_length(department_name) > 5;


# 6] Write a SQL query to display the first 5 characters of each employee's first name, along with their last name, for all employees whose first names are longer than 5 characters.

select left(first_name, 5) as FIRST_5_CHARS , last_name from employees
where char_length(first_name) > 5;

# 7] Write a SQL query to retrieve the last three characters of each employee's last name and display them alongside the employee's full name.

select right(last_name, 3) as LAST_3_CHARS, concat(first_name, ' ', last_name) as FULL_NAME from employees ;


# 8] Write a SQL query to retrieve the last five employees hired, including their first names, last names, and hire dates.

select first_name, last_name, hire_date from employees 
order by hire_date desc 
limit 5;

# 9] Write a SQL query to list all employees along with their department names, and order the results by department name and then by employee last name.

select e.employee_id , department_name, e.last_name from employees e 
left join departments d 
on e.department_id = d.department_id 
order by d.department_name;

select e.employee_id , department_name from employees e 
join departments d 
on e.department_id = d.department_id 
order by e.last_name ;


# 10] Write a SQL query to retrieve the names of departments that have more than five employees and display the number of employees in each department. 

select d.department_name, count(*) as NO_OF_EMPS from employees e 
join departments d 
on e.department_id = d.department_id 
group by d.department_name
having count(*) > 5;

# 11 ] Write a SQL query to retrieve the first names of employees who work in the 'HR' department.

select first_name from employees 
where job_id like "HR%";

# 12] Select the names of employees whose first names start with the letter J 

select concat(first_name, ' ', last_name) as FULL_NAME from employees
where left(first_name , 1) = 'J';


# 13] Write a query to display the employee's name and a column indicating whether their salary is 'High' (greater than $70,000), 'Medium' (between $40,000 and $70,000), or 'Low' (less than $40,000).

select concat(first_name, ' ', last_name) as FULL_NAME,
	case
		when salary > 70000 then "High"
        when salary between 40000 and 70000 then "Medium"
        when salary < 40000 then "Low"
	end as HIGH_MED_LOW
    from employees ;


# 14] Write a query to count the number of employees in each department, including departments with no employees.

select department_name, count(*) as NO_OF_EMP from employees e 
right join departments d 
on e.department_id = d.department_id 
group by department_name;

# 15] Select the names of employees who work in either the 'Marketing' or 'IT' departments. 

select e.first_name, e.last_name, d.department_name from employees e 
join departments d 
on e.department_id = d.department_id 
where d.department_name in ("Marketing", "IT");


# 16] Select all location details where the city name contains the word 'New'.

select * from locations;

select * from locations 
where city like "%new%";

select * from locations 
where state_province like "%new%";

# 17] Write a query to select the first name, last name, and department name of employees, using a join between the employees and departments tables.

select e.first_name, e.last_name, d.department_name  from employees e 
join departments d 
on e.department_id = d.department_id;


# 18] Write a query to find the names of employees whose salaries are above the average salary of all employees.

select concat(first_name, ' ', last_name), salary as FULL_NAME from employees 
where salary > (select avg(salary) from employees);


# 19] Write a query to count the number of employees in each department and display the department name along with the count.


select d.department_name, count(*) as NO_OF_EMP from employees e 
join departments d 
on e.department_id = d.department_id
group by d.department_name;


# 20] Write a query to select the names of employees who work in departments located in 'New York', using a join between employees, departments, and locations.

select e.first_name, e.last_name, d.department_name, city from employees e
join departments d 
on e.department_id = d.department_id 
join locations l 
on l.location_id = d.location_id
where city = 'Sydney';

select * from locations;


# 21] Write a query to find the maximum salary of employees in each department.

select department_id, max(salary) as MAX_SALARY from employees
group by department_id;


# 22] Write a query to find employees with the job title 'Manager' who work in departments where the average salary is greater than $60,000.

SELECT e.employee_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE j.job_title like '%manager%'
AND d.department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING AVG(salary) > 6000
);

select * from jobs;

# 23] Write a query to find all employees whose job titles start with 'S' and whose salaries are greater than the average salary of all employees. 
# Use a wildcard for the job title and a subquery for the average salary.

SELECT e.employee_id, j.job_title
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE j.job_title like 'S%'
AND d.department_id IN (
    SELECT avg(salary)
    FROM employees
);





###############################################################################################################
############################################### Stored Function ###############################################
###############################################################################################################


# 28] Question: Create a stored function called GetTotalEmployeesInDepartment that takes a department ID as input and returns the total number of employees in that department.

use hr_aug;

delimiter $$
create function GetTotalEmployeesInDepartment3(dept_id int) 
returns int 
deterministic 
begin

	declare ans int;

	select count(*) into ans 
    from employees 
    where department_id=dept_id;
    
    return ans;

end ;;
$$
delimiter ;

select GetTotalEmployeesInDepartment3(90);

drop function GetTotalEmployeesInDepartment3;

# 29] Question: Write a stored function named GetHighestSalaryInDepartment that takes a department ID as input and returns the highest salary among employees in that department.


delimiter $$
create function GetHighestSalaryInDepartment(dept_id int)
returns decimal(10,2)
deterministic
begin
	
    declare ans decimal(10,2);

	select max(salary) into ans from employees where department_id = dept_id;
    
	return ans;

end;;
$$
delimiter ;

select GetHighestSalaryInDepartment(90);

# 30] Question: Create a stored function called GetEmployeeCountByJobTitle that takes a job title as input and returns the number of employees with that job title.


delimiter $$
create function GetEmployeeCountByJobTitle(job_tit varchar(100)) 
returns int 
deterministic 
begin

	declare ans int;
    
    select count(*) into ans from employees e 
    join jobs j 
    on e.job_id = j.job_id 
    where j.job_title = job_tit;
    
    return ans;

end;;
$$
delimiter ;

drop function GetEmployeeCountByJobTitle;

select GetEmployeeCountByJobTitle("Sales");


# 31] Question: Write a stored function named UpdateEmployeeJobTitle that takes an employee ID and a new job title as input parameters, 
# updates the employee's job title, and returns the updated job title.

delimiter $$ 
create function UpdateEmployeeJobTitle(emp_id int, job_tit varchar(100)) 
returns varchar(100) 
deterministic 
begin 

	declare ans varchar(100);
    
    update employees set 

end;;
$$
delimiter ;


# 32] Write a stored function named GetHighestSalaryInDepartment that takes a department ID as input and returns the highest salary of employees in that department. 


delimiter $$
create function GetHighestSalaryInDepartment2(dept_id int) 
returns decimal(10,2) 
deterministic 
begin

	declare ans decimal(10, 2);
    
    select salary into ans from employees where department_id = dept_id order by salary desc limit 1;
    
    return ans;

end;;
$$
delimiter ;

select GetHighestSalaryInDepartment2(90);


# 33] Question: Write a stored function named GetEmployeeDepartmentDetails that takes an employee ID as input and returns the department name and the employee's job title

select * from departments;
select * from jobs;

delimiter $$ 
create function GetEmployeeDepartmentDetails(emp_id int)
returns varchar(100)
deterministic
begin 

	declare ans1 varchar(100);
	declare ans2 varchar(100);
    
    select d.department_name, d.job_title from employees e 
    join departments d 
    on e.department_id 
    

end;;
$$
delimiter ;


###############################################################################

# 41] Question: Write a stored procedure named GetEmployeeDetails that takes an employee ID as input and returns the employee's name, department, and hire date. 

delimiter $$
create procedure GetEmployeeDetails(in emp_id int) 
begin

	select concat(first_name, ' ', last_name) as FULL_NAME , department_id , hire_date
    from employees where employee_id = emp_id;

end;;
$$
delimiter ;


call GetEmployeeDetails(101);

# Question: Write a stored procedure named GetAverageSalaryByDepartment that takes a department ID as input and returns the average salary of employees in that department. 


delimiter $$
create procedure GetAverageSalaryByDepartment(in dept_id int) 
begin 

	select avg(salary) from employees where department_id = dept_id;

end;;
$$
delimiter ;

call GetAverageSalaryByDepartment(90);


# 43] Question: Create a stored procedure called AddNewStudent that takes a student's name, age, and email as input parameters and inserts a new record into the students table. 

select * from student;
use hr_aug;
create table studnent

delimiter $$
create procedure AddNewStudent(in nav varchar(100),  in email_n varchar(100) ,in age_n int)
begin

	insert into student values (5, nav, email_n, age_n);


end;;
$$
delimiter ;

drop procedure AddNewStudent;

call AddNewStudent("alibaba", "abyyy@gg", 67);

select * from student;

###############################################################################3

############ TRIGGERS $###################################



# 1] 35.	Question: Create a trigger that inserts a record into the Salary_History table whenever a new employee is 
# added to the employees table, recording the employee ID, initial salary, and the date of insertion. 

select * from salary_history;
select * from employee;

delimiter $$
create trigger tri_q1 
after insert 
on employee 
for each row
begin

	insert into salary_history values (employee_id, old.salary, curdate());

end;;
$$
delimiter ;


