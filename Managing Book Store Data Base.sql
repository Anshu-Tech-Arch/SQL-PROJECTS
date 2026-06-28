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

alter table Authors drop column country;
select * from Authors;
alter table Books add column M_F_D date;
select * from Books;
alter table Customers rename column email to email_id;
select * from Customers;
alter table Orders modify column total_amount decimal(10,2) not null;
select * from Orders;
alter table Order_Items alter column quantity set default(null);

INSERT INTO Authors (first_name, last_name, birth_date) VALUES
('Chetan', 'Bhagat', '1974-04-22'),
('Amish', 'Tripathi', '1974-10-18'),
('Ruskin', 'Bond', '1934-05-19'),
('J. K.', 'Rowling', '1965-07-31'),
('George', 'Orwell', '1903-06-25'),
('Paulo', 'Coelho', '1947-08-24'),
('Dan', 'Brown', '1964-06-22'),
('Agatha', 'Christie', '1890-09-15'),
('Stephen', 'King', '1947-09-21'),
('Khaled', 'Hosseini', '1965-03-04');

INSERT INTO Books
(title, author_id, genre, price, stock, published_date, M_F_D)
VALUES
('Five Point Someone',1,'Fiction',399.00,40,'2004-01-01','2003-12-15'),
('Revolution 2020',1,'Fiction',299.00,25,'2011-01-01','2010-12-20'),
('The 3 Mistakes of My Life',1,'Fiction',350.00,18,'2008-01-01','2007-12-10'),
('The Immortals of Meluha',2,'Mythology',499.00,30,'2010-01-01','2009-11-25'),
('The Secret of the Nagas',2,'Mythology',550.00,20,'2011-01-01','2010-11-30'),
('The Oath of the Vayuputras',2,'Mythology',600.00,15,'2013-01-01','2012-11-18'),
('The Blue Umbrella',3,'Children',250.00,12,'1980-01-01','1979-12-05'),
('Harry Potter and the Philosopher''s Stone',4,'Fantasy',799.00,50,'1997-06-26','1997-05-20'),
('Harry Potter and the Chamber of Secrets',4,'Fantasy',850.00,35,'1998-07-02','1998-06-10'),
('Animal Farm',5,'Political Fiction',299.00,45,'1945-08-17','1945-07-10'),
('1984',5,'Dystopian',450.00,22,'1949-06-08','1949-05-12'),
('The Alchemist',6,'Fiction',399.00,55,'1988-01-01','1987-12-01'),
('The Da Vinci Code',7,'Thriller',599.00,17,'2003-03-18','2003-02-15'),
('Angels & Demons',7,'Thriller',650.00,9,'2000-05-01','2000-04-02'),
('Inferno',7,'Thriller',700.00,5,'2013-05-14','2013-04-20'),
('Murder on the Orient Express',8,'Mystery',450.00,27,'1934-01-01','1933-12-01'),
('The Shining',9,'Horror',550.00,14,'1977-01-28','1976-12-15'),
('It',9,'Horror',799.00,3,'1986-09-15','1986-08-20'),
('The Kite Runner',10,'Drama',499.00,19,'2003-05-29','2003-04-15'),
('A Thousand Splendid Suns',10,'Drama',550.00,8,'2007-05-22','2007-04-18');

INSERT INTO Customers
(first_name,last_name,email_id,city,join_date)
VALUES
('Rahul','Sharma','rahul@gmail.com','Delhi','2025-01-10'),
('Priya','Verma','priya@gmail.com','Mumbai','2025-02-15'),
('Amit','Singh','amit@gmail.com','Jaipur','2025-03-05'),
('Sneha','Patel','sneha@gmail.com','Ahmedabad','2025-01-22'),
('Rohan','Mehta','rohan@gmail.com','Pune','2025-04-01'),
('Anjali','Gupta','anjali@gmail.com','Lucknow','2025-03-14'),
('Karan','Yadav','karan@gmail.com','Delhi','2025-02-18'),
('Neha','Kapoor','neha@gmail.com','Chandigarh','2025-05-12'),
('Vikas','Kumar','vikas@gmail.com','Patna','2025-06-10'),
('Pooja','Shah','pooja@gmail.com','Surat','2025-02-20'),
('Arjun','Nair','arjun@gmail.com','Kochi','2025-04-18'),
('Meera','Joshi','meera@gmail.com','Bhopal','2025-05-21'),
('Aditya','Roy','aditya@gmail.com','Kolkata','2025-06-05'),
('Simran','Kaur','simran@gmail.com','Amritsar','2025-01-28'),
('Manish','Saxena','manish@gmail.com','Noida','2025-03-30');

INSERT INTO Orders
(order_id,customer_id,order_date,total_amount,status)
VALUES
(1,1,'2025-04-01',798.00,'Delivered'),
(2,2,'2025-04-03',499.00,'Delivered'),
(3,3,'2025-04-08',850.00,'Cancelled'),
(4,4,'2025-04-12',299.00,'Packed'),
(5,5,'2025-04-18',1049.00,'Delivered'),
(6,1,'2025-05-02',399.00,'Delivered'),
(7,6,'2025-05-06',600.00,'Out_For_Delivery'),
(8,7,'2025-05-11',450.00,'Delivered'),
(9,8,'2025-05-18',550.00,'Packed'),
(10,9,'2025-05-21',799.00,'Delivered'),
(11,10,'2025-05-25',250.00,'Cancelled'),
(12,11,'2025-06-01',650.00,'Shipped'),
(13,12,'2025-06-05',399.00,'Delivered'),
(14,13,'2025-06-08',700.00,'Packed'),
(15,14,'2025-06-12',450.00,'Delivered'),
(16,15,'2025-06-15',550.00,'Delivered'),
(17,1,'2025-06-17',499.00,'Shipped'),
(18,2,'2025-06-18',799.00,'Delivered'),
(19,3,'2025-06-20',350.00,'Delivered'),
(20,4,'2025-06-21',600.00,'Packed'),
(21,5,'2025-06-22',550.00,'Delivered'),
(22,6,'2025-06-23',450.00,'Out_For_Delivery'),
(23,7,'2025-06-24',399.00,'Cancelled'),
(24,8,'2025-06-25',299.00,'Packed'),
(25,9,'2025-06-26',650.00,'Shipped');

INSERT INTO Order_Items
(order_id,book_id,quantity,selling_price)
VALUES
(1,1,1,399.00),
(1,12,1,399.00),
(2,4,1,499.00),
(3,9,1,850.00),
(4,10,1,299.00),
(5,13,1,599.00),
(5,7,1,250.00),
(5,1,1,200.00),
(6,12,1,399.00),
(7,6,1,600.00),
(8,11,1,450.00),
(9,17,1,550.00),
(10,18,1,799.00),
(11,7,1,250.00),
(12,14,1,650.00),
(13,1,1,399.00),
(14,15,1,700.00),
(15,16,1,450.00),
(16,20,1,550.00),
(17,19,1,499.00),
(18,8,1,799.00),
(19,3,1,350.00),
(20,6,2,600.00),
(21,17,1,550.00),
(22,11,1,450.00),
(23,12,1,399.00),
(24,2,1,299.00),
(25,14,1,650.00),
(3,8,1,799.00),
(6,2,1,299.00),
(7,4,1,499.00),
(8,5,1,550.00),
(10,16,1,450.00),
(12,15,1,700.00),
(14,13,1,599.00),
(16,19,1,499.00),
(18,9,1,850.00),
(20,3,2,350.00),
(22,10,1,299.00),
(25,5,1,550.00);
select title from Books;
select title from Books where price> (select avg(price) from Books);
select title from Books where genre='Fiction';
select first_name, last_name from Customers where city='Delhi';
select title from Books order by price asc; 
(select title from Books order by price desc limit 5);
update Books set price=price+500;
select * from Books;
Update Books set stock=stock+50;
Update Customers set city='New Delhi' where city='Delhi';
select * from Customers;
SET FOREIGN_KEY_CHECKS = 1;
Delete from Orders;
select * from Orders;
SHOW CREATE TABLE Orders;
ALTER TABLE Orders DROP CHECK orders_chk_1;
alter table Orders add constraint orders_chk_1 check (Status in('Packed', 'Shipped', 'Out_For_Delivery', 'Delivered', 'Cancelled'));
SHOW CREATE TABLE Orders;
SELECT * FROM Orders WHERE status = 'Cancelled';

delete from Orders where status = 'Cancelled'; 
SHOW CREATE TABLE Orders;
alter table Orders drop foreign key orders_ibfk_1;
alter table Orders add constraint foreign_key_orders foreign key(customer_id) references Customers(customer_id);
SHOW CREATE TABLE Order_Items;
ALTER TABLE Orders
DROP CHECK orders_chk_1;
ALTER TABLE Order_Items
ADD CONSTRAINT 
FOREIGN KEY (order_id)
REFERENCES Orders(order_id)
ON DELETE CASCADE;
delete from Orders where status='Cancelled';
SHOW CREATE TABLE Order_Items;
ALTER TABLE Order_Items
DROP FOREIGN KEY order_items_ibfk_1;
SHOW CREATE TABLE Order_Items;