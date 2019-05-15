create table Roles
(
    id int not null unique
    generated always as identity(start with 1, increment by 1),
    name varchar(255) not null primary key
);

create table UserInfo
(
    id int not null primary key,
    name varchar(255),
    surname varchar(255)
);

create table Users
(
    id int not null unique,
    email varchar(255) not null primary key,
    password varchar(255) not null,
    info int not null unique references UserInfo(id),
    role int not null references Roles(id)
);

create table Orders
(
    id int not null primary key,
    userid int not null references Users(id),
    created timestamp not null default current_timestamp
);

create table Supplier
(
    id int not null unique,
    name varchar(255) not null primary key,
    address varchar(255),
    phone varchar(255) not null,
    representative varchar(255)  
);

create table Product 
(
    id int not null unique,
    code varchar(255) not null primary key, 
    title varchar(255) not null,
    supplier int not null references Supplier(id),
    initial_price double not null,
    retail_value double not null
);

create table order2product
(
    orderid int not null references Orders(id),
    product int not null references Product(id),
    constraint pk_order_product primary key(orderid, product)
);
