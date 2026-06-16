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
