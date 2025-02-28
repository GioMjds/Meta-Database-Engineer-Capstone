CREATE DATABASE LittleLemonDM;

USE LittleLemonDM;

CREATE TABLE Customers (
	CustomerID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20) UNIQUE NOT NULL,
    Address VARCHAR(500) NOT NULL
);

CREATE TABLE Staff (
	StaffID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Role VARCHAR(255) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
	Phone VARCHAR(25) UNIQUE NOT NULL
);

CREATE TABLE Bookings (
	BookingID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
	StaffID INT NOT NULL,
    BookingDate DATE NOT NULL,
    TableNumber INT NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID)
);

CREATE TABLE MenuItems (
	MenuItemID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(255) NOT NULL,
    Price VARCHAR(255) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES MenuBookings (CategoryID)
);

CREATE TABLE MenuBookings (
	CategoryID INT NOT NULL PRIMARY KEY,
    CategoryName ENUM ('Cuisine', 'Starter', 'Main Course', 'Drink', 'Dessert')
);

CREATE TABLE Orders (
	OrderID INT NOT NULL PRIMARY KEY,
    CustomerID INT NOT NULL,
    StaffID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff (StaffID)
);

CREATE TABLE OrderItems (
	OrderItemID INT NOT NULL PRIMARY KEY,
    OrderID INT NOT NULL,
    MenuItemID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems (MenuItemID)
);

CREATE TABLE OrderDeliveryStatus (
	DeliveryID INT NOT NULL PRIMARY KEY,
    OrderID INT NOT NULL,
    DeliveryDate DATE NOT NULL,
    Status ENUM('Preparing', 'In Transit', 'Delivered'),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);