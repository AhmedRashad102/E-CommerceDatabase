create database defacto

create table products(
	prod_id int primary key identity,
	prod_name varchar(50) not null,
	brand varchar (20),
	posting_date date not null,
	color varchar(20),
	price int not null,
	discount tinyint,
	tags varchar(50),
	dep varchar(6),
	category varchar(20),
	season varchar(10)
)
alter table products
alter column prod_id int 


alter table products
alter column discount tinyint not null

create table users(
	user_id int primary key identity,
	user_name varchar (30),
	DOB date,
	Age int,
	email varchar(30),
	type varchar(1),
	password_hash VARCHAR(255) NOT NULL
)

create table user_address(
	user_id int foreign key references users(user_id),
	state varchar(15),
	city varchar(15),
	street varchar(15),
	zipcode int,
	primary key (user_id,state,city,street,zipcode)
)

create table user_pn(
	user_id int foreign key references users(user_id),
	country_code varchar(3),
	phone_number varchar(17),
	primary key(user_id,country_code,phone_number)
)


create table product_reviews(
	prod_id int foreign key references products(prod_id),
	user_id int foreign key references users(user_id),
	review varchar(250) not null,
	primary key(prod_id,user_id)
)

create table prod_images(
	prod_id int foreign key references products(prod_id),
	url varchar(50) not null,
	primary key(prod_id, url)
)

create table prod_size(
	prod_id int foreign key references products(prod_id),
	size int not null,
	primary key(prod_id,size)
)

create table orders(
	order_id int primary key identity,
	payment_id int not null,
	payment_method varchar(30) not null,
	order_value int not null,
	user_id int foreign key references users(user_id),
	order_date date
)


create table order_items(
	order_id int foreign key references orders(order_id),
	prod_id int foreign key references products(prod_id),
	price_per_unit int,
	quantity int not null,
	items_value as (price_per_unit*quantity),
	primary key (order_id,prod_id)
)

create table cart(
	user_id int foreign key references users(user_id),
	last_add date,
	total_value int,
	primary key (user_id)
)
create table cart_items(
	user_id int foreign key references users(user_id),
	prod_id int foreign key references products(prod_id),
	price_per_unit int,
	quantity int not null,
	items_value as (price_per_unit*quantity)
	primary key (user_id,prod_id)
)















