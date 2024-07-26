-- Add NOT NULL constraint to FirstName
ALTER TABLE Customers
ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

-- Add NOT NULL constraint to LastName
ALTER TABLE Customers
ALTER COLUMN LastName VARCHAR(50) NOT NULL;

-- Add UNIQUE constraint on Email
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);

-- Add UNIQUE constraint on Phone
ALTER TABLE Customers
ADD CONSTRAINT UQ_Customers_Phone UNIQUE (Phone);

-- Add CHECK constraint on Balance
ALTER TABLE Accounts
ADD CONSTRAINT CHK_Accounts_Balance CHECK (Balance >= 0);

-- Add FOREIGN KEY constraint on CustomerID
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

-- Add CHECK constraint on Amount
ALTER TABLE Transactions
ADD CONSTRAINT CHK_Transactions_Amount CHECK (Amount > 0);

-- Add FOREIGN KEY constraint on AccountNumber
ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (AccountNumber) REFERENCES Accounts(AccountNumber);
