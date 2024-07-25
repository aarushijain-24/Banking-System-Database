CREATE PROCEDURE ViewTransactionHistory
    @AccountNumber INT
AS
BEGIN
    SELECT TransactionID, TransactionType, Amount, TransactionDate
    FROM Transactions
    WHERE AccountNumber = @AccountNumber
    ORDER BY TransactionDate DESC;
END;
