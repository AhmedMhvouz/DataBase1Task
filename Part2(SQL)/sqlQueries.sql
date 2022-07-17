CREATE DATABASE myDB
USE myDB


create customers table
CREATE TABLE Customers
(
	CustomerID	INT PRIMARY KEY,
	FirstName	NVARCHAR(255),
	LastName	NVARCHAR(255),
	Address		NVARCHAR(255),
	City		NVARCHAR(100),
	Mobile		NVARCHAR(15),
	Email		NVARCHAR(50)
)

create product table
CREATE TABLE Products 
(
	ProductID	INT PRIMARY KEY,
	Name		NVARCHAR(255),
	Color		NVARCHAR(25),
	Price		FLOAT
)

create orders table
CREATE TABLE Orders
(
	OrderID			INT PRIMARY KEY,
	CustomerID		INT,
	OrderDate		DATE,
	ShipppedDate	DATE
)

create orderdetails table
CREATE TABLE OrderDetails
( 
	OrderID		INT,
	ProductID	INT,
	Quantity	INT
)



INSERT INTO Customers
	(CustomerID, FirstName,	LastName, Address, City, Mobile, Email)
VALUES
	(1, 'Ahmed', 'AlaaEldeen', '128 st. Elstade',  'Kafrelshiekh', '010136778446', 'cxcds@gmail.com'),  
	(2, 'Abeer', 'Elmahdy', '14 st. Elgamee',  'Balteem', '011778443696', 'cxcds@yahoo.com'),
	(3, 'AbdAllah', 'Emad', '7 st. Elmarkaz',  'Beyala', '015136778446', 'cxcds@gmail.com'),
	(4, 'Ahmed', 'Essam', '15 st. Elmaamoon',  'Alryad', '012136778446', 'cxcds@gmail.com'),
	(5, 'Eslam', 'Mohamed', '18 st. Elnabawy',  'Kafrelshiekh', '011136778446', 'cxcds@gmail.com'),
	(6, 'Adel', 'Mahmoud', '21 st. Elgamee Elkbeer',  'Elhamoul', '015136778446', 'cxcds@yahoo.com')


INSERT INTO Products
	(ProductID,	Name, Color, Price)
VAlUES
	(1, 'Samsung Galaxy s20', 'Black', 20000),
	(2, 'Samsung Galaxy s20 Ultra', 'Blue', 20550),
	(3, 'Iphone 12 pro', 'White', 21000),
	(4, 'Iphone 12 pro max', 'Yellow', 21000)


INSERT INTO Orders
	(OrderID, CustomerID, OrderDate, ShipppedDate)
VAlUES
	(2, 5, '2020-10-15' , '2020-10-20')



INSERT INTO OrderDetails
	(OrderID, CustomerID, OrderDate, ShipppedDate)
VAlUES
	(2, 5, '2020-10-15' , '2020-10-20')

SELECT CONCAT(C.FirstName,' ',C.LastName) AS 'Full Name' , P.Name as 'Product Name', P.Color as 'Product Color',
	   P.Price as 'Item Price',  OD.Quantity,(P.Price * OD.Quantity) AS 'Total Price' , O.OrderDate , O.ShipppedDate
	FROM OrderDetails OD
	JOIN Orders O		on OD.OrderID = O.OrderID
	JOIN Products P		on OD.ProductID = P.ProductID
	JOIN Customers C	on O.CustomerID = C.CustomerID