CREATE OR ALTER PROCEDURE DepositMoney
    @AccountNumber INT,
    @Amount DECIMAL(18, 2)
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Ensure the account exists
        IF NOT EXISTS (SELECT 1 FROM Accounts WHERE AccountNumber = @AccountNumber)
        BEGIN
            RAISERROR ('Account number does not exist.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Update balance
        UPDATE Accounts
        SET Balance = Balance + @Amount
        WHERE AccountNumber = @AccountNumber;

        -- Insert transaction record
        INSERT INTO Transactions (AccountNumber, TransactionType, Amount, TransactionDate)
        VALUES (@AccountNumber, 'Deposit', @Amount, GETDATE());

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
