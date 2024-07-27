CREATE PROCEDURE CreateCustomer
    @CustomerID INT,
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @DateOfBirth DATE,
    @Email NVARCHAR(100),
    @Phone NVARCHAR(15),
    @Address NVARCHAR(255)
AS
BEGIN
    INSERT INTO Customers (CustomerID, FirstName, LastName, DateOfBirth, Email, Phone, Address)
    VALUES (@CustomerID, @FirstName, @LastName, @DateOfBirth, @Email, @Phone, @Address);
END;
