create table roles
(
    id int not null unique
    generated always as identity(start with 1, increment by 1),
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
    id int not null unique,
    password varchar(255) not null,
    email varchar(255) not null primary key, 
    info int not null unique references userinfo(id),
    roles int not null references roles(id)
);

create table supplier
(
    id int not null unique,
    name varchar(255) primary key,
    address varchar(255),
    phone varchar(255) not null,
    representative varchar(255)   
);

create table product 
(
    id int not null unique,
    code varchar(255) primary key, 
    title varchar(255) not null,
    supplier int not null references supplier(id),
    initial_price double not null,
    retail_value double not null
);

create table orders
(
    id int primary key,
    users int not null references users(id),
    created timestamp not null default current_timestamp
);

create table order2product
(
    orders int,
    product int,
    constraint pk_order_product primary key(orders, product)
);
