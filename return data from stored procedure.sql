
USE employeedb;


DESCRIBE Employees;


DELIMITER $$

CREATE PROCEDURE GetEmployeeCountByDepartment(
    IN deptId INT
)
BEGIN
    SELECT COUNT(*) AS EmployeeCount
    FROM Employees
    WHERE DepartmentID = deptId;
END $$

DELIMITER ;


CALL GetEmployeeCountByDepartment(1);
