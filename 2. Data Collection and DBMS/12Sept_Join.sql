CREATE DATABASE JOIN_QUERIES;
USE JOIN_QUERIES;
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

 
 select *from employee_jn;
 select *from department_jn;
 
 # Q. WAQ to find name and salary of all employees along with their corresponding department_name
 -- name,salary -- employee table
 -- dept_name -- department table
 -- common dept_id,department_id
 
 select e_name,salary,department_name from employee_jn 
 inner join department_jn on 
 department_id=dept_id;
 
 #########
  # Q. WAQ to find name,department_id and manager_id of all employees along with their corresponding department_name
select e_name,department_id,manager_id, department_name from employee_jn
inner join department_jn on
department_id=dept_id;

# Q. WAQ to find name,department_id and manager_id of all employees along with their corresponding department_name where the department_name is 'Sales'
 select e_name,department_id,manager_id, department_name from employee_jn
inner join department_jn on
department_id=dept_id where department_name = 'Sales';

# Q. WAQ to find name,department_id and manager_id of all employees along with their corresponding department_name where salary is in range of 2000 to 5000
 select e_name,department_id,manager_id, department_name,salary from employee_jn
inner join department_jn on
department_id=dept_id where salary between (2000) and (5000);

use hr;
show tables;
select e.first_name,e.manager_id,d.department_id,d.department_name from employees as e
join departments as d
on e.DEPARTMENT_ID=d.DEPARTMENT_ID;
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
use hr;
select *from employees;
select *from departments;
select *from locations;
select *from countries;
select *from regions;

select *from jobs;
select *from job_history;

 -- (employees table) -- department_id --
 -- (departments table) --  department_id -- location_id
 -- (locations table) -- location_id -- country_id 
 -- (country table) -- country_id -- region_id
 -- (regions table) -- region_id
 
 -- (employees table) -- job_id
 -- (jobs table) -- job_title -- job_id
 
 
 # WAQ to display first_name,last_name and job_title from employees
 select first_name,last_name,job_title from employees as e
 inner join jobs as j
 on e.job_id = j.job_id;
 
 #####
 # WAQ to find first_name,last_name,city
 select e.first_name,e.last_name,l.city from employees as e
 inner join departments as d
 on e.department_id = d.department_id
 inner join locations as l
 on d.location_id = l.location_id;
 
# WAQ to display first_name,last_name and country name
select e.first_name,e.last_name,c.country_name from employees as e
 inner join departments as d
 on e.department_id = d.department_id
 inner join locations as l
 on d.location_id = l.location_id
 inner join countries as c
 on l.country_id = c.country_id;
 
 # WAQ to display first_name,last_name,city_name,country_name and region name
 select e.first_name,e.last_name,l.city,c.country_name,r.region_name from employees as e
 inner join departments as d
 on e.department_id = d.department_id
 inner join locations as l
 on d.location_id = l.location_id
 inner join countries as c
 on l.country_id = c.country_id
 inner join regions as r
 on c.region_id = r.region_id;
 
 # WAQ to display first_name,last_name,job_id,job_title,salary of employees who have same job and same salary as other employees in the company
select distinct(e.employee_id),e.first_name,e.last_name,e.job_id,j.job_title,e.salary from employees as e 
inner join employees e1
on e.job_id=e1.job_id and (e.salary=e1.salary) and e.employee_id <> e1.employee_id
inner join jobs as j
on e.job_id = j.job_id
order by salary;
 
 SELECT DISTINCT e.employee_id, e.first_name, e.last_name, e.job_id, j.job_title, e.salary
FROM employees AS e
INNER JOIN jobs AS j
ON e.job_id = j.job_id
WHERE (e.job_id, e.salary) IN (
    SELECT e1.job_id, e1.salary
    FROM employees AS e1
    GROUP BY e1.job_id, e1.salary
    HAVING COUNT(e1.employee_id) > 1
)
ORDER BY e.salary;

 
 # WAQ to display department_id and the number of distinct location where department has employees
select distinct(l.location_id), d.department_id, count(e.employee_id) no_emp from departments as d
inner join locations as l
on d.location_id = l.location_id
join employees e
on e.department_id = d.department_id
group by d.department_id
having count(distinct (l.location_id)) and no_emp>0
order by no_emp;

# WAQ to find distinct departments where employee works
select distinct(d.department_id),count(e.employee_id) no_emp, d.department_name from departments d
join employees as e
on d.department_id = e.department_id
group by e.department_id
having no_emp>0
order by no_emp desc;

# WAQ to display country_id and no_of_employees working in each country that has more than 15 employees
 select count(e.employee_id) no_emp,c.country_name from employees e
 join departments d
 on e.department_id = d.department_id
 join locations l 
 on l.location_id = d.location_id
 join countries c
 on l.country_id = c.country_id
 group by l.country_id
 having no_emp > 15;
 
-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
### LEFT and RIGHT JOIN
use join_queries;
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    course_id INT
);
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
INSERT INTO student (student_id, student_name, age, course_id) VALUES
(1, 'John', 21, 101),
(2, 'Sarah', 22, 102),
(3, 'Mike', NULL, NULL),
(4, 'Emma', 24, 103),
(5, NULL, 23, 101);
INSERT INTO course (course_id, course_name, credits) VALUES
(101, 'Mathematics', 4),
(102, 'Science', 3),
(103, 'History', 2),
(104, NULL, NULL);
 
 select *from student;
 select *from course;
 
### LEFT JOIN
select s.student_id,s.student_name,s.age,c.course_name from student s
left join course c
on s.course_id = c.course_id;

### RIGHT JOIN
select s.student_id,s.student_name,s.age,c.course_name from student s
right join course c
on s.course_id = c.course_id;

---------------------------------------------------------------------
-- ASSIGNMENT ON JOIN
use hr;
#1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.
select concat(d.location_id,",",l.street_address,",",l.city,",",l.state_province,",",c.country_name) as address,department_name from departments d
inner join locations l
on d.location_id = l.location_id
inner join countries c
on l.country_id = c.country_id;

#2. Write a query to find the name (first_name, last name), department ID and name of all the employees.
select concat(e.first_name," ",e.last_name) as emp_name, e.department_id from employees e
inner join departments d
on e.department_id = d.department_id;

#3. Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in London.
select concat(e.first_name," ",e.last_name) as emp_name,e.job_id,e.department_id from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where city = 'london';

#4.    Write a query to find the employee id, name (last_name) along with their manager_id and name (last_name).
select e.employee_id,e.last_name,e.manager_id from employees e;

#5.    Write a query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones.
select concat(e.first_name," ",e.last_name) as emp_name, e.hire_date from employees e
join employees e1
on e.hire_date > e1.hire_date
where e1.last_name = 'Jones';

select concat(first_name," ",last_name) as emp_name, hire_date from employees where hire_date > (select hire_date from employees where last_name = 'Jones');

#6. Write a query to get the department name and number of employees in the department.
select count(e.employee_id) as emp_count,e.department_id,d.department_name from employees e
join departments d
on e.department_id = d.department_id
group by department_id;

#7. Write a query to find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90.
select e.employee_id,e.job_id from employees e
join job_history j_h
on e.department_id = j_h.department_id;/*ERROR*/

select employee_id,department_id,job_id,datediff(end_date, start_date) as no_of_days from job_history where department_id = 90;

#8.    Write a query to display the department ID and name and first name of manager. 
select e.first_name,e.department_id,d.department_name from employees e
join departments d
on e.employee_id = d.manager_id;

#9.    Write a query to display the department name, manager name, and city.
select d.department_name, e.first_name as manager_name, l.city from departments d
join employees e
on e.employee_id = d.manager_id
join locations l
on l.location_id = d.location_id;

#10. Write a query to display the job title and average salary of employees.
select j.job_title, floor(avg(e.salary)) as avg_sal from employees e
join jobs j
on e.job_id = j.job_id
group by j.job_id;

#11. Write a query to display job title, employee name, and the difference between salary of the employee and minimum salary for the job.
select j.job_title,e.first_name,floor(e.salary - j.min_salary) diff_sal from employees e
join jobs j
on e.job_id = j.job_id;

#12. Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary.
select j_h.employee_id,j_h.start_date,j_h.end_date,j_h.job_id,j_h.department_id,e.salary from employees e
join job_history j_h
on e.employee_id = j_h.employee_id
where e.salary > 10000;

#13. Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose experience is more than 15 years.
select concat(e.first_name," ",e.last_name) as emp_name,d.department_name,e.hire_date,e.salary from employees e
join departments d
on e.employee_id = d.manager_id 
where datediff(curdate(),e.hire_date) > 15;




 