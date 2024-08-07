CREATE PROCEDURE WithdrawMoney
    @AccountNumber INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance - @Amount
    WHERE AccountNumber = @AccountNumber;
    
    INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
    VALUES (@AccountNumber, 'Withdrawal', @Amount, GETDATE());
END;
