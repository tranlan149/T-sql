create database bai7;
use bai7;
create table Customers(
	CustomerID INT PRIMARY KEY, 
    FirstName VARCHAR(50), 
    LastName VARCHAR(50), 
    Email VARCHAR(100)
);
create table Products(
	ProductID INT PRIMARY KEY, 
    ProductName VARCHAR(100), 
    Price DECIMAL(10, 2)
);
create table Orders(
	OrderID INT PRIMARY KEY, 
    CustomerID INT,
    OrderDate DATE, 
    TotalAmount DECIMAL(10, 2)
);
create table Promotions(
	PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100),
    DiscountPercentage DECIMAL(5, 2)
);
create table  Sales(
	 SaleID INT PRIMARY KEY,
     OrderID INT ,
     SaleDate DATE, 
     SaleAmount DECIMAL(10, 2)
);
alter table orders 
add foreign key (CustomerID) references Customers(CustomerID);
alter table Sales
add foreign key (OrderID) references Orders(OrderID);
delimiter $$
create procedure CalculateMonthlyRevenueAndApplyPromotion (in monthYear varchar(255), in revenueThreshold DECIMAL(10,2))
begin 
	select c.*,sum(o.TotalAmount) from customers c join orders o on c.CustomerID = o.CustomerID
	group by name;
end $$
delimiter ;





