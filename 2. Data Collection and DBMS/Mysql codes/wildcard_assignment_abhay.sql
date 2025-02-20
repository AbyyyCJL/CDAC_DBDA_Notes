
create database wildcard ;
use wildcard;
##########################################################################################################################################
#													  TABLES 																			 #
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
(3007, 'Bob Smith', 'Paris', 100, 5001),
(3008, 'Alice Lee', 'London', NULL, 5003),
(3009, 'Charlie Z', 'Rome', 200, 5002),
(3010, 'Brian King', 'Paris', 150, 5005),
(3011, 'Ben Smith', 'Berlin', 100, 5006);

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
(7001, 1000.50, '2023-01-15', 3007, 5001),
(7002, 948.50, '2023-02-20', 3008, 5003),
(7003, 1983.43, '2023-03-10', 3009, 5002),
(7004, 3500.00, '2023-04-05', 3010, 5005),
(7005, 4000.00, '2023-05-22', 3011, 5006);

CREATE TABLE employees (
    emp_idno INT PRIMARY KEY,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    emp_dept VARCHAR(50)
);

INSERT INTO employees (emp_idno, emp_fname, emp_lname, emp_dept)
VALUES
(101, 'John', 'Davis', 'Sales'),
(102, 'Jane', 'Doe', 'HR'),
(103, 'Michael', 'Dean', 'IT'),
(104, 'Alice', 'Smith', 'Admin');

CREATE TABLE col_test (
    col1 VARCHAR(50)
);

INSERT INTO col_test (col1)
VALUES
('ABC_123'),
('DEF_/456'),
('GHI%789'),
('JKL/890'),
('MNO_/101'),
('PQR102');


select * from salespeople;
select * from customers;
select * from orders;
select * from employees;
select * from col_test;

##########################################################################################################################################

# 1. write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. Return salesman_id, name, city, commission.

select salesman_id , name, city, commission from salespeople where city like 'paris' or city like 'rome';

# 2. Write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. Return salesman_id, name, city, commission.

select salesman_id , name, city, commission from salespeople where city like 'paris' or city like 'rome';

# 3. write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. Return salesman_id, name, city, commission.  

select salesman_id , name, city, commission from salespeople where city not like 'paris' and city not like 'rome';

# 4. write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. Return customer_id, cust_name, city, grade, and salesman_id.  

select customer_id, cust_name, city, grade, salesman_id from customers where customer_id like '300_';


# 5. write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). Return salesman_id, name, city, and commission.  

select salesman_id, name, city, commission from salespeople where commission between 0.12 and 0.14 ;


# 6. write a SQL query to select orders between 500 and 4000 (begin and end values are included). Exclude orders amount 948.50 and 1983.43. 
# Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

select ord_no, purch_amt, ord_date, customer_id, salesman_id from orders where purch_amt between 500 and 4000 
and purch_amt not in (948.50, 1983.43);

# 7. write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission. 

select salesman_id, name, city, commission from salespeople 
where name regexp '^[B-K]';

# 8. Write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'L' (not inclusive). Return salesman_id, name, city, commission.  

SELECT salesman_id, name, city, commission
FROM salespeople
WHERE name NOT REGEXP '^[A-L]';

# 9. write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. Return customer_id, cust_name, city, grade, salesman_id.. 

select customer_id, cust_name, city, grade, salesman_id from customers 
where cust_name like 'B%';

# 10. write a SQL query to find the details of the customers whose names end with the letter 'n'. Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from customers
where cust_name like '%n';

# 11. write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. Rests may be any character. Return salesman_id, name, city, commission. 

select salesman_id, name, city, commission from salespeople
where name like 'N%' and name like '___l%';

# 12.write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.

SELECT col1
FROM col_test
WHERE col1 LIKE '%\_%';

# 13. write a SQL query to identify those rows where col1 does not contain the escape character underscore ( _ ). Return col1.

select col1 from col_test 
where col1 not like '%\_%';

# 14. write a SQL query to find rows in which col1 contains the forward slash character ( / ). Return col1.

select col1 from col_test 
where col1 like '%/%';

# 15. write a SQL query to identify those rows where col1 does not contain the forward slash character ( / ). Return col1.

select col1 from col_test 
where col1 not like '%/%';

# 16. write a SQL query to find those rows where col1 contains the string ( _/ ). Return col1.

select col1 from col_test
where col1 like '%\_/%';

# 17. write a SQL query to find those rows where col1 does not contain the string ( _/ ). Return col1.

select col1 from col_test
where col1 not like '%\_/%';

# 18. write a SQL query to find those rows where col1 contains the character percent ( % ). Return col1.

select col1 from col_test
where col1 like '%\%%';

# 19. write a SQL query to find those rows where col1 does not contain the character percent ( % ). Return col1.

select col1 from col_test
where col1 not like '%\%%';

# 20. write a SQL query to find all those customers who does not have any grade. Return customer_id, cust_name, city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from customers 
where grade is null;

# 21. write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.

select customer_id, cust_name, city, grade, salesman_id from customers 
where grade is not null;

# 22. write a SQL query to locate the employees whose last name begins with the letter 'D'. Return emp_idno, emp_fname, emp_lname and emp_dept. 

select emp_idno, emp_fname, emp_lname, emp_dept from employees
where emp_lname like 'D%';

