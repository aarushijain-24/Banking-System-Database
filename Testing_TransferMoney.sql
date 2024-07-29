-- Transferring Amount
-- Ensure sufficient balance in the from account.
-- Verify both accounts are updated correctly.
-- Check both transaction records.
EXEC TransferMoney @FromAccount = 100001, @ToAccount = 100004, @Amount = 100.00;
SELECT * FROM Accounts WHERE AccountNumber = 100001; -- Check the updated balance
SELECT * FROM Accounts WHERE AccountNumber = 100004; -- Check the updated balance
SELECT * FROM Transactions WHERE AccountNumber = 100001; -- Check the transaction record
SELECT * FROM Transactions WHERE AccountNumber = 100004; -- Check the transaction record


