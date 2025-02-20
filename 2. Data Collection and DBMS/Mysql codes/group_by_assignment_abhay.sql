
create database group_by;
use group_by;

################################################################################################################################
#														TABLES																   #

CREATE TABLE salespeople (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);

INSERT INTO salespeople (salesman_id, name, city, commission)
VALUES
(5001, 'John Doe', 'Paris', 0.13),
(5002, 'Maria Kent', 'Rome', 0.12),
(5003, 'Nick Hall', 'London', 0.10),
(5004, 'Clark Kent', 'Rome', 0.14),
(5005, 'Nelson Leo', 'Paris', 0.15),
(5006, 'Andrew King', 'Berlin', 0.11);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salespeople(salesman_id)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id)
VALUES
(3001, 'Bob Smith', 'Paris', 100, 5001),
(3002, 'Alice Lee', 'London', 150, 5003),
(3003, 'Charlie Z', 'Rome', 200, 5002),
(3004, 'Brian King', 'Paris', NULL, 5005),
(3005, 'Ben Smith', 'Berlin', 120, 5006);

CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salespeople(salesman_id)
);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
(7001, 1000.50, '2012-08-15', 3001, 5001),
(7002, 948.50, '2012-08-17', 3002, 5003),
(7003, 1983.43, '2012-08-17', 3003, 5002),
(7004, 3500.00, '2012-08-17', 3004, 5005),
(7005, 4000.00, '2012-08-18', 3005, 5006);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    company_id INT
);

INSERT INTO products (product_id, product_name, price, company_id)
VALUES
(1001, 'Product A', 300.00, 1),
(1002, 'Product B', 350.00, 1),
(1003, 'Product C', 400.00, 2),
(1004, 'Product D', 500.00, 2),
(1005, 'Product E', 600.00, 3);

CREATE TABLE companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(50)
);

INSERT INTO companies (company_id, company_name)
VALUES
(1, 'Company X'),
(2, 'Company Y'),
(3, 'Company Z');

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    allotment DECIMAL(10, 2)
);

INSERT INTO departments (dept_id, dept_name, allotment)
VALUES
(10, 'Sales', 10000.00),
(20, 'Marketing', 12000.00),
(30, 'HR', 8000.00);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept INT,
    salary DECIMAL(10, 2),
    job_title VARCHAR(50),
    location_id INT,
    FOREIGN KEY (emp_dept) REFERENCES departments(dept_id)
);

INSERT INTO employees (emp_id, emp_fname, emp_lname, emp_dept, salary, job_title, location_id)
VALUES
(1, 'John', 'Doe', 10, 5000.00, 'Sales Manager', 1),
(2, 'Jane', 'Smith', 10, 4500.00, 'Sales Associate', 1),
(3, 'Michael', 'Johnson', 20, 5500.00, 'Marketing Director', 2),
(4, 'Emily', 'Davis', 30, 4000.00, 'HR Specialist', 3);

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(50)
);

INSERT INTO locations (location_id, city)
VALUES
(1, 'Paris'),
(2, 'London'),
(3, 'Berlin');

select * from salespeople;
select * from customers;
select * from orders;
select * from products;
select * from companies;
select * from departments;
select * from employees;
select * from locations;

################################################################################################################################

# 1] write a SQL query to calculate the total purchase amount of all orders. Return total purchase amount.

select sum(purch_amt) as Total_Purchase_Amount from orders ;


# 2] write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 

select avg(purch_amt) as Average_Purchase_Amount from orders;


# 3]  write a SQL query that counts the number of unique salespeople. Return number of salespeople.  

SELECT COUNT(DISTINCT salesman_id) AS Number_of_Salespeople FROM salespeople;



# 4] write a SQL query to count the number of customers. Return number of customers.  

select count(*) from customers;


# 5] write a SQL query to determine the number of customers who received at least one grade for their activity.  

select count(*) from customers where grade is not null;


# 6] write a SQL query to find the maximum purchase amount.

select max(purch_amt) as MAX_PURCHASE from orders;


# 7] write a SQL query to find the minimum purchase amount

SELECT MIN(purch_amt) AS MIN_PURCHASE FROM orders;



# 8] write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  

select city, max(grade) from customers group by city;


# 9] write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 

select customer_id , max(purch_amt) as MAX_PURCHASE_AMOUNT from orders group by customer_id;


# 10] write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.

select ord_date, max(purch_amt) from orders group by ord_date;


# 11] write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. Return salesperson ID, purchase amount 

select salesman_id, max(purch_amt) from orders where ord_date = '2012-08-17' group by salesman_id;


# 12] write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. Filter the result by highest order (purchase) amount above 2000.00. 
# Return customer id, order date and maximum purchase amount.

select customer_id , ord_date, max(purch_amt) as MAX_PURCHASE_AMOUNT from orders
group by ord_date, customer_id
having max(purch_amt) > 2000;


# 13]  write a SQL query to find the maximum order (purchase) amount in the range 2000 - 6000 (Begin and end values are included.) by combination of each customer and order date. 
# Return customer id, order date and maximum purchase amount.


select customer_id, ord_date, max(purch_amt) as MAX_PURCHASE_AMOUNT from orders 
group by customer_id , ord_date
having max(purch_amt) between 2000 and 6000;

# 14] write a SQL query to find the maximum order (purchase) amount based on the combination of each customer and order date. Filter the rows for maximum order (purchase) amount is either 2000, 3000, 5760, 6000. 
# Return customer id, order date and maximum purchase amount.


select customer_id, ord_date, max(purch_amt) as MAX_PURCHASE_AMOUNT from orders
group by customer_id, ord_date
having max(purch_amt) in (2000, 3000, 5760, 6000);

# 15]  write a SQL query to determine the maximum order amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included). 
# Return customer id and maximum purchase amount.


select customer_id, max(purch_amt) as MAX_PURCHASE_AMOUNT from orders
group by customer_id
having customer_id between 3002 and 3007;

# 16] write a SQL query to find the maximum order (purchase) amount for each customer. The customer ID should be in the range 3002 and 3007(Begin and end values are included.). Filter the rows for maximum order (purchase) amount is higher than 1000. 
# Return customer id and maximum purchase amount.


select customer_id , min(purch_amt) as MAX_PURCHASE_AMOUNT from orders
group by customer_id
having max(purch_amt) > 1000;

# 17] write a SQL query to determine the maximum order (purchase) amount generated by each salesperson. Filter the rows for the salesperson ID is in the range 5003 and 5008 (Begin and end values are included). 
# Return salesperson id and maximum purchase amount.


select salesman_id, max(purch_amt) as MAX_PURCHASE_AMOUNT from orders
group by salesman_id
having salesman_id between 5003 and 5008;

# 18] write a SQL query to count all the orders generated on '2012-08-17'. Return number of orders.

select ord_date, count(*) as No_of_Orders from orders 
group by ord_date
having ord_date = '2012-08-17';

# 19] write a SQL query to count the number of salespeople in a city. Return number of salespeople.

SELECT city, COUNT(*) AS COUNT_OF_PEOPLE FROM salespeople GROUP BY city;


# 20] write a SQL query to count the number of orders based on the combination of each order date and salesperson. Return order date, salesperson id.

select ord_date, count(salesman_id) from orders
group by ord_date, salesman_id;

# 21] write a SQL query to calculate the average product price. Return average product price.


select avg(price) as AVG_PRICE from products;

# 22] write a SQL query to count the number of products whose price are higher than or equal to 350. Return number of products.

SELECT COUNT(*) AS NO_OF_PRODUCTS FROM products WHERE price >= 350;


# 23] write a SQL query to compute the average price for unique companies. Return average price and company id.

select avg(price) as AVG_PRICE , company_id from products
group by company_id;


# 24] write a SQL query to compute the sum of the allotment amount of all departments. Return sum of the allotment amount.


select dept_name, sum(allotment) as SUM_OF_ALLOTMENT from departments
group by dept_name;


# 25] write a SQL query to count the number of employees in each department. Return department code and number of employees.


select emp_dept , count(*) as NO_OF_EMP from employees
group by emp_dept;


# 26] Find the average salary for each job title in the company.


select job_title, avg(salary) as AVG_SALARY from employees
group by job_title;


# 27] List the number of employees in each department.


select emp_dept , count(*) as NO_OF_EMP from employees
group by emp_dept;


# 28] Determine the total salary expenditure by each department.

select emp_dept, sum(salary) from employees
group by emp_dept ;


# 29] Compute the maximum salary in each location.


select location_id, max(salary) as MAX_SALARY from employees
group by location_id;


# 30] Calculate the total number of employees in each location


select location_id, count(*) as NO_OF_EMPLOYEES from employees
group by location_id;


# 31] Display the job titles of employees who work in the same department.

SELECT job_title FROM employees GROUP BY job_title HAVING COUNT(*) > 1;



# 32] Determine the number of employees in each job title

select count(*) as NO_OF_EMPLOYEES from employees
group by job_title;


# 33] Compute the average salary for employees in each department.


select emp_dept, avg(salary) from employees 
group by emp_dept;


# 34] Find the department names and locations with more than five employees.


SELECT d.dept_name, l.location_id, COUNT(e.emp_id) FROM departments d
JOIN employees e ON d.dept_id = e.emp_dept
JOIN locations l ON e.location_id = l.location_id
GROUP BY d.dept_name, l.location_id
HAVING COUNT(e.emp_id) > 5;



# 35] Calculate the total salary for each department and location.

select sum(salary) as TOTAL_SALARY, emp_dept, location_id from employees
group by emp_dept, location_id;