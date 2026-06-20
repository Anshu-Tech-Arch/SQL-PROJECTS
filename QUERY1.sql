create database Anshu;
show databases;
use Anshu;
create table students(
	id int auto_increment primary key,
    name varchar(100) not null default 'No Name',
    age int, 
    email varchar(100) unique, 
    admission_date Date
);
SELECT * FROM STUDENTS; 
Show tables;  
describe students; 
rename table students to studens1;
use anshu;
show tables;
describe studens1;
rename table studens1 to students;
alter table students rename column admission_date to adm_dt;
describe students;
alter table students drop column adm_dt;
alter table students add column is_passed Bool default True;
alter table students modify column name varchar(50) default ('');
alter table students modify column name varchar(50) after is_passed;
create database schooldb;
use schooldb;
create table student(
	id int primary key,
    name varchar(100),
    age int,
    grade varchar(10),
    D_0_B date
);
insert into student(id, name, age, grade, D_0_B) 
values (1, 'Rohan', 34, '10th', '1999-02-13');	
ALTER TABLE STUDENT RENAME COLUMN D_0_B TO D_O_B; 

insert into student(id, name, age, grade, D_O_B) VALUES
(2, 'Ansh', 24, '10th', '2009-12-5'),
(3, 'Aditya', 12, '10th','2009-5-17'),
(4, 'Aman', 26, '12th', '2000-12-4');
	
use schooldb;
select * from student;
select * from student where age > 12;
use schooldb;

update student set grade="X" where grade="10th";
delete from student where D_O_B is null;
select * from student;
