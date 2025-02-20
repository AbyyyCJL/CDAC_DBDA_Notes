
show databases;
use practice;

show tables;
select * from employees;
#String Function

# 1] Write a query to display the FIRST_NAME and LAST_NAME concatenated as Full Name for all employees.

select concat(first_name, ' ', last_name) as Full_name 
from employees;

# 2] Write a query to display the FIRST_NAME in lowercase and the LAST_NAME in uppercase for all employees.

select lower(first_name) First_name, upper(last_name) as Last_name
from employees;

# 3] Write a query to display the COUNTRY_NAME of all countries in uppercase.

select upper(country_name)
from countries;

# 4] Write a query to display the FIRST_NAME and the length of the first name for all employees.

select first_name, length(first_name) as Length_of_fname
from employees;

# 5] Write a query to display the EMAIL and the length of the email address for employees whose email length is greater than 10

select email, length(email) as Length_of_email
from employees
where length(email) > 10;

select * from employees;

# 6] Write a query to extract the first three characters from the FIRST_NAME of all employees.

select left(first_name, 3) as first_3_chars
from employees;

# 7] Write a query to extract the last four characters of the PHONE_NUMBER for all employees.

select right(phone_number, 4) as last_4_nums
from employees;

# 8] Write a query to find the position of the letter 'a' in the LAST_NAME of all employees.

select first_name, locate('a', first_name) as index_of_a
from employees;

# 9] Write a query to find the position of the substring 'IT' in the job title of all employees.

select instr(job_id, 'IT') as index_of_it
from jobs;

# 10] Write a query to replace all occurrences of 'a' with 'X' in the FIRST_NAME of all employees.

select replace(first_name, 'a', 'X') replaced_a_with_X
from employees;

# 11] Write a query to replace the region name 'Europe' with 'EU' in the REGION_NAME column.

select replace(region_name, 'Europe', 'EU') as replaced_Europe_with_EU
from regions;

# 12] Write a query to remove any leading and trailing spaces from the FIRST_NAME of all employees and display the cleaned-up names.

select trim(first_name) as trimmed_fname
from employees;

# 13] Write a query to remove any trailing spaces from the CITY names of all locations.

select trim(city) as trimmed_city
from locations; 

# 14] Write a query to extract the first five characters from the EMAIL of all employees using the LEFT function.

select left(email, 5) as first_5_chars
from employees;

# 15] Write a query to extract the last three characters from the COUNTRY_NAME of all countries using the RIGHT function.

select right(country_name, 3) as last_3_chars
from countries;

# 16] Write a query to extract the domain (everything after '@') from the EMAIL column of all employees.

SELECT 
    SUBSTRING_INDEX(EMAIL, '@', -1) AS domain
FROM 
    employees;
    
# 17] Write a query to extract the country code (first part before space) from the PHONE_NUMBER of all employees.

SELECT 
    phone_number,
    SUBSTRING_INDEX(phone_number, ' ', 1) AS country_code
FROM employees;

# 18] Write a query to compare the FIRST_NAME and LAST_NAME of employees and display 0 if they are the same and a non-zero value if they are different.

select strcmp(first_name, last_name) 
from employees;

# 19] Write a query to compare the REGION_NAME of regions and display 0 if it is 'Asia' and 1 otherwise.

select strcmp(region_name, 'Asia')
from regions;

# 20] Write a query to display the FIRST_NAME, LAST_NAME, and JOB_TITLE concatenated as a single string, with each value separated by a hyphen (-), for all employees.

select concat(FIRST_NAME, '-' ,LAST_NAME,'-', JOB_TITLE) as concatenated_strs
from employees, jobs;

# 21] Write a query to extract the username (portion before @) from the EMAIL column and display it along with the FIRST_NAME for all employees.

SELECT first_name,
       SUBSTRING_INDEX(email, '@', 1) AS username
FROM employees;

# 22] Write a query to replace all occurrences of 'e' with 'E' in the LAST_NAME of employees whose LAST_NAME contains 'e'.

select replace(last_name, 'e', 'E') as last_name_replaced
from employees;

# 23] Write a query to find the position of the first occurrence of the letter 'o' in the FIRST_NAME of employees and display the name along with the position.

select first_name, instr(first_name, 'o') as first_occurrance_of_o
from employees;

# 24] Write a query to display the CITY name for all locations, removing any leading and trailing spaces, and also display the first three characters of the cleaned-up city name.

select left(trim(city), 3) as 3_chars_of_cleaned 
from locations;

# 25] Write a query to find employees whose LAST_NAME contains the letter 'n' and display their LAST_NAME along with the position of the first occurrence of 'n'.

select last_name ,instr(last_name, 'n') as first_occurrance_of_n
from employees;

# 26] Write a query to find the position of the letter 'a' in the FIRST_NAME for all employees. Display the employee's first name and the position of the letter 'a'.

select first_name, instr(first_name, 'a') as first_occurrance_of_a
from employees;

# 27] Write a query to display the position of the first occurrence of 'e' in the JOB_TITLE for all jobs, and display only those where the letter 'e' occurs after the 5th character.

select JOB_TITLE, instr(job_title, 'e') as first_occurrance_of_e
from jobs
where instr(job_title, 'e') > 5;

# 28] Write a query to compare the FIRST_NAME and LAST_NAME of employees and display only those employees where the first name comes alphabetically before the last name.

select first_name, last_name, strcmp(first_name, last_name) as str_eq_or_not
from employees 
where first_name < last_name;

# 29] Write a query to find all departments where the DEPARTMENT_NAME is either 'IT' or 'HR' using the FIND_IN_SET function.

select * 
from  departments
where find_in_set('IT', department_name) or find_in_set('HR', department_name);

# 30] Write a query to display the FIRST_NAME and the length of the name for employees whose FIRST_NAME length is greater than 6.

select first_name, length(first_name) as length_of_fname
from employees
where length(first_name) > 6;

# 31] Write a query to find all countries where the COUNTRY_NAME contains either 'China', 'India', or 'Japan'

select * 
from countries
where country_name in ('China', 'India', 'Japan');

# 32] Write a query to find all employees who have DEPARTMENT_ID present in the list (50, 60, 70)

select * 
from employees 
where department_id in (50, 60, 70);

# 33] Write a query to extract the first two characters from the COUNTRY_NAME function and the last two characters displaying them along with the full COUNTRY_NAME.

select left(country_name, 2) first_2_chars, right(country_name, 2) last_2_chars, country_name 
from countries;

# 34] Write a query to display employees whose LAST_NAME contains the letter 'o' at a position greater than half the length of their last name.

select *
from employees
where last_name like '%o%' and instr(last_name, 'o') > (char_length(last_name) / 2);

# 35] Write a query to find employees whose FIRST_NAME contains the letter 'a' and the letter 'e' and display the positions of both.

select * , instr(first_name, 'a') a_index, instr(first_name, 'e') e_index
from employees
where first_name like '%a%' and first_name like '%e%' ;

# 36] Write a query to extract the domain from the EMAIL column for employees and only display employees whose domain is 'example.com'.

SELECT 
    email,
    SUBSTRING(email FROM POSITION('@' IN email) + 1) AS domain
FROM employees
WHERE SUBSTRING(email FROM POSITION('@' IN email) + 1) = 'example.com';

# 37] Write a query to count the number of employees who belong to department IDs 50, 60, or 70

select department_id, count(*) as no_of_employees
from employees
where department_id in (50, 60, 70)
group by department_id;

# 38] Write a query to display all COUNTRY_NAMEs from the countries table where REGION_ID is either 1 or 3 

select country_name
from countries 
where region_id in (1, 3);

# 39] Write a query to find employees who either work in departments 50, 60, or 70 or have a salary greater than 10,000.

select *
from employees 
where department_id in (50, 60, 70) or salary > 10000;

# 40] Write a query to find employees whose DEPARTMENT_ID is either 50 or 60 and their MANAGER_ID is either 103 or 108.

select * 
from employees 
where department_id in (50, 60) and manager_id in (103, 108);

#########################################################################################################

#########################################################################################################

desc departments;
desc locations;
desc countries;
desc employees;

# 41] Write a query to display FIRST_NAME, LAST_NAME, and COUNTRY_NAME concatenated as a single string with a comma separating each.

select distinct(concat(e.first_name, ',', e.last_name, ',', c.country_name)) as Concatenated_ans
from employees e
join departments d
on e.department_id = d.department_id
join locations l 
on d.location_id = l.location_id
join countries c
on l.country_id = c.country_id;

# 42] Write a query to display the FIRST_NAME in uppercase for employees whose SALARY is greater than 8000 and the LAST_NAME in lowercase for employees whose SALARY is less than 8000.

SELECT 
    CASE 
        WHEN salary > 8000 THEN UPPER(first_name) 
        ELSE NULL 
    END AS U_first_name,
    CASE 
        WHEN salary < 8000 THEN LOWER(last_name) 
        ELSE NULL 
    END AS L_last_name
FROM employees;
