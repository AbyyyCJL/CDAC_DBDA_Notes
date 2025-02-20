
create database alterass;
use alterass;

# ALTER ASSIGNMENT 

# 1] Write a query to add a new column named 'phone_number' of type VARCHAR(20) to a table named 'customers'.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100)
);

alter table customers add column phone_number varchar(20);
desc customers;

# 2] Write a query to modify the data type of the column 'age' in a table named 'employees' to INT.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age VARCHAR(10),  -- This will be modified later to INT
    salary DECIMAL(10, 2),
    department_id INT
);

alter table employees modify column age int(3);
desc employees;

# 3] Write a query to rename the column 'address' to 'home_address' in a table named 'contacts'.

CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)  -- This will be renamed later to 'home_address'
);

alter table contacts change address home_address varchar(100);

desc contacts;

# 4] Write a query to add a foreign key constraint named 'fk_department' to a column named 'department_id' in a table named 'employees', referencing the 'department_id' column in a table named 'departments'.

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

alter table employees add constraint fk_department foreign key (department_id) references departments(department_id);
desc employees;
desc departments;

alter table employees add constraint foreign key (department_id) references departments(department_id);

# 5] Write a query to drop the primary key constraint from a table named 'students'.

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

alter table students drop primary key;
desc students;

alter table students drop primary key;
alter table students drop primary key;

# 6] Write a query to add a unique constraint named 'uc_email' to a column named 'email' in a table named 'users'.

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100)  -- This will have a unique constraint added later
);

alter table users add constraint uc_email unique (email);
desc users; 

alter table users add constraint uc_mail unique (email);
alter table users add constraint uc_mail unique (email);



# 7] Write a query to add a default value of '0' to a column named 'quantity' in a table named 'inventory'.

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    quantity INT  -- Default value will be set later
);

alter table inventory alter column quantity set default 0 ;
desc inventory;

alter table inventory alter column quantity set default 0;
alter table inventory alter column quantity set default 0;
alter table inventory alter column quantity set default 0;

# 8] Write a query to modify the position of the column 'last_name' to be the first column in a table named 'customers'.

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(100)
);

alter table customers modify column last_name varchar(50) first;
desc customers; 

alter table customers modify column last_name varchar(50) first;
alter table employees modify column last_name varchar(50) first;
alter table employees modify column last_name varchar(50) first;

# 9] Write a query to change the auto-increment value of a column named 'product_id' to start from 1001 in a table named 'products'.

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2)
);

desc products;
alter table products auto_increment = 1001;
desc products;

alter table products auto_increment = 1001;
alter table products auto_increment = 1001;




# 10] Write a query to add a check constraint named 'chk_salary' to a column named 'salary' in a table named 'employees', ensuring that the salary is greater than or equal to 2000.

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age VARCHAR(10),  -- This will be modified later to INT
    salary DECIMAL(10, 2),
    department_id INT
);

alter table employees add constraint chk_salary check (salary >= 2000);
desc employees;


# 11] Write a SQL statement to add a foreign key on the job_id column of the job_history table referencing the primary key job_id of jobs table.


