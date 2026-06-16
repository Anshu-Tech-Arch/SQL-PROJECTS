create database temp;
use temp;
create table users(
	id int  unique primary key,
    name varchar(50) not null,
    gender enum("Male", "Female", "Other")
);

insert into users values(1, "Ansh", "Male");
select * from users;
rename table users to programmer;
alter table programmer drop column is_active;	
alter table programmer modify name varchar(150);
alter table programmer modify column id int after name;
select * from programmer;