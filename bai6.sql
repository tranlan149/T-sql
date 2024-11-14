create database bai6;
use bai6;
create table Customers(
	CustomerID INT Primary Key,
CustomerName VARCHAR(255),
ContactName VARCHAR(255),
Country VARCHAR(255)
);
create table Orders(
OrderID INT Primary Key,
CustomerID INT ,
OrderDate DATE,
TotalAmount DECIMAL(10,2)
);
create table Products(
	ProductID INT Primary Key,
ProductName VARCHAR(255),
Price DECIMAL(10,2)
);
create table OrderDetails(
	OrderDetailID INT Primary Key,
OrderID INT, 
Foreign Key (OrderID) references Orders(OrderID),
ProductID INT, 
Foreign Key (ProductID) references Products(ProductID),
Quantity INT,
UnitPrice DECIMAL(10,2)
);
create view `thong tin don hang` as
select * from Orders;
create view `chi tiet don hang` as
select*from OrderDetails;
create index orderid on orders(OrderID );
create index Quantity on OrderDetails(Quantity);

