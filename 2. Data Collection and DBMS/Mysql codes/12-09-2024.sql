# Questions

# find the job _ title with avg salary greater than 5000

desc employees;

select job_id, avg(salary) as average_salary from employees group by job_id having average_salary > 5000; 

# find the department with total expense between 2000 and 5000

select department_id, sum(salary) as total_expense from employees group by department_id having total_expense between 2000 and 5000;

# find the department where the no of employee is greater than 5 and avg salary > 5000

select department_id, count(employee_id) no_of_employees ,avg(salary) as average_salary from employees group by department_id
having no_of_employees > 5 and average_salary > 5000;

# find the department where the no of employees is greater than 3 who joined on 1 jan 1987, and total sxpense is 5000.

select * from employees;

select department_id, count(employee_id) no_of_employees, sum(salary) as total_expense from employees where hire_date = '1987-01-01' 
group by department_id having no_of_employees > 3 and total_expense > 5000;


# find the department along with the total no of employees and maximum salary for each depart, including only those depart whos 
# maximum salary is greater than 10000

select department_id, count(employee_id) total_employees, max(salary) as maximum_salary from employees group by department_id having maximum_salary > 10000;


# Questions end

########### SUB QUERIES #########


# find employees whose manager_id is 101

select * from employees where MANAGER_ID = 101; # simple query
select EMPLOYEE_ID from employees where MANAGER_ID = 101; # simple query

select * from employees where EMPLOYEE_ID in (select EMPLOYEE_ID from employees where MANAGER_ID = 101);

# display first name , last name, and department_id of employees who is working in the same derpatment as Steven


select first_name, last_name, department_id from employees where department_id in (select department_id from employees where first_name = 'Steven');

select first_name, last_name, department_id from employees where department_id = (select department_id from employees where first_name = 'Nandita');

# find the employee(full details) who earns highest salary 

select *  from employees
where salary =
(
	select max(salary) from employees
);

# find dept_id and the no of employees in the department who is having employees > 5

select DEPARTMENT_ID, count(employee_id) as no_of_employees from employees
where DEPARTMENT_ID in
(
	# select department_id from employees where count(employee_id) > 5 group by department_id having count(employee_id) > 5 
    select department_id from employees group by department_id having count(*) > 5
) group by department_id;


## 
# find the employees whose salary is above than average salary of all employees

select * from employees where salary > (select avg(salary) from employees);

##
# write query to display department_id of department that dont have any employees

select department_id from employees where department_id in
(
	select department_id from employees where department_id is null
);


# find the dept with highest no of employees

select department_id from employees 
where department_id = 
( 
	select department_id from employees 
    group by department_id
    order by count(*) desc limit 1
) limit 1;


##
#

select department_id from
(
	select department_id, count(*) no_of_emp from employees
    group by department_id
    order by count(*) desc limit 1
) as max_dept;


select department_name from departments where department_id in 
(
	select department_id from
	(
		select department_id, count(*) no_of_emp from employees
		group by department_id
		order by count(*) desc limit 1
	) as max_dept
);


#select round(sqrt((min(LAT_N) - max(LAT_N))**2 + (max(LONG_W) - min(LONG_W))**2), 4) from station;

# find employeez with department_id from departments that are located in 'seattle' and employees who work in that department
select * from locations;
select location_id from locations where city = 'SEATTLE';

select department_id from departments where 
location_id in
(select location_id from locations where city = 'SEATTLE');

select first_name, last_name, department_id from employees 
where department_id in (select department_id from departments where 
location_id in
(select location_id from locations where city = 'SEATTLE')); # ans

# write a query to display first_name, last_anme, department_id from employees who workds in department located in cities whose name starts with 's'

select location_id from locations where city like 'S%';

select department_id from departments where 
location_id in
(select location_id from locations where city like 'S%');

select first_name, last_name, department_id from employees
where department_id in (select department_id from departments where 
location_id in
(select location_id from locations where city like 'S%')); # ans


# write a query to find department that have more than 5 employees located in seattle
select * from locations;
select location_id from locations where city = 'Seattle';

select department_id from departments where location_id = (select location_id from locations where city = 'Seattle');

SELECT 
    DEPARTMENT_ID, COUNT(*) AS no_of_emp
FROM
    employees
WHERE
    DEPARTMENT_ID IN (SELECT 
            department_id
        FROM
            departments
        WHERE
            location_id = (SELECT 
                    location_id
                FROM
                    locations
                WHERE
                    city = 'Seattle'))
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) > 5; # ans

# select first_name, last_name, department_id from employees where department_id in (select department_id, count(*) from departments where location_id = (select location_id from locations where city = 'Seattle') group by department_id);

#################################################################
############################ JOINS ##############################

CREATE TABLE Department_jn (
    dept_id INT PRIMARY KEY,
    manager_id INT,
    department_name VARCHAR(50)
);

CREATE TABLE Employee_jn (
    emp_id INT PRIMARY KEY,
    e_name VARCHAR(50),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department_jn(dept_id)
);


INSERT INTO Department_jn (dept_id, manager_id, department_name) 
VALUES
    (1, 101, 'Engineering'),
    (2, 102, 'Sales'),
    (3, 103, 'Marketing'),
    (4, 104, 'Other');


INSERT INTO Employee_jn (emp_id, e_name, salary, department_id) 
VALUES
    (201, 'John Doe', 60000.00, 1),
    (202, 'Jane Smith', 55000.00, 1),
    (203, 'Michael Johnson', 62000.00, 2),
    (204, 'Emily Davis', 58000.00, 2),
    (205, 'Chris Brown', 63000.00, 3),
    (206, 'Amanda Wilson', 60000.00, 3);
    

select * from Employee_jn;
select * from Department_jn;

# write a query to find name and salary of all employees along with their corresponding department name

# name, salary -> employee_jn
# department_name -> department_jn
# common in both -> department_id

select e_name, salary, department_id from employee_jn
inner join department_jn
on department_id = dept_id;

##
# write a query to find name, dept_id and manager_id of all employees along with their corresponding department name 
select * from Employee_jn;
select * from Department_jn;

# name -> employee_jn
# dept_id, manager_id, depart_name -> department_jn
# common -> department_id

select dept_id, manager_id, dept_id, department_name from Department_jn 
inner join Employee_jn
on dept_id = department_id;

##
# write a query to find name, dept_id and manager_id of all employees along with their corresponding department name where the department name is sales;

--  name, dept_id, manager_id dept_name, --> o/p emp and dept
-- where department name = 'sales'

select e_name, dept_id, manager_id, department_name from Employee_jn
inner join Department_jn
on department_id = dept_id where department_name = 'Sales';


# write a query to find name, dept_id and manager_id of all employees along with their corresponding department name where the salary is in range of 2000 to 5000

select e_name, dept_id, manager_id, department_name from Employee_jn
inner join Department_jn
on department_id = dept_id where salary between 20000 and 60000;


