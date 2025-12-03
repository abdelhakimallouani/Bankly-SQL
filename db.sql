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


-- 1. Inserer dans Advisors 

INSERT INTO Advisors (advisor_id, full_name, email) VALUES
(1, 'Ahmed Alami', 'ahmed.alami@email.ma'),
(2, 'Fatima Zahra Benjelloun', 'fatima.benjelloun@email.ma'),
(3, 'Karim El Fassi', 'karim.elfassi@email.ma'),
(4, 'Leila Mourad', 'leila.mourad@email.ma'),
(5, 'Youssef Chraibi', 'youssef.chraibi@email.ma');
-- SELECT * FROM advisors


-- 2. Inserer dans Customers 

INSERT INTO Customers (customer_id, full_name, email, phone, registration_date) VALUES
(101, 'Mohamed Amine Alaoui', 'm.alaoui@email.ma', '0612-345678', '2023-01-15'),
(102, 'Fatima Ezzahra Benani', 'f.benani@email.ma', '0623-456789', '2023-02-20'),
(103, 'Youssef El Amrani', 'y.elamrani@email.ma', '0634-567890', '2023-03-10'),
(104, 'Amina Chraibi', 'a.chraibi@email.ma', '0645-678901', '2023-04-05'),
(105, 'Karim Bennis', 'k.bennis@email.ma', '0656-789012', '2023-05-12'),
(106, 'Laila Daoudi', 'l.daoudi@email.ma', '0667-890123', '2023-06-18'),
(107, 'Hassan Mansouri', 'h.mansouri@email.ma', '0678-901234', '2023-07-22'),
(108, 'Nadia Rachidi', 'n.rachidi@email.ma', '0689-012345', '2023-08-30'),
(109, 'Omar Saidi', 'o.saidi@email.ma', '0690-123456', '2023-09-14'),
(110, 'Samira Touil', 's.touil@email.ma', '0601-234567', '2023-10-25');
-- SELECT * FROM customers


-- 3. Inserer dans Accounts 

INSERT INTO Accounts (account_id, account_number, balance, account_type, customerid, advisorid) VALUES
(201, 'MA001-1001-01', 25000.00, 'Savings', 101, 1),
(202, 'MA001-1002-01', 15000.50, 'Checking', 101, 2),
(203, 'MA001-2001-02', 75000.00, 'Business', 102, 1),
(204, 'MA001-2002-02', 35000.75, 'Savings', 102, 3),
(205, 'MA001-3001-03', 12000.25, 'Checking', 103, 2),
(206, 'MA001-4001-04', 45000.00, 'Savings', 104, 3),
(207, 'MA001-5001-05', 18000.50, 'Checking', 105, 4),
(208, 'MA001-6001-06', 90000.00, 'Business', 106, 5),
(209, 'MA001-7001-07', 22000.75, 'Savings', 107, 4),
(210, 'MA001-8001-08', 30000.25, 'Checking', 108, 5),
(211, 'MA001-9001-09', 55000.00, 'Business', 109, 1),
(212, 'MA001-10001-10', 15000.50, 'Savings', 110, 2);
-- SELECT * FROM accounts


-- 4. Insérer dans Transactions 

INSERT INTO Transactions (transaction_id, amount, transaction_type, transaction_date, accountid) VALUES
(301, 1000.00, 'credit', '2024-01-05', 201),
(302, 500.00, 'debit', '2024-01-06', 201),
(303, 2000.00, 'credit', '2024-01-10', 201),
(304, 1500.00, 'credit', '2024-01-07', 202),
(305, 300.00, 'debit', '2024-01-08', 202),
(306, 5000.00, 'credit', '2024-01-12', 203),
(307, 2500.00, 'debit', '2024-01-15', 203),
(308, 1200.00, 'credit', '2024-01-18', 204),
(309, 800.00, 'debit', '2024-01-20', 205),
(310, 1500.00, 'credit', '2024-01-22', 205),
(311, 3000.00, 'credit', '2024-01-25', 206),
(312, 1200.00, 'debit', '2024-01-28', 207),
(313, 800.00, 'credit', '2024-01-30', 207),
(314, 2500.00, 'credit', '2024-02-01', 208),
(315, 1500.00, 'debit', '2024-02-03', 209),
(316, 2000.00, 'credit', '2024-02-05', 210),
(317, 500.00, 'debit', '2024-02-06', 210),
(318, 3500.00, 'credit', '2024-02-08', 211),
(319, 1200.00, 'debit', '2024-02-10', 211),
(320, 800.00, 'credit', '2024-02-12', 212);
-- SELECT * FROM transactions