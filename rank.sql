
CREATE DATABASE IF NOT EXISTS ProductDB;

USE ProductDB;


DROP TABLE IF EXISTS Products;


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(100),
    Price DECIMAL(10,2)
);


INSERT INTO Products (ProductName, Category, Price) VALUES
('Laptop A', 'Electronics', 1200.00),
('Laptop B', 'Electronics', 1200.00),
('Laptop C', 'Electronics', 900.00),
('Laptop D', 'Electronics', 800.00),
('Laptop E', 'Electronics', 800.00),
('Phone A', 'Electronics', 700.00),
('Table A', 'Furniture', 300.00),
('Table B', 'Furniture', 300.00),
('Chair A', 'Furniture', 150.00),
('Chair B', 'Furniture', 120.00),
('Desk A', 'Furniture', 400.00);


SELECT * FROM Products;


SELECT
    ProductID,
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum,
    RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankPos,
    DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRankPos
FROM
    Products;


SELECT *
FROM (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Price DESC) AS RowNum
    FROM Products
) AS Ranked
WHERE RowNum <= 3;


SELECT *
FROM (
    SELECT
        *,
        RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS RankPos
    FROM Products
) AS Ranked
WHERE RankPos <= 3;


SELECT *
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY Price DESC) AS DenseRankPos
    FROM Products
) AS Ranked
WHERE DenseRankPos <= 3;
