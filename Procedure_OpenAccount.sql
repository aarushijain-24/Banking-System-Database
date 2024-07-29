CREATE OR ALTER PROCEDURE OpenAccount
	@AccountNumber INT,
    @CustomerID INT,
    @AccountType NVARCHAR(50),
    @InitialDeposit DECIMAL(18, 2)
AS
BEGIN
    INSERT INTO Accounts (AccountNumber, CustomerID, AccountType, Balance)
    VALUES (@AccountNumber, @CustomerID, @AccountType, @InitialDeposit);
END;
