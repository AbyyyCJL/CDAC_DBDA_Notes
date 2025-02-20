
# using HR database

show tables;

# 1.    Write a query to find the name (first_name, last_name) 
# and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.

select first_name, last_name, salary from employees
where salary > 
(
	select salary from employees where last_name = 'Bull'
);

# 2.    Write a query to find the name (first_name, last_name) of all employees who works in the IT department.

select first_name, last_name from employees
where job_id in
(
	select job_id from employees where job_id = 'IT_PROG'
);

# 3.    Write a query to find the name (first_name, last_name) of the employees who have a manager and worked in a USA based department.
select * from locations;
select * from employees;

select first_name, last_name from employees
where manager_id is not null and country_id in
(
	select country_id from locations where country_id = 'US'  
);



# 4.    Write a query to find the name (first_name, last_name) of the employees who are managers. 

select first_name, last_name from employees
where employee_id in
(
	select manager_id from employees
);

# 5. Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary.

select first_name, last_name, salary from employees
where salary > 
(
	select avg(salary) from employees
);

# 6. Write a query to find the name (first_name, last_name), and salary of the employees 
# whose salary is equal to the minimum salary for their job grade.
select * from employees;
select first_name, last_name, salary from employees
where salary in 
(
	select min(salary) from employees group by job_id
);

SELECT e.first_name, e.last_name, e.salary
FROM employees e
JOIN (
    SELECT job_id, MIN(salary) AS min_salary
    FROM employees
    GROUP BY job_id
) min_salaries
ON e.job_id = min_salaries.job_id
AND e.salary = min_salaries.min_salary;



