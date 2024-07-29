-- Depositing Money
-- Verify the balance is updated correctly.
-- Check the transaction record.
EXEC DepositMoney @AccountNumber = 100001, @Amount = 200.00;
SELECT * FROM Accounts WHERE AccountNumber = 100001; -- Check the updated balance
SELECT * FROM Transactions WHERE AccountNumber = 100001; -- Check the transaction record


