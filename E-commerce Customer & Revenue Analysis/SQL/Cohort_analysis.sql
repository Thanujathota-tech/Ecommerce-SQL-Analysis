SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;

-- First Purchase Per Customer
SELECT 
    o.customer_id,
    MIN(DATE_TRUNC('month', pay.payment_date)) AS cohort_month
FROM orders o
JOIN payments pay 
    ON o.order_id = pay.order_id
GROUP BY o.customer_id;
SELECT 
    o.customer_id,
    DATE_TRUNC('month', pay.payment_date) AS transaction_month
FROM orders o
JOIN payments pay 
    ON o.order_id = pay.order_id
	ORDER BY o.customer_id;