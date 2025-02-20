
# HR Assignment

# 1. Write a SQL statement to rename the table countries to country_new.


alter table countries rename to country_new;
select * from country_new;

# 2. Write a SQL statement to add a column region_id to the table locations.

desc locations;
alter table locations add column region_id int(6);
desc locations;

# 3. Write a SQL statement to add a column ID as the first column of the table locations.

desc locations;
alter table locations add column column_id varchar(50) first;
desc locations;

# 4. Write a SQL statement to add a column region_id after state_province to the table locations.

alter table locations modify column region_id int(6) after state_province;
desc locations;

# 5. Write a SQL statement to change the data type of the column country_id to integer in the table locations.

desc locations;
select * from locations;
alter table locations change column country_id country_id int;
desc locations;

# 6. Write a SQL statement to drop the column city from the table locations.

desc locations;
alter table locations drop column city;
desc locations;

# 7. Write a SQL statement to change the name of the column state_province to state, keeping the data type and size same.

desc locations;
alter table locations change state_province state varchar(25);
desc locations;

# 8. Write a SQL statement to add a primary key for the columns location_id in the locations table.

alter table locations drop primary key;
alter table locations add primary key (location_id);
desc locations; 

