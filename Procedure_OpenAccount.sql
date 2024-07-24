CREATE PROCEDURE OpenAccount
    @CustomerID INT,
    @AccountType NVARCHAR(50),
    @InitialDeposit DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Accounts (CustomerID, AccountType, Balance)
    VALUES (@CustomerID, @AccountType, @InitialDeposit);
END;
