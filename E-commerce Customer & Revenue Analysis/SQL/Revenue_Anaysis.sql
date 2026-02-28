SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;

-- Total Revenue
SELECT 
sum(amount) as Total_Revenue 
FROM PAYMENTS;

-- Total Orders Count
SELECT 
COUNT(*) AS Total_Orders_Count 
FROM ORDERS;

-- Average Order Value
SELECT 
round(sum(amount)/count(*),2) as Average_Order_Value
FROM PAYMENTS;

--Monthwise Revenue
SELECT
DATE_TRUNC('Month',payment_date) as Month_wise,
sum(amount) as Revenue
FROM payments
GROUP BY month_wise
ORDER BY month_wise;

--MOM growth 
WITH monthly_revenue AS (
    SELECT 
        DATE_TRUNC('month', payment_date) AS month,
        SUM(amount) AS revenue
    FROM payments
    GROUP BY month
)

SELECT 
    month,
    revenue,
    
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change,
    
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY month)) 
        * 100.0 
        / LAG(revenue) OVER (ORDER BY month),
        2
    ) AS growth_percentage

FROM monthly_revenue
ORDER BY month;


--revenue by product category

SELECT 
    p.category,
    SUM(pay.amount) AS total_revenue
FROM payments pay
JOIN orders o ON pay.order_id = o.order_id
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;



--revenue by city
SELECT 
c.city as city,
SUM(pay.amount) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.order_id
JOIN payments pay
ON o.order_id = pay.order_id
GROUP BY city
ORDER BY Revenue;



































SELECT 
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(pay.amount) AS total_revenue,
    ROUND(SUM(pay.amount) / COUNT(o.order_id), 2) AS avg_order_value
FROM payments pay
JOIN orders o ON pay.order_id = o.order_id
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;



















