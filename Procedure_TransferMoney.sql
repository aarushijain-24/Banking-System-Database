CREATE PROCEDURE TransferMoney
    @FromAccount INT,
    @ToAccount INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance - @Amount
    WHERE AccountNumber = @FromAccount;
    
    UPDATE Accounts
    SET Balance = Balance + @Amount
    WHERE AccountNumber = @ToAccount;
    
    INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
    VALUES (@FromAccount, 'Transfer Out', @Amount, GETDATE());
    
    INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
    VALUES (@ToAccount, 'Transfer In', @Amount, GETDATE());
END;
