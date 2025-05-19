-- Distribution of order values across customers
SELECT customerid, ROUND(SUM(quantity * unitprice)::numeric,2) AS order_value
FROM online_retail_clean
WHERE customerid != '0'
GROUP BY customerid
ORDER BY order_value DESC;

-- Unique products purchased per customer
SELECT customerid, COUNT(DISTINCT stockcode) AS unique_products
FROM online_retail_clean
GROUP BY customerid;

-- Customers with only one purchase
SELECT customerid
FROM online_retail_clean
GROUP BY customerid
HAVING COUNT(DISTINCT invoiceno) = 1;

-- Most commonly purchased product combinations
SELECT a.description AS product_1, b.description AS product_2, COUNT(*) AS frequency
FROM online_retail_clean a
JOIN online_retail_clean b
  ON a.invoiceno = b.invoiceno AND a.stockcode < b.stockcode
GROUP BY product_1, product_2
ORDER BY frequency DESC
LIMIT 10;

-- Top Countries by Number of Customers
SELECT country, COUNT(DISTINCT customerid) AS customer_count
FROM online_retail_clean
GROUP BY country
ORDER BY customer_count DESC;

-- Top-Spending Customers
SELECT customerid, ROUND(SUM(quantity * unitprice):: numeric, 2) AS total_spent
FROM online_retail_clean
WHERE customerid != '0'
GROUP BY customerid
ORDER BY total_spent DESC
LIMIT 10;

-- Best-Selling Products (by quantity)
SELECT description, SUM(quantity) AS total_sold
FROM online_retail_clean
GROUP BY description
ORDER BY total_sold DESC
LIMIT 10;

-- Top 10 most revenue generating products
SELECT description, ROUND(SUM(quantity * unitprice):: numeric, 2) AS total_revenue
FROM online_retail_clean
GROUP BY description
ORDER BY total_revenue DESC
LIMIT 10;

-- Monthly Revenue Trend
SELECT 
    DATE_TRUNC('month', invoicedate) AS month,
    ROUND(SUM(quantity * unitprice)::numeric, 2) AS monthly_revenue
FROM online_retail_clean
GROUP BY month
ORDER BY month;

-- Most recent purchase
SELECT customerid, MAX(invoicedate) AS last_purchase
FROM online_retail_clean
WHERE customerid != '0'
GROUP BY customerid
ORDER BY last_purchase DESC;

-- Frequency of purchase
SELECT customerid, COUNT(DISTINCT invoiceno) AS frequency
FROM online_retail_clean
WHERE customerid != '0'
GROUP BY customerid
ORDER BY frequency DESC;


select * from online_retail_clean
WHERE customerid = '0'
limit 10;
