USE bankly;

-- Table Customers 

CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    registration_date DATE NOT NULL
);


-- Table Advisors

CREATE TABLE IF NOT EXISTS Advisors (
    advisor_id INT PRIMARY KEY ,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Table Accounts 

CREATE TABLE IF NOT EXISTS Accounts (
    account_id INT PRIMARY KEY ,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    balance DECIMAL(15, 2),
    account_type ENUM('Checking', 'Savings', 'Business'),
    customerid INT NOT NULL,
    advisorid INT NOT NULL,
    FOREIGN KEY (customerid) REFERENCES Customers(customer_id),
    FOREIGN KEY (advisorid) REFERENCES Advisors(advisor_id)
);


-- Table Transactions

CREATE TABLE IF NOT EXISTS Transactions (
    transaction_id INT PRIMARY KEY ,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type ENUM('debit', 'credit'),
    transaction_date DATE,
    accountid INT NOT NULL,
    FOREIGN KEY (accountid) REFERENCES Accounts(account_id)
);