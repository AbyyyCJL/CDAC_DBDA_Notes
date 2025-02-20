################################
# Group by Order By Assignment #
################################


# 1] Write a SQL query to find the number of employees hired in each year.

select EXTRACT(YEAR FROM hire_date) ,count(*) as no_of_employees
from employees
group by EXTRACT(YEAR FROM hire_date);

# 2] Write a SQL query to find the number of employees in each department.

select department_id, count(*) 
from employees
group by department_id;

# 3] Write a SQL query to find the department with the highest total salary.

select department_id , max(salary) 
from employees
group by department_id;

# 4]  Write a query to list the number of jobs available in the employees table.

select count(distinct(job_id)) as no_of_distinct_jobs
from employees;

# 5] Write a query to get the total salaries payable to employees.

select sum(salary) as total_salary_payable
from employees;

# 6] Write a query to get the minimum salary from the employees table.

select min(salary) as minimum_salary 
from employees;

# 7] Write a query to get the maximum salary of an employee working as a Programmer. 

select * from jobs;

select max(max_salary) 
from jobs 
where job_title like '%Programmer%'
group by job_title;

# 8] Write a query to get the average salary and number of employees working the department 90. 

select DEPARTMENT_ID, avg(salary) average_salary, count(*) no_of_emp 
from employees 
group by DEPARTMENT_ID
having DEPARTMENT_ID = 90;

select * from employees order by DEPARTMENT_ID desc;

# 9] Write a query to get the highest, lowest, sum, and average salary of all employees. 

select max(salary) Highest_sal, min(salary) Lowest_sal, sum(salary) Sum_sal, avg(salary) as Average_sal
from employees;

# 10] Write a query to get the number of employees with the same job

select job_id, count(*) 
from employees
group by job_id;

# 11] Write a query to get the difference between the highest and lowest salaries. 

select (max(salary) - min(salary)) as Difference_of_high_N_low
from employees;

# 12] Write a query to find the manager ID and the salary of the lowest-paid employee for that manager. 

select manager_id, min(salary)
from employees 
where manager_id is not null
group by manager_id
order by min(salary) desc;

# 13] Write a query to get the department ID and the total salary payable in each department.

select department_id, sum(salary)
from employees 
group by department_id;

# 14] Write a query to get the average salary for each job ID excluding programmer. 

select job_id, avg(salary) as average_salary
from employees
group by job_id
having job_id not like '%prog%';

# 15] Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only. 

select job_id, sum(salary) Total_salary, max(salary) Max_salary, min(salary) Min_salary, avg(salary) Average_salary
from employees
where department_id = 90
group by job_id;

# 16] Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.

select job_id, max(salary) max_salary
from employees
group by job_id
having MAX_SALARY >= 4000;

# 17] Write a query to get the average salary for all departments employing more than 10 employees. 

select department_id, avg(salary) as Average_Salary
from employees
group by department_id
having count(*) > 10;