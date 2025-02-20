
use hr_aug;

show tables;
select * from employees;
select * from departments;
select * from locations;
select * from regions;
select * from countries;
select * from jobs;
select * from job_history;

################################################
################ SUB QUERIES ###################
################################################


# 1. Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.

select first_name, last_name, salary from employees where salary > (select salary from employees where last_name = 'Bull');

# 2.    Write a query to find the name (first_name, last_name) of all employees who works in the IT department.

select concat(first_name, ' ', last_name) as Full_Name from employees where department_id in (select department_id from departments where department_name like 'IT%');

# 3.    Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.

SELECT 
    CONCAT(first_name, ' ', last_name) AS Full_Name
FROM
    employees
WHERE
    manager_id IN (SELECT 
            manager_id
        FROM
            departments
        WHERE
            location_id IN (SELECT 
                    location_id
                FROM
                    locations
                WHERE
                    country_id = (SELECT 
                            country_id
                        FROM
                            countries
                        WHERE
                            country_name = 'United States of America')));

# 4.    Write a query to find the name (first_name, last_name) of the employees who are managers. 

select concat(first_name, ' ', last_name) as Full_Name from employees where employee_id in (select manager_id from employees);

# 5.    Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.

select concat(first_name, ' ', last_name) as Full_Name , salary from employees where salary > (select avg(salary) from employees);


# 6.    Write a query to find the name (first_name, last_name), and salary of the employees whose salary is equal to the minimum salary for their job grade.

-- select concat(first_name, ' ', last_name) as Full_Name , salary from employees where salary <= (select min_salary from jobs group by job_id);

select 
    concat(first_name, ' ', last_name) as Full_Name, 
    salary 
from employees e
where salary = (
    select min(salary) 
    from employees 
    where job_id = e.job_id
);

# 7.    Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the average salary and works in any of the IT departments.


select first_name, last_name, salary from employees where salary > (select avg(salary) from employees) and department_id in (select department_id from departments where department_name like 'IT%');


# 8.    Write a query to find the name (first_name, last_name), and salary of the employees who earns more than the earning of Mr. Bell.

select concat(first_name, ' ', last_name) as full_name, salary from employees where salary > (select salary from employees where last_name = 'Bell');


# 9.    Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.

select first_name, last_name, salary from employees where salary in (select min(salary) from employees group by department_id); 

# 10. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary of all departments.

select first_name, last_name, salary from employees where salary in (select max(salary) from employees group by department_id); 

# 11. Write a query to find the name (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
# Sort the results of the salary of the lowest to highest.

select concat(first_name, ' ', last_name)as Full_name, salary as SALARY from employees where salary > (select max(salary) from employees where JOB_ID = 'SH_CLERK') order by salary;

# 12. Write a query to find the name (first_name, last_name) of the employees who are not supervisors.

select concat(first_name, ' ', last_name) as Full_Name from employees where employee_id not in (select manager_id from employees);


# 13.  Write a query to display the employee ID, first name, last name, and department names of all employees.

select employee_id, first_name, last_name, (select department_name from departments d where d.department_id = e.department_id) as Dept_Name from employees e;

# 14. Write a query to display the employee ID, first name, last name, salary of all employees whose salary is above average for their departments.

 select employee_id, first_name, last_name, salary from employees e where salary > (select avg(salary) from employees where department_id = e.department_id) ;

# 15.          Write a query to fetch even numbered records from employees table.
 
 select * from employees where (employee_id % 2 = 0);
 
# 16.          Write a query to find the 5th maximum salary in the employees table.
 
 select distinct(salary) from employees order by salary desc limit 1 offset 4;
 
# 17.          Write a query to find the 4th minimum salary in the employees table
 
select distinct(salary) from employees order by salary asc limit 1 offset 3;
 
# 18.          Write a query to select last 10 records from a table.
 
 select * from employees order by employee_id desc limit 10;
 
# 19.          Write a query to list the department ID and name of all the departments where no employee is working.
 
SELECT department_id, department_name 
FROM departments 
WHERE department_id NOT IN (
    SELECT DISTINCT department_id 
    FROM employees
);


# 20.          Write a query to get 3 maximum salaries.
 
select (salary) as 3_Max_Salaries from employees order by salary desc limit 3;
 
# 21.          Write a query to get 3 minimum salaries.
 
select (salary) as 3_Max_Salaries from employees order by salary asc limit 3;



# 22.          Write a query to get nth maximum salaries of employees.
delimiter $$
create procedure nth_max_salaries(in num int)
begin 
	
    declare x int;
	set x = num - 1;
	select (salary) as Max_Salaries from employees order by salary desc limit 1 offset x;

end;;
$$
delimiter ;

call nth_max_salaries(1);


################################################
################### JOINS ######################
################################################


# 1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM departments d
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

# 2.    Write a query to find the name (first_name, last name), department ID and name of all the employees.

select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
left join departments d
on e.department_id = d.department_id;

# 3.    Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.

select e.first_name, e.last_name , j.job_title, e.department_id, l.city
from employees e
join departments d
on e.department_id = d.department_id 
join jobs j
on e.job_id = j.JOB_ID
join locations l
on d.LOCATION_ID = l.LOCATION_ID
where l.CITY = 'London';

# 4.    Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).

select e1.employee_id, e1.last_name, e2.manager_id, e2.last_name
from employees e1
join employees e2 
on e1.EMPLOYEE_ID = e2.manager_id;

# 5.    Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones.

select e1.first_name, e1.last_name, e1.hire_date 
from employees e1
join employees e2
on e1.hire_date > e2.hire_date 
where e2.last_name = 'Jones'; 

# 6.    Write a query to get the department name and number of employees in the department.

select d.department_name, count(*)
from employees e
join departments d
on e.department_id = d.department_id
group by d.department_id;

# 7.    Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.


select e.employee_id , j.job_title , datediff(jh.end_date, jh.start_date) as No_of_days_differences
from employees e
right join jobs j
on e.job_id = j.job_id
join job_history jh
on j.job_id = jh.job_id
where jh.department_id = 90;

# 8.    Write a query to display the department ID and name and first name of manager. 

select d.department_id, d.department_name ,e.first_name
from employees e
join departments d
on e.employee_id = d.manager_id;


# 9. Write a query to display the department name, manager name, and city.

select department_name as DEPT_NAME, concat(first_name, ' ', last_name) as Full_name, l.city as CITY
from employees e
join departments d
on e.department_id = d.department_id 
join locations l
on l.location_id = d.location_id
where e.employee_id = d.manager_id;

# 10. Write a query to display the job title and average salary of employees.

select j.job_title JOB_TITLE, avg(e.salary) as AVG_SALARY
from employees e
join jobs j
on e.job_id = j.job_id
group by j.job_title;

# 11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.

select j.job_title, concat(e.first_name, ' ', e.last_name) as Full_Name , (e.salary - j.min_salary) as DIFF_BET_SAL_N_MIN_SAL
from employees e
join jobs j
on e.job_id = j.job_id;

# 12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.

select * from job_history ;

select jh.employee_id EMP_ID, jh.start_date START_DATE, jh.end_date END_DATE, jh.job_id JOB_ID, jh.department_id DEPT_ID, e.salary SALARY
from employees e
join job_history jh
on e.employee_id = jh.employee_id
where e.salary > 10000;

# 13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.

select d.department_name , concat(e.first_name, ' ', e.last_name) as FULL_NAME, e.hire_date, e.salary
from employees e
join departments d
on e.employee_id = d.manager_id
where timestampdiff(year, hire_date, curdate()) > 15;

