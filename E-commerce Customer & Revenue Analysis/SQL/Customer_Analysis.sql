SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENTS;

--Total customers
select count(*) as Total_Customers from customers; 


-- Active customers per month
SELECT 
    DATE_TRUNC('month', pay.payment_date) AS month,
    COUNT(DISTINCT o.customer_id) AS active_customers
FROM payments pay
JOIN orders o 
    ON pay.order_id = o.order_id
GROUP BY month
ORDER BY month;


-- Top 10 Customers by Revenue
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    SUM(pay.amount) AS revenue
FROM customers c
JOIN orders o 
    ON c.customer_id = o.customer_id
JOIN payments pay 
    ON o.order_id = pay.order_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
ORDER BY revenue DESC
LIMIT 10;

--New vs Repeat Customers (Very Important)

WITH first_purchase as(
select
o.customer_id,
min(pay.payment_date) as first_purchase_date
from orders o join payments pay
on o.order_id = pay.order_id
group by o.customer_id
)

select 
date_trunc('month',first_purchase_date) as month,
count(customer_id) as new_customers
from first_purchase
group by month
order by month; 

-- Repeat Purchase Rate =
WITH repeat_purchase_customers AS (
    SELECT
        customer_id,
        COUNT(order_id) AS purchase_count
    FROM orders
    GROUP BY customer_id
)

SELECT
    ROUND(SUM(CASE WHEN purchase_count > 1 THEN 1 ELSE 0 END) * 100.0
    / COUNT(*),2) AS repeat_purchase_rate
FROM repeat_purchase_customers;

---purchase count of customers
SELECT 
    purchase_count,
    COUNT(*) AS number_of_customers
FROM (
    SELECT 
        customer_id,
        COUNT(order_id) AS purchase_count
    FROM orders
    GROUP BY customer_id
) sub
GROUP BY purchase_count
ORDER BY purchase_count;











