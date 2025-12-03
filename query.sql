USE bankly;

-- 2. Modifier le numero de telephone d'un customer
UPDATE Customers 
SET phone = '0622-334455'
WHERE customer_id = 101;

-- 3. Afficher tous les customers
SELECT * FROM Customers;

-- 4. Afficher uniquement les full_name et email des customers
SELECT full_name, email FROM customers;

-- 5. Afficher tous les accounts
SELECT * FROM Accounts;

-- 6. Afficher uniquement les account_number
SELECT account_number FROM Accounts;

-- 7. Afficher toutes les transactions
SELECT * FROM Transactions;

-- 8. Afficher les accounts avec un balance > 10000
SELECT * FROM Accounts WHERE balance > 10000;

-- 9. Afficher les accounts avec un balance ≤ 0
SELECT * FROM Accounts WHERE balance <= 0;

-- 10. Afficher les transactions de type "debit"
SELECT * FROM Transactions WHERE transaction_type = 'debit';

-- 11. Afficher les transactions de type "credit"
SELECT * FROM Transactions WHERE transaction_type = 'credit';

-- 12. Afficher les transactions du account_id = 201
SELECT * FROM Transactions WHERE accountid = 201;

-- 13. Afficher les customers ayant un account géré par l'advisor_id = 2
SELECT DISTINCT c.* 
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customerid
WHERE a.advisorid = 2;

-- par sous requet :

SELECT *
FROM Customers c
WHERE c.customer_id IN (
    SELECT DISTINCT a.customerid
    FROM Accounts a
    WHERE a.advisorid = 2
);

-- 14. Afficher les accounts ayant account_type = "Savings"
SELECT * FROM Accounts WHERE account_type = 'Savings';

-- 15. Afficher les transactions avec un amount ≥ 500
SELECT * FROM Transactions WHERE amount >= 500;

-- 16. Afficher les transactions avec un amount entre 100 et 1000
SELECT * FROM Transactions WHERE amount BETWEEN 100 AND 1000;

-- 17. Afficher les accounts du customer_id = 1
SELECT * FROM Accounts WHERE customerid = 101;

-- 18. Afficher les accounts triés par balance (ordre croissant)
SELECT * FROM Accounts ORDER BY balance ASC;

-- 19. Afficher les transactions triées par amount (ordre décroissant)
SELECT * FROM Transactions ORDER BY amount DESC;

-- 20. Afficher les 5 plus grandes transactions
SELECT * FROM Transactions ORDER BY amount DESC LIMIT 5;

-- 21. Afficher toutes les transactions triées par transaction_date décroissante
SELECT * FROM Transactions ORDER BY transaction_date DESC;

-- 22. Afficher les 3 dernières transactions
SELECT * FROM Transactions ORDER BY transaction_date DESC LIMIT 3;

-- 23. Afficher chaque account avec le nom du customer et le nom de l'advisor (JOIN)
SELECT a.account_id,a.account_number,a.balance,a.account_type,c.full_name AS customer_name,adv.full_name AS advisor_name
FROM Accounts a
JOIN Customers c ON a.customerid = c.customer_id
JOIN Advisors adv ON a.advisorid = adv.advisor_id;


-- BONUS

-- Compter le nombre de transactions par account

SELECT a.account_number , COUNT(t.transaction_id) AS nbr_transactions 
FROM accounts a
JOIN transactions t ON a.account_id=t.accountid
GROUP BY a.account_id , a.account_number
ORDER BY nbr_transactions DESC