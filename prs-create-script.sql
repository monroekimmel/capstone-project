drop database if exists prs;
create database prs;
use prs;

create table USER (
	ID				integer				primary key auto_increment,
    UserName 		varchar(20)			not null,
    Password		varchar(10)			not null,
    FirstName		varchar(20)			not null,
    LastName		varchar(20)			not null,
    PhoneNumber		varchar(12)			not null,
    Email			varchar(75)			not null,
    IsReviewer		TinyInt				not null,
    IsAdmin			TinyInt				not null,
    Constraint uname unique (UserName)
);

create table VENDOR (
	ID				integer				primary key auto_increment,
    Code			varchar(10)			not null,
    Name			varchar(255)		not null,
    Address			varchar(255)		not null,
    City			varchar(255)		not null,
    State			varchar(2)			not null,
    Zip				varchar(5)			not null,
    PhoneNumber		varchar(12)			not null,
    Email			varchar(75)			not null
);

create table REQUEST (
	ID				integer				primary key auto_increment,
    UserID			integer				not null,
    Description		varchar(10)			not null,
    Justification	varchar(255)		not null,
    DateNeeded		date				not null,
    DeliveryMode	varchar(25)			not null,
    Status			varchar(20)			not null,
    Total			decimal(10,2)		not null,
    SubmittedDate	datetime			not null,
    ReasonforRejection	varchar(100)	null,
    Foreign Key (UserID) references user(ID)
);

create table PRODUCT (
	ID				integer				primary key auto_increment,
	VendorID		integer				not null,
	PartNumber		varchar(50)			not null,
	Name			varchar(150)		not null,
	Price			decimal(10,2)		not null,
	Unit			varchar(255)		null,
    PhotoPath		varchar(255)		null,
    Foreign Key (VendorID) references vendor(ID),
    Constraint vendor_part unique (VendorID,PartNumber)
);

create table LINEITEM (
	ID				integer				primary key auto_increment,
    RequestID		integer				not null,
    ProductID		integer				not null,
    Quantity		integer				not null,
    Foreign Key (ProductID) references product(ID),
    Foreign Key (RequestID) references request(ID),
    Constraint req_pdt unique (RequestID,ProductID)
);