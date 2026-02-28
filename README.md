# 🛒 E-Commerce Customer & Revenue Analysis (SQL Project)

## Project Overview

This project analyzes an E-Commerce dataset using PostgreSQL to extract business insights related to revenue performance, customer behavior, retention, and churn.

The goal of this project is to simulate real-world data analyst responsibilities by writing optimized SQL queries using:

- Joins (INNER JOIN)
- CTEs (Common Table Expressions)
- Window Functions (LAG)
- Aggregations
- Conditional Segmentation (CASE)
- Date-based Analysis

Dataset Size:
- 1,000 Customers
- 30 Products
- 20,000 Orders & Payments
- 2 Years of Transaction Data (2024–2025)

---

## Database Schema

### Customers
- customer_id
- first_name
- last_name
- city
- state

### Orders
- order_id
- customer_id
- product_id
- order_date

### Products
- product_id
- product_name
- category
- price

### Payments
- payment_id
- order_id
- payment_date
- amount

---

# Business Analysis Performed

---

##  Revenue Analysis

###  Total Revenue
Calculated total revenue generated across all transactions.

###  Monthly Revenue
Used `DATE_TRUNC()` to aggregate revenue month-wise.

###  Month-over-Month Growth %
Used `LAG()` window function to calculate revenue growth trends.

###  Revenue by Category
Identified Electronics as the highest revenue-generating category (~85% contribution).

###  Average Order Value (AOV)
Calculated AOV by category to determine whether revenue is driven by price or volume.

---

##  Customer Analysis

###  Total Customers
1,000 customers in the dataset.

###  Active Customers Per Month
Tracked unique purchasing customers month-wise.

###  Top 10 Customers by Revenue
Identified highest lifetime value customers using aggregation and sorting.

###  Repeat Purchase Rate
Calculated percentage of customers with more than one purchase.
Result: 100% (dataset-driven high retention scenario).

---

##  Customer Lifetime Value (CLV)

###  CLV Calculation
Computed total revenue per customer.

###  Average CLV
Average CLV ≈ 628,029

###  Customer Segmentation
Segmented customers into:
- High Value
- Medium Value
- Low Value

Based on comparison with average CLV.

---

##  Churn Analysis

Defined churn as customers inactive in the last 3 months.

Churn Rate: **9.3%**

Insight:
Strong customer retention with over 90% active customers in recent months.

---

#  SQL Concepts Used

- INNER JOIN
- GROUP BY & HAVING
- CTE (WITH clause)
- Window Functions (`LAG()`)
- CASE Statements
- DATE_TRUNC()
- Aggregate Functions (SUM, COUNT, AVG)
- Subqueries
- Conditional Aggregation

---

#  Key Business Insights

- Revenue is heavily concentrated in Electronics category.
- Revenue growth shows volatility with seasonal spikes.
- Customer base is geographically diversified.
- Repeat purchase behavior is strong.
- Churn rate is low (9.3%), indicating high retention.

---

#  Tools Used

- PostgreSQL
- pgAdmin
- SQL

---

#  Future Improvements

- Cohort Retention Analysis
- Customer RFM Segmentation
- Predictive churn modeling
- Power BI Dashboard integration

---
