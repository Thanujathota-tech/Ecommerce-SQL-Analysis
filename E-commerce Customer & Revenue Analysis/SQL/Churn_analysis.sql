SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;

--Find Latest Transaction Month
SELECT MAX(DATE_TRUNC('month', payment_date)) 
FROM payments;

-- Find Last Purchase Per Customer
SELECT
o.customer_id,
max(date_trunc('month',pay.payment_date)) as Last_Transaction
FROM
orders o JOIN payments pay
ON o.order_id = pay.order_id
GROUP BY o.customer_id
ORDER BY o.customer_id;

--Calculate Churn %
WITH last_purchase AS (
    SELECT 
        o.customer_id,
        MAX(DATE_TRUNC('month', pay.payment_date)) AS last_purchase_month
    FROM orders o
    JOIN payments pay 
        ON o.order_id = pay.order_id
    GROUP BY o.customer_id
)

SELECT 
    COUNT(CASE 
            WHEN last_purchase_month < DATE '2025-10-01' 
            THEN 1 
         END) * 100.0
    / COUNT(*) AS churn_percentage
FROM last_purchase;








