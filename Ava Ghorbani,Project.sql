-- table for Products
Drop table if exists Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
)
--find Product which It's price higher than average
 SELECT ProductID,ProductName,Description Color,Price,StockQuantity
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
-- Table for customers
Drop Table if exists Customers;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Address VARCHAR(200)
);


-- Table for orders
Drop table if exists Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
	FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID),
	);
-- Table for order details
Drop Table if exists OrdersDetails;
CREATE TABLE OrdersDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (1, 'Vneck Dress', 'Black', 29.99, 8);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (2, 'Blazer', 'Red', 40.00, 10);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (3, 'Crop Top', 'Grey', 15.99, 100);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (4, 'Maxi Dress', 'Blue', 129.99, 8);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (5, 'Lace Dress', 'Yellow', 89.99, 21);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (6, 'Top', 'White', 21.29, 7);
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity)
VALUES (7, 'T Shirt', 'Black', 8.99, 32);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (1, 'Ava', 'Ghorbani', 'ava.ghorbani@icloud.com', '23237 spectrum');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (2, 'sheila', 'Nouri', 'shila.nori@gmail.com', '6746 spectrum');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (3, 'Anna', 'Rafi', 'anna.rafi@gmail.com',  '1224 anaheim');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (4, 'Mehdi', 'Bibak', 'mehdi.bibak@gmail.com', '4356 vandark');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (5, 'Ryan', 'Bibak', 'ryan.bibak@icloud.com', '23237 spectrum');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (6, 'Anna', 'Ghorbani', 'anna.ghorbani@icloud.com', '12210 idaho');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (7, 'Samin', 'Javan', 'samin.javan@gmail.com', '23024 lake forest Dr');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Address)
VALUES (8, 'Sana', 'Javan', 'sana.javan@gmail.com', '20321 Irvine Ave');


 
 INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (1, 1, '2022-11-12', 29.99);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (2, 4, '2022-01-21', 80.00);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (3, 2, '2021-04-01', 16.98);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (4, 3, '2022-10-01', 50.98);
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (5, 5, '2022-11-12', 17.98);


INSERT INTO OrdersDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (1, 1, 1, 1, 29.99);
INSERT INTO OrdersDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (2, 2, 2, 2, 80.00);
INSERT INTO OrdersDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (3, 3, 3, 3, 47.97);
INSERT INTO OrdersDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (4, 4, 3, 1,40.00);
INSERT INTO OrdersDetails (OrderDetailID, OrderID, ProductID, Quantity, Subtotal)
VALUES (5, 5, 7, 2, 17.98);

--list all products

SELECT * FROM Products;

--list all customers

SELECT * FROM Customers;

select * from Orders;

--list orders by a customer

SELECT Orders.OrderID, Orders.OrderDate, SUM(OrdersDetails.Quantity) AS TotalItems, Orders.TotalAmount
FROM Orders
INNER JOIN OrdersDetails ON Orders.OrderID = OrdersDetails.OrderID
WHERE Orders.CustomerID = 1
GROUP BY Orders.OrderID, Orders.OrderDate, Orders.TotalAmount;
-- update stock quantities of products
UPDATE Products
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 1;
UPDATE Products
SET StockQuantity = StockQuantity - 8
WHERE ProductID = 2;
UPDATE Products
SET StockQuantity = StockQuantity - 90
WHERE ProductID = 3;
UPDATE Products
SET StockQuantity = StockQuantity - 4
WHERE ProductID = 4;
UPDATE Products
SET StockQuantity = StockQuantity - 12
WHERE ProductID = 5;
UPDATE Products
SET StockQuantity = StockQuantity - 5
WHERE ProductID = 6;
UPDATE Products
SET StockQuantity = StockQuantity - 28
WHERE ProductID = 7;

-- find the customers  whose name starts with A 
select * from Customers 
where FirstName like 'A%';

-- Add FullName column to Customers table
ALTER TABLE Customers
ADD FullName VARCHAR(255);

-- Update FullName with concatenated FirstName and LastName
UPDATE Customers
SET FullName = CONCAT(FirstName, ' ', LastName);


--find the number of orders per products in 2022

SELECT
Products.ProductName, COUNT(Orders.OrderID) AS [Number of Orders]

FROM Products 
LEFT JOIN OrdersDetails
ON Products.ProductID = OrdersDetails.ProductID
LEFT JOIN Orders 
ON Orders.OrderID = OrdersDetails.OrderID
WHERE YEAR(Orders.OrderDate) = '2022'
GROUP BY Products.ProductName
ORDER BY COUNT(Orders.OrderID) DESC

select * from OrdersDetails
select * from Orders
select * from Customers
select * from Products
select * from Orders
Select * from OrdersDetails
