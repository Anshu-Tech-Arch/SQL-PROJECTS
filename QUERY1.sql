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
alter table students add column is_passed Bool deafult True; 