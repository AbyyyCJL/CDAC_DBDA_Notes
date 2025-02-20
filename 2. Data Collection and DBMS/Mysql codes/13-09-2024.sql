
desc employees;
desc departments;
desc jobs;
desc countries;
desc regions;
desc locations;


# {employees} -- dept_id -- departments -- dept_id -- location_ic -- locations -- location_id --

# {employees} -- job_id -- jobs -- job_titles -- job_id

# {employees} -- job_id -- job_history -- job_id -- department_id -- department -- department_id

# {locations} -- country_id -- {countries} --- countey_id -- region_id -- {regions} -- region_id and region_name --


# write a query to dispaly first_name, last_name, job_title 

select e.first_name, e.last_name, j.job_title
from employees e
join jobs j on e.job_id = j.job_id;


# write a query to find the first_name, last_name, city 

select e.first_name, e.last_name, l.city
from employees e
join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join locations l
on l.location_id = d.location_id;

# wrie a quert to display first_name , lst_name, and country_name

select e.first_name, e.last_name, c.country_name
from employees e
join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join locations l
on l.location_id = d.location_id
join countries c
on l.country_id = c.country_id;

# wrie a quert to display first_name , last_name, country_name, city_name, region_name

 select e.first_name , e.last_name, l.city, r.region_name, c.country_name
 from employees e 
join departments d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join locations l
on l.location_id = d.location_id
join countries c
on l.COUNTRY_ID = c.COUNTRY_ID
join regions r
on r.REGION_ID = c.REGION_ID;


# write a query display name, job_id, job_title ,salalry of employee who have same job and same saalary as other employee in the company

-- condition on which job
-- same job and same salary -- salary and job -- with and operator

select e1.first_name, e1.last_name, e1.job_id, j.job_title, e2.salary
from employees e1
join jobs j
on e1.job_id = j.job_id
join employees e2
on e1.salary = e2.SALARY and e1.EMPLOYEE_ID <> e2.EMPLOYEE_ID
where e1.salary = e2.SALARY and e2.JOB_ID = j.JOB_ID
order by e2.salary desc;

# write a query to display dept_ID  and the no of distinct location where department has employees

desc job_history;

# department id - depart, emp, job_hist
# location - location_id common between depatt and location
# count -- group by

select distinct(l.LOCATION_ID) as Location_Count, d.DEPARTMENT_ID, count(e.employee_id) no_emp
from departments d
join locations l
on d.LOCATION_ID = l.LOCATION_ID
join employees e 
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
group by d.DEPARTMENT_ID
having count(distinct l.location_id) and no_emp > 0; # madam


select d.department_id , count(distinct(l.location_id))
from departments d
join locations l
on d.LOCATION_ID = l.LOCATION_ID
join employees e
on e.department_id = d.department_id
group by d.department_id; # me


# write a query to display no of distict dept where employee works

select count(distinct(e.department_id))
from employees e
join departments d
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.EMPLOYEE_ID is not null;


select e1.department_id, count(*) no_emp
from employees e1
join employees e2
on e1.department_id = e2.department_id 
group by e1.department_id;

select distinct(d.department_id), count(e.employee_id) no_emp, d.department_name 
from departments d
join employees e
on e.department_id=d.department_id
group by department_id
having no_emp>=1
order by no_emp;

select d.department_id, count(*) no_emp
from employees e
join departments d
on e.department_id = d.department_id 
group by d.department_id;


##
# write a query to display country_id and no of employees working in each country that has more than 15 employees
desc locations;
select c.country_id, count(*) as no_of_emp
from employees e
join departments d 
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
join locations l
on l.location_id = d.location_id
join countries c
on c.COUNTRY_ID = l.country_id
group by l.country_id 
having count(*) > 15;


select l.country_id, count(*) as no_of_emp
from employees e
join departments d 
on d.DEPARTMENT_ID = e.DEPARTMENT_ID
join locations l
on l.location_id = d.location_id
group by l.country_id 
having count(*) > 15;

select * from locations;
select * from countries;