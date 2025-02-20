

select * from employees;
select * from departments;
select * from locations;
select * from regions;
select * from countries;

-- fetch the employee_name and department_name they belong to 

select e.first_name, e.last_name, d.department_name
from employees e 
join departments d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;


##
# LEFT JOIN

-- fetch all the employees name and their department name they belong to 

select e.first_name, e.last_name, d.department_name
from employees e 
left join departments d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;


##
# RIGHT JOIN

-- fetch all the employees name and their department name they belong to 

select e.first_name, e.last_name, d.department_name
from employees e 
right join departments d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID;