create database bookstore_db;
use bookstore_db;
create table Authors(
	author_id int Primary Key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    country varchar(50) default('India'),
    birth_date date
); 

create table Books(
	book_id int Primary Key auto_increment,
    title varchar(50) not null,	
    author_id int,
    genre varchar(50),
    price decimal (10,2),
    stock int default(50), 
    published_date date,
	foreign key (author_id) references Authors(author_id)
);

create table Customers(
	customer_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(50) unique not null,
    city varchar(50),
    join_date date
);

create table Orders(
	order_id int primary key auto_increment,
    customer_id int ,
    order_date date,
    total_amount decimal(10,2),
    status varchar(50) check(status in('Packed', 'Shipped', 'Out_For_Delivery', 'Delivered')),
    foreign key(customer_id) references Customers(customer_id)
);

create table Order_Items(
	item_id int primary key auto_increment,
    order_id int,
    book_id int,
    quantity int CHECK (quantity>0),
    selling_price decimal(10,2),
    foreign key(order_id) references Orders(order_id),
    foreign key(book_id) references Books(book_id)
);