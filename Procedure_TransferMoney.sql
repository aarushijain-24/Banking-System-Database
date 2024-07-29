CREATE OR ALTER PROCEDURE TransferMoney
    @FromAccount INT,
    @ToAccount INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Ensure sufficient balance in the from account
        IF (SELECT Balance FROM Accounts WHERE AccountNumber = @FromAccount) < @Amount
        BEGIN
            RAISERROR ('Insufficient balance in the from account.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Update balances
        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountNumber = @FromAccount;

        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountNumber = @ToAccount;

        -- Insert transaction records
        INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
        VALUES (@FromAccount, 'Transfer Out', @Amount, GETDATE());

        INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
        VALUES (@ToAccount, 'Transfer In', @Amount, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
