
# date function 

select * from employees;

desc job_history;

select curdate();

select * from employees where hire_date = curdate();

select sysdate();

select current_time();

select current_date();

select first_name, year (hire_date) as year_of_hire, month(hire_date) as month_of_hire from employees;

select first_name, day(hire_date) as day_of_hire from employees;

select first_name, hire_date , day(hire_date), dayname(hire_date) as day_of_hire from employees;

select first_name, hire_date , day(hire_date), dayname(hire_date) day_of_hire, dayofmonth(hire_date) as day_of_month from employees;

select first_name, hire_date , day(hire_date), dayname(hire_date) day_of_hire, dayofyear(hire_date) as day_of_year from employees; # index of the date from 1 Jan


select dayofweek(hire_date) from employees;

select dayofyear(hire_date) from employees;




select date_add(curdate(), interval 30 day) as new_added_day;

select date_sub(curdate(), interval 30 day) as new_added_day;

select first_name, last_name, hire_date ,
datediff(curdate(), hire_date) as diff_date from employees;

select first_name, last_name, hire_date , extract(year from hire_date) as year_of_hire from employees;

select first_name, last_name, hire_date , extract(month from hire_date) as month_of_hire from employees;

select first_name, last_name, hire_date , extract(week from hire_date) as week_of_hire from employees;

select first_name, last_name, hire_date , extract(day from hire_date) as day_of_hire from employees;


select first_name, hire_date, date_format(hire_date, '%D %M %y') as hire_date_in_DMY from employees;

select first_name, hire_date, date_format(hire_date, '%M %D %y') as hire_date_in_MDY from employees;

select first_name, hire_date, date_format(hire_date, '%Y %M %D') as hire_date_in_YMD from employees;

# convert str to date
select first_name, hire_date, str_to_date(hire_date, '%Y-%m-%D') as hire_date_in_DMY from employees;

# Q] write a query to find the enmployee who have been hired for the last 90 days

select first_name , hire_date , datediff(curdate() , hire_date) as date_diff from employees where datediff(curdate() , hire_date) < 90;

select first_name , hire_date , timestampdiff(year, hire_date, curdate()) as date_diff from employees where timestampdiff(year, hire_date, curdate()) <= 90;

select first_name , hire_date , timestampdiff(month, hire_date, curdate()) as date_diff from employees; 
select first_name , hire_date , timestampadd(month, 5, curdate()) as date_diff from employees;

select first_name , hire_date , timestampdiff(day, hire_date, curdate()) as date_diff from employees where timestampdiff(day, hire_date, curdate()) <= 90;

select timestampadd(year, 3, curdate());

select timestampadd(year, 3, hire_date) from employees;

select first_name, week(hire_date) as week_of_hire from employees;

select dayofyear(hire_date), hire_date from employees;

select sec_to_time(1973);
select time_to_sec('00:01:34');


select first_name, hire_date
from employees
where hire_date
between curdate() and date_sub(curdate(), interval 90 day);

select first_name, hire_date
from employees
where hire_date = date_sub(curdate(), interval 90 day);

# find emp who have been hired in the year of 2000

select first_name, hire_date from employees where extract(year from hire_date) = 2000;

select first_name, hire_date from employees where year(hire_date) = 2000;

#############3
# q] find tenure of emp in the organization

desc employees;

select first_name, hire_date, timestampdiff(year, hire_date, curdate()) from employees; 

select first_name, hire_date, year(curdate())-year((hire_date)) as tenure from employees; 

select first_name, hire_date, floor(datediff(curdate(), hire_date)/365) as tenure from employees; 


##################################################################################################

######################### CASE #############################################

select employee_id, first_name, last_name, hire_date, manager_id,
case
	when manager_id = 100 then 'ADMIN'
	when manager_id = 201 then 'Marketing'
	when manager_id = 108 then 'Finance'
end as manager_details
from employees order by manager_details desc;

#################################################################################

select employee_id, first_name, last_name, salary,
case
	when salary <= 500 then "Low "
    when salary between 500 and 1500 then "Medium"
	when salary between 1500 and 5000 then "Highly Medium"
	when salary > 5000 then "Richie Rich"
end as financial_status
from employees order by salary desc;

######################

select department_id, department_name, location_id,
case
	when location_id = 1700 then 'USA'
	when location_id = 1600 then 'UK'
	when location_id = 2500 then 'Canada'
    else 'other'
end as location_id_name
from departments order by location_id;

desc departments;

# Q] write a query to give bonus to employees who is having job_id as 'AD_VP', 'IT_PROG', give the employee the bonus of 50 % of their salary
	# and others dont get any bonus
desc employees;

select first_name, job_id, salary, 
case
	when job_id = 'AD_VP' then (salary + salary * 0.5)
	when job_id = 'IT_PROG' then (salary + salary * 0.5)
    else salary
end as salary_after_giving_bonus,
case 
	when job_id = 'AD_VP' then salary * 0.5
	when job_id = 'IT_PROG' then salary * 0.5
    else 0
end as bonus_given
from employees order by job_id;

###############

# Q] write a  query to select employees who got bosus if they are in dept = 90 or slaary greater then 1000

select first_name, last_name, salary, department_id from employees
where
case
	when department_id = 90 then 1
    when salary > 1000 then 1
    else 0
end = 1;

######################################
######## IF ################3
select first_name, salary, if(salary> 10000, 'Good Salary', 'Poor Salary') from employees;

desc locations;
select location_id, city, if (location_id = 1000 or location_id = 1700, 'Egypt', null) as location_details from locations;

-- select first_name, salary, if(avg(salary) > 500, salary, null) as sal_details from employees group by first_name;
-- select first_name, salary, avg(if(salary) > 500, salary, null) as sal_details from employees group by first_name;


####################################################################

######### GROUP BY #########

select count(*) from employees group by department_id;

select department_id , count(*) from employees group by department_id;

select department_id, sum(salary) from employees group by department_id;

# Q} find no of employees hired in each month for any specific year

desc employees;
select month(hire_date) month_speci, count(*) no_emp from employees where year(hire_date) = 1987 group by month(hire_date);


# Q] Find the dept with more than 5 employees

select department_id, count(*) no_emp from employees group by department_id having count(*) > 5;



select get_format(date, 'usa');

select pi();