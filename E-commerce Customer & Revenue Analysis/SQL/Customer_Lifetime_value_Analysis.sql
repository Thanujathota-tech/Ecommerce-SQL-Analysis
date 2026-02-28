SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;

-- Total Revenue per Customer (CLV)
SELECT 
c.customer_id,concat(c.first_name,' ',c.last_name) as Customer_name,
sum(pay.amount) as Total_Revenue
FROM
customers c JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments pay
ON o.order_id = pay.order_id
GROUP BY c.customer_id
ORDER BY c.customer_id;

-- Average CLV
WITH Total_clv as(
SELECT
c.customer_id,
sum(pay.amount) as Total_Revenue
FROM
customers c JOIN orders o
ON c.customer_id=o.customer_id
JOIN payments pay
ON o.order_id = pay.order_id
GROUP BY c.customer_id
)

SELECT
ROUND(AVG(Total_Revenue),2) as AVERAGE_CLV
FROM 
Total_clv;

-- Segment customers: [High,Medium,Low]
WITH customer_clv AS (
    SELECT 
        o.customer_id,
        SUM(pay.amount) AS clv
    FROM orders o
    JOIN payments pay 
        ON o.order_id = pay.order_id
    GROUP BY o.customer_id
),

avg_value AS (
    SELECT AVG(clv) AS avg_clv
    FROM customer_clv
)

SELECT 
    c.customer_id,
    c.clv,
    CASE 
        WHEN c.clv > 1.5 * a.avg_clv THEN 'High Value'
        WHEN c.clv >= 0.75 * a.avg_clv THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_clv c
CROSS JOIN avg_value a
ORDER BY c.clv DESC;
















