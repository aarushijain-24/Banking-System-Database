-- Withdrawing Money
-- Ensure sufficient balance before withdrawal.
-- Verify the balance is updated correctly.
-- Check the transaction record.
EXEC WithdrawMoney @AccountNumber = 100001, @Amount = 150.00;
SELECT * FROM Accounts WHERE AccountNumber = 100001; -- Check the updated balance
SELECT * FROM Transactions WHERE AccountNumber = 100001; -- Check the transaction record


