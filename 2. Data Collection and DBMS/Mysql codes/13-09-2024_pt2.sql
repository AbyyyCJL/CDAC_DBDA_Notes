
CREATE TABLE student1 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT,
    course_id INT
);
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT
);
INSERT INTO student1 (student_id, student_name, age, course_id) VALUES
(1, 'John', 21, 101),
(2, 'Sarah', 22, 102),
(3, 'Mike', NULL, NULL),
(4, 'Emma', 24, 103),
(5, NULL, 23, 101);
INSERT INTO course (course_id, course_name, credits) VALUES
(101, 'Mathematics', 4),
(102, 'Science', 3),
(103, 'History', 2),
(104, NULL, NULL);


###########################################################
##################### LEFT JOIN ###########################
###########################################################


select s.student_name, s.age, c.course_name, c.course_id
from student1 s 
left join course c
on c.course_id = s.course_id; 




###########################################################
##################### RIGHT JOIN ##########################
###########################################################

select s.student_name, s.age, c.course_name, c.course_id
from student1 s 
right join course c
on c.course_id = s.course_id; 



create table table1 (col int) ;
create table table2 (col int) ;

insert into table1 values (1), (1), (1), (2), (3), (3), (3);

insert into table2 values (1), (1), (2), (2), (4), (null);

select * 
from table1
left join table2
on table1.col = table2.col;

select * 
from table1
right join table2
on table1.col = table2.col;

