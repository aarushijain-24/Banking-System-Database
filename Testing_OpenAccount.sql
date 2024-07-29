-- Opening an Account
-- Ensure the account is linked to the correct customer.
-- Check the initial deposit balance.
EXEC OpenAccount @AccountNumber = '100001', @CustomerID = '103', @AccountType = 'Savings',
@InitialDeposit = 1000.00;
EXEC OpenAccount @AccountNumber = '100004', @CustomerID = '108', @AccountType = 'Checking',
@InitialDeposit = 500.00;

