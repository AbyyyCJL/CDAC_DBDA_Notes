
# find the employee whose salary is more than average salary earned by all emp

use hr_aug;

#1] avg salary earned by all emp
#2] filter the emp based on above result

select avg(salary) from employees;

select * from employees where salary > 6461.682243;

select * from employees where salary > (select avg(salary) from employees);

# multi subquery
-- multiple row, multiple column
select department_id, max(salary)
from employees 
group by department_id;

SELECT 
    *
FROM
    employees
WHERE
    (department_id , salary) IN (SELECT 
            department_id, MAX(salary)
        FROM
            employees
        GROUP BY department_id);

-- single column , multiple row
# find department which does not have any employees

select *
from employees
where department_id not in
(select distinct(department_id) from employees);

-- correlated subquery
# find employees in each department who earn more than avg salary in that department

select avg(salary) from employees where department_id = 50;

select *
from employees e1
where
	salary > 
    (
		select avg(salary) 
        from employees e2
		where e2.department_id = e1.department_id
    );
    

##
# find departments who dont have any employees 

select * 
from departments d
where not exists
(
	select 1 from employees e where e.department_id = d.department_id
);

# subquery inside subquery

# Q] find stores whos sales were better than avg sales 	across all stores

#1] find total-sales for each store
#2] find avg sales for all the stores
#3] compare 1 and 2

select store_name, sum(price) as total_sales
from store_inventory
group by store_name; 