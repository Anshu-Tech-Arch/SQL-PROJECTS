use schooldb;
create table accounts(
	id int unique,
    balance Decimal(10,2) check (balance>=0)
);
select * from accounts;

insert into accounts(id, balance) values (2, 55600.56);