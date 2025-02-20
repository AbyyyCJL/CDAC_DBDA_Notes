

show databases;
use practice;

show tables;

create table tableA (id int(5), name varchar(10));
create table tableC (id int(5), location varchar(10));

insert into tableA values (1, "John");
insert into tableA values (2, "Alan");

insert into tableC values (1, "NYC");
insert into tableC values (3, "LA");

select * from tableA
join tableC
on tableA.id = tableC.id;

select * from tableA
left outer join tableC
on tableA.id = tableC.id;

select * from tableA
right outer join tableC
on tableA.id = tableC.id;

SELECT * 
FROM tableA 
LEFT JOIN tableC ON tableA.id = tableC.id
UNION
SELECT * 
FROM tableA 
RIGHT JOIN tableC ON tableA.id = tableC.id;
