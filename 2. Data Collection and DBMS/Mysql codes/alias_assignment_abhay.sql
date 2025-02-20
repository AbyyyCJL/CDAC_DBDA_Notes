use practice;

# ALias assignment

# 1] Write a query to display EMPLOYEE_ID as ID, FIRST_NAME as First, and LAST_NAME as Last from the employees table.

select employee_id ID, first_name First, last_name as last from employees;

# 2] Write a query to display JOB_ID as JobCode, JOB_TITLE as Title, and MIN_SALARY as MinimumSalary from the jobs table.

select job_id JobCode, JOB_TITLE Title, MIN_SALARY as MinimumSalary from jobs;

# 3] Write a query to display the FIRST_NAME and LAST_NAME of employees from the employees table by using an alias e for the table.

select e.first_name , e.last_name from employees e;

# 4] Write a query to display the EMPLOYEE_ID and the full name (FIRST_NAME + ' ' + LAST_NAME as FullName) of employees, and sort the result by FullName in descending order.

select employee_id, concat(first_name , ' ' , last_name) as fullname from employees order by fullname desc;

# 5] Write a query to display EMPLOYEE_ID as ID, FIRST_NAME as Name, and SALARY as Income from the employees table for employees with a salary greater than 5000, using aliases for the columns.

select employee_id ID, first_name Name, salary as Income from employees where salary > 5000;

################################
###### Do it after Join: #######

# 6] Write a query to display the EMPLOYEE_ID, FIRST_NAME, and DEPARTMENT_NAME from the employees and departments tables 
# using aliases e for employees and d for departments. 

desc employees;
desc departments;

select e.employee_id, e.first_name, d.department_name
from employees e , departments d
where e.department_id = d.department_id;

# 7] Write a query to display COUNTRY_NAME and REGION_NAME from the countries and regions tables, 
# using aliases c for countries and r for regions, where the REGION_ID is greater than 2

show tables;

select c.country_name, r.region_name
from countries c, regions r
where r.region_id > 2 and c.region_id = r.region_id;

# 8] Write a query to display the FIRST_NAME and LAST_NAME of employees whose department name is "IT", 
# using aliases e for employees and d for departments.

select e.first_name, e.last_name, d.department_name 
from employees e, departments d
where d.department_name = "IT";

# 9] Write a query to display the average salary (AVG(SALARY) as AverageSalary) for each department 
# using aliases for the departments and employees tables.

SELECT d.department_name AS DepartmentName,
       AVG(e.salary) AS AverageSalary
FROM departments AS d
JOIN employees AS e ON d.department_id = e.department_id
GROUP BY d.department_name;

# 10] Write a query to display the REGION_NAME and the total number of countries in each region (as CountryCount), 
# using aliases for both the countries and regions tables

select r.region_name,
	count(c.country_name) as CountryCount
from countries as c
join regions as r on c.region_id = r.region_id
group by r.region_name; 