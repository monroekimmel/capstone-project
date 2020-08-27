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
    Email			varchar(75)			not null,
    Constraint vcode unique (Code)
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

insert into USER values
	(1, 'SYSTEM', 'xxxxx', 'System', 'System', 'XXX-XXX-XXXX', 'system@test.com', 0, 0),
    (2, 'monroekimmel', '030477', 'Monroe', 'Kimmel', '513-254-9374', 'monroekimmel@gmail.com', 0, 0)
    ;

insert into VENDOR values
	(1, 'BB-1001', 'Best Buy', '100 Best Buy St', 'Louisville', 'KY', '40207', '502-111-9099', 'geeksquad@bestbuy.com'),
    (2, 'AP-1001', 'Apple Inc', '1 Infinite Loop', 'Cupertino', 'CA', '95014', '800-123-4567', 'genius@apple.com'),
    (3, 'AM-1001', 'Amazon', '410 Terry Ave N', 'Seattle', 'WA', '98109', '206-266-1000', 'amazon@amazon.com'),
    (4, 'ST-1001', 'Staples', '9550 Mason Montgomery Rd', 'Mason', 'OH', '45040', '513-754-0235', 'support@orders.staples.com'),
    (5, 'MC-1001', 'Micro Center', '11755 Mosteller Rd', 'Sharonville', 'OH', '45241', '513-782-8500', 'support@microcenter.com')
    ;