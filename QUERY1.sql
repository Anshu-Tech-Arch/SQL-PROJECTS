select current_date;
select current_time;
select current_timestamp;
select localtime;
select localtimestamp;
use schooldb;
alter table student add column date_joined datetime default (now());
select * from student;
insert into student (id, age, date_joined) 
values(23, 67, now());