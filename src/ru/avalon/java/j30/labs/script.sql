create table roles
(
    id int unique,
    name varchar(255) primary key
);

create table userinfo
(
    id int primary key,
    name varchar(255),
    surname varchar(255)
);

create table users
(
    id int unique,
    password varchar(255),
    email varchar(255) primary key, 
    info int unique references userinfo(id),
    roles int references roles(id)
);

create table supplier
(
    id int unique,
    name varchar(255) primary key,
    address varchar(255) not null,
    phone varchar(255),
    representative varchar(255) not null   
);

create table product 
(
    id int unique,
    code varchar(255) primary key, 
    title varchar(255),
    supplier int references supplier(id),
    initial_price double,
    retail_value double
);

create table orders
(
    id int primary key,
    users int references users(id),
    created timestamp default current_timestamp
);

create table order2product
(
    orders int,
    product int,
    constraint pk_order_product primary key(orders, product)
);
