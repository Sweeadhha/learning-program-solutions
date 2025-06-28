CREATE DATABASE IF NOT EXISTS EmployeeDB;
USE EmployeeDB;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE
);
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('Alice', 'Smith', 1, 60000.00, '2024-01-15'),
('Bob', 'Jones', 2, 50000.00, '2024-02-10'),
('Charlie', 'Brown', 1, 55000.00, '2024-03-05');
SELECT * FROM Employees;
DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN deptId INT)
BEGIN
    SELECT EmployeeID, FirstName, LastName, DepartmentID, Salary, JoinDate
    FROM Employees
    WHERE DepartmentID = deptId;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_InsertEmployee(
    IN FirstNameParam VARCHAR(50),
    IN LastNameParam VARCHAR(50),
    IN DepartmentIDParam INT,
    IN SalaryParam DECIMAL(10,2),
    IN JoinDateParam DATE
)
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
    VALUES (FirstNameParam, LastNameParam, DepartmentIDParam, SalaryParam, JoinDateParam);
END $$

DELIMITER ;

CALL GetEmployeesByDepartment(1);
CALL sp_InsertEmployee('David', 'Lee', 2, 52000.00, '2024-06-27');
SELECT * FROM Employees;



