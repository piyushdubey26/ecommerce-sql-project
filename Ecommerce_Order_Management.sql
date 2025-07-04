
-- Create Database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Users Table
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT
);

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) CHECK (price > 0),
    stock INT CHECK (stock >= 0)
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Order_Items Table
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Sample Data: Users
INSERT INTO Users VALUES
(1, 'Piyush Dubey', 'Lucknow'),
(2, 'Aarav Sharma', 'Delhi'),
(3, 'Priya Mehra', 'Mumbai');

-- Sample Data: Products
INSERT INTO Products VALUES
(101, 'Laptop', 50000.00, 10),
(102, 'Mouse', 500.00, 100),
(103, 'Keyboard', 1000.00, 50);

-- Sample Data: Orders
INSERT INTO Orders VALUES
(201, 1, '2025-06-25'),
(202, 2, '2025-06-26');

-- Sample Data: Order_Items
INSERT INTO Order_Items VALUES
(201, 101, 1),
(201, 102, 2),
(202, 103, 1);

-- Sample Data: Payments
INSERT INTO Payments VALUES
(301, 201, 'Success'),
(302, 202, 'Pending');

-- View: Order Summary
CREATE VIEW OrderSummary AS
SELECT 
    u.name AS customer_name,
    o.order_id,
    p.name AS product_name,
    oi.quantity,
    pr.status AS payment_status
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
JOIN Order_Items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id
JOIN Payments pr ON o.order_id = pr.order_id;

-- Trigger: Auto-update stock after successful payment
DELIMITER //
CREATE TRIGGER update_stock_after_payment
AFTER INSERT ON Payments
FOR EACH ROW
BEGIN
    IF NEW.status = 'Success' THEN
        UPDATE Products p
        JOIN Order_Items oi ON p.product_id = oi.product_id
        JOIN Orders o ON oi.order_id = o.order_id
        SET p.stock = p.stock - oi.quantity
        WHERE o.order_id = NEW.order_id;
    END IF;
END;
//
DELIMITER ;

SHOW TABLES;

SELECT * FROM Users;
SELECT * FROM Products;


DESCRIBE Users;

SELECT * FROM Users;
SELECT * FROM Orders;
SELECT * FROM Order_Items;
SELECT * FROM Payments;


