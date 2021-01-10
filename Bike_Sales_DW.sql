--CREATE DATABASE Bike_Sales_DW
USE Bike_Sales_DW

CREATE TABLE Staff_Dim(
	StaffKey int not null IDENTITY,
	StaffId int not null,
	FirstName varchar(60) not null,
	LastName varchar(60) not null,
	Email varchar(255) not null,
	Phone varchar(25),
	Active tinyint not null,
	PRIMARY KEY (StaffKey)
	);

CREATE TABLE Product_Dim(
	ProductKey int not null IDENTITY,
	ProductId int not null,
	ProductName varchar(255) not null,
	BrandName varchar(255) not null,
	CategoryName varchar(255) not null,
	ListPrice decimal(10,2) not null,
	PRIMARY KEY (ProductKey)
	);

CREATE TABLE Store_Dim(
	StoreKey int not null IDENTITY,
	StoreId int not null,
	StoreName varchar(255) not null,
	Email varchar(255) null,
	Street varchar(255) null,
	Phone varchar(25) null,
	City varchar(255) null,
	State_ varchar(10) null,
	ZipCode varchar(5) null,
	PRIMARY KEY (StoreKey)
	);

CREATE TABLE Calendar_Dim(
	CalendarKey INT NOT NULL IDENTITY,
	FullDate DATE,
	DayofWeek_ CHAR(15),
	DayType CHAR(20),
	DayofMonth_ INT,
	Month_	CHAR(10),
	Quarter_ CHAR(2),
	Year_ INT,
	PRIMARY KEY (CalendarKey)
	);

CREATE TABLE Sales_Fact(
	StaffKey INT,
	CalendarKey INT,
	StoreKey INT,
	ProductKey INT,
	OrderId INT,
	SellingPrice decimal(10,2),
	Discount decimal(4,2),
	Quantity INT,
	TotalPrice INT,
	PRIMARY KEY (StaffKey,StoreKey,CalendarKey,ProductKey,OrderId),
	FOREIGN KEY (StaffKey) REFERENCES Staff_Dim(StaffKey),
	FOREIGN KEY (CalendarKey) REFERENCES Calendar_Dim(CalendarKey),
	FOREIGN KEY (ProductKey) REFERENCES Product_Dim(ProductKey),
	FOREIGN KEY (StoreKey) REFERENCES Store_Dim(StoreKey)
	);