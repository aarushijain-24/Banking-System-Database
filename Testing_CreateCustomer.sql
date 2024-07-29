-- Creating a Customer
-- Ensure all fields are correctly inserted.

EXEC CreateCustomer @CustomerID=103, @FirstName = 'Mukesh', @LastName = 'Tyagi', @DateOfBirth = '1980-02-10',
@Email = 'mukesh.tyagi@example.com', @Phone = '1234567890', @Address = '123, Shanti Vihar';

EXEC CreateCustomer @CustomerID=108, @FirstName = 'Rishi', @LastName = 'Sharma', @DateOfBirth = '1990-08-09',
@Email = 'rishi.sharma@example.com', @Phone = '0987654321', @Address = '456, Aarya Road';



-- Trying to insert duplicate Email (should fail)
EXEC CreateCustomer @CustomerID = '111', @FirstName = 'ABC', @LastName = 'abc', @DateOfBirth = '1995-10-01',
@Email = 'mukesh.tyagi@example.com', @Phone = '1111111111', @Address = '152, Vasant Vihar';



-- Trying to insert duplicate Phone (should fail)
EXEC CreateCustomer @CustomerID = '121',@FirstName = 'DEF', @LastName = 'def', @DateOfBirth = '1995-10-01',
@Email = 'defdef@example.com', @Phone = '1234567890', @Address = '144, Shiv Colony';







