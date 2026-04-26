

 SET SEARCH_PATH TO ASSIGNMENT;
 -- 1. Write a query to select all data from the `Customers` table.
 SELECT * FROM assignment.customers; 
-- 2. Write a query to select the total number of products from the `Products` table.
SELECT COUNT(*) FROM assignment.products; 
-- 3. Write a query to select the product name and its price from the `Products` table where the price is greater than 500.
 SELECT product_name, price FROM assignment.products WHERE price > 500; 
-- 4. Write a query to find the average price of all products from the `Products` table.
SELECT AVG(price) FROM assignment.products; 
-- 5. Write a query to find the total sales amount across all records from the `Sales` table.
SELECT SUM(total_amount) FROM assignment.sales;
-- 6. Write a query to select distinct membership statuses from the `Customers` table.
SELECT DISTINCT membership_status FROM assignment.customers;
-- 7. Write a query to concatenate first and last names of all customers and show the result as `full_name`.
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM assignment.customers;
-- 8. Write a query to find all products in the `Products` table where the category is 'Electronics'.
SELECT * FROM assignment.products WHERE category = 'Electronics';
-- 9. Write a query to find the highest price from the `Products` table.
SELECT MAX(price) FROM assignment.products;
-- 10. Write a query to count the number of sales for each product from the `Sales` table.
SELECT product_id, COUNT(*) as sales_count FROM assignment.sales GROUP BY product_id;
-- 11. Write a query to find the total quantity sold for each product from the `Sales` table.
SELECT product_id, SUM(quantity_sold) as total_quantity FROM assignment.sales GROUP BY product_id;
-- 12. Write a query to find the lowest price of products in the `Products` table.
SELECT MIN(price) FROM assignment.products;
-- 13. Write a query to find customers who have purchased products with a price greater than 1000.
SELECT DISTINCT c.* 
FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
JOIN assignment.products p ON s.product_id = p.product_id
WHERE p.price > 1000;

-- 14. Write a query to join the `Sales` and `Products` tables on product_id, and Show product name and total sales amount per product
SELECT p.product_name, SUM(s.total_amount) as total_revenue
FROM assignment.sales s
JOIN assignment.products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 15. Write a query to join the `Customers` and `Sales` tables and find the total amount spent by each customer.
SELECT customer_id, SUM(total_amount) as total_spent
FROM assignment.sales
GROUP BY customer_id;

-- 16. Write a query to join the `Customers`, `Sales`, and `Products` tables, and show each customer's first and last name, product name, and quantity sold.
SELECT c.first_name, c.last_name, p.product_name, s.quantity_sold
FROM assignment.sales s
JOIN assignment.customers c ON s.customer_id = c.customer_id
JOIN assignment.products p ON s.product_id = p.product_id;

-- 17. Write a query to perform a self-join on the `Customers` table and find all pairs of customers who have the same membership status.
SELECT a.first_name as cust1, b.first_name as cust2, a.membership_status
FROM assignment.customers a
JOIN assignment.customers b ON a.membership_status = b.membership_status
WHERE a.customer_id < b.customer_id;

-- 18. Write a query to join the `Sales` and `Products` tables, and calculate the total number of sales for each product.
SELECT product_id, COUNT(*) FROM assignment.sales GROUP BY product_id;
-- 19. Write a query to find the products in the `Products` table where the stock quantity is less than 10.
SELECT * FROM assignment.products WHERE stock_quantity < 10;
-- 20. Write a query to join the `Sales` table and the `Products` table, and find products with total sales quantity greater than 5.
SELECT p.product_name, SUM(s.quantity_sold) 
FROM assignment.sales s
JOIN assignment.products p ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.quantity_sold) > 5;

-- 21. Write a query to select customers who have purchased products that are either in the 'Electronics' or 'Appliances' category.
SELECT DISTINCT c.* FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
JOIN assignment.products p ON s.product_id = p.product_id
WHERE p.category IN ('Electronics', 'Appliances');

-- 22. Write a query to calculate the total sales amount per product and group the result by product name.
SELECT p.product_name, SUM(s.total_amount)
FROM assignment.sales s
JOIN assignment.products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- 23. Write a query to join the `Sales` table with the `Customers` table and select customers who made a purchase in the year 2023.
SELECT DISTINCT c.* FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 24. Write a query to find the customers with the highest total sales in 2023.
SELECT customer_id, SUM(total_amount) as total
FROM assignment.sales
WHERE sale_date >= '2023-01-01' AND sale_date <= '2023-12-31'
GROUP BY customer_id
ORDER BY total DESC LIMIT 1;

-- 25. Write a query to join the `Products` and `Sales` tables and select the most expensive product sold.
SELECT p.* FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
ORDER BY p.price DESC LIMIT 1;

-- 26. Write a query to find the total number of customers who have purchased products worth more than 500.
SELECT COUNT(DISTINCT customer_id) 
FROM assignment.sales 
WHERE total_amount > 500;

-- 27. Write a query to join the `Products`, `Sales`, and `Customers` tables and find the total number of sales made by customers who are in the 'Gold' membership tier.
SELECT COUNT(s.sale_id) 
FROM assignment.sales s
JOIN assignment.customers c ON s.customer_id = c.customer_id
WHERE c.membership_status = 'Gold';

-- 28. Write a query to join the `Products` and `Inventory` tables and find all products that have low stock (less than 10).
SELECT p.product_name, i.stock_quantity 
FROM assignment.products p
JOIN assignment.inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity < 10;

-- 29. Write a query to find customers who have purchased more than 5 products and show the total quantity of products they have bought.
SELECT customer_id, SUM(quantity_sold) 
FROM assignment.sales
GROUP BY customer_id
HAVING COUNT(sale_id) > 5;

-- 30. Write a query to find the average quantity sold per product.
SELECT product_id, AVG(quantity_sold) FROM assignment.sales GROUP BY product_id;
-- 31. Write a query to find the number of sales made in the month of December 2023.
SELECT COUNT(*) FROM assignment.sales WHERE sale_date >= '2023-12-01' AND sale_date <= '2023-12-31';
-- 32. Write a query to find the total amount spent by each customer in 2023 and list the customers in descending order.
SELECT customer_id, SUM(total_amount) as spent
FROM assignment.sales
WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY customer_id
ORDER BY spent DESC;

-- 33. Write a query to find all products that have been sold but have less than 5 units left in stock.
SELECT DISTINCT p.product_name, i.stock_quantity
FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
JOIN assignment.inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity < 5;

-- 34. Write a query to find the total sales for each product and order the result by the highest sales.
SELECT product_id, SUM(total_amount) as sales_val
FROM assignment.sales
GROUP BY product_id
ORDER BY sales_val DESC;

-- 35. Write a query to find all customers who bought products within 7 days of their registration date.
SELECT DISTINCT c.* FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date <= (c.registration_date + INTERVAL '7 days');

-- 36. Write a query to join the `Sales` table with the `Products` table and filter the results by products priced between 100 and 500.
SELECT s.*, p.product_name, p.price 
FROM assignment.sales s
JOIN assignment.products p ON s.product_id = p.product_id
WHERE p.price BETWEEN 100 AND 500;

-- 37. Write a query to find the most frequent customer who made purchases from the `Sales` table.
SELECT customer_id, COUNT(*) as freq 
FROM assignment.sales 
GROUP BY customer_id 
ORDER BY freq DESC LIMIT 1;

-- 38. Write a query to find the total quantity of products sold per customer.
SELECT customer_id, SUM(quantity_sold) FROM assignment.sales GROUP BY customer_id;
-- 39. Write a query to find the products with the highest stock and lowest stock, and display them together in a single result set.
(SELECT 'Highest' as type, product_name, stock_quantity FROM assignment.products ORDER BY stock_quantity DESC LIMIT 1)
UNION ALL
(SELECT 'Lowest' as type, product_name, stock_quantity FROM assignment.products ORDER BY stock_quantity ASC LIMIT 1);

-- 40. Write a query to find products whose names contain the word 'Phone' and their total sales.
SELECT p.product_name, SUM(s.total_amount)
FROM assignment.products p
LEFT JOIN assignment.sales s ON p.product_id = s.product_id
WHERE p.product_name ILIKE '%Phone%'
GROUP BY p.product_name;

-- 41. Write a query to perform an `INNER JOIN` between `Customers` and `Sales`, then display the total sales amount and the product names for customers in the 'Gold' membership status.
SELECT p.product_name, SUM(s.total_amount)
FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
JOIN assignment.products p ON s.product_id = p.product_id
WHERE c.membership_status = 'Gold'
GROUP BY p.product_name;

-- 42. Write a query to find the total sales of products by category.
SELECT p.category, SUM(s.total_amount)
FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
GROUP BY p.category;

-- 43. Write a query to join the `Products` table with the `Sales` table, and calculate the total sales for each product, grouped by month and year.
SELECT product_id, 
       EXTRACT(YEAR FROM sale_date) as yr, 
       EXTRACT(MONTH FROM sale_date) as mon, 
       SUM(total_amount)
FROM assignment.sales
GROUP BY product_id, yr, mon;

-- 44. Write a query to join the `Sales` and `Inventory` tables and find products that have been sold but still have stock remaining.
SELECT DISTINCT p.product_name 
FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
JOIN assignment.inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity > 0;

-- 45. Write a query to find the top 5 customers who have made the highest purchases.
SELECT customer_id, SUM(total_amount) as total FROM assignment.sales GROUP BY customer_id ORDER BY total DESC LIMIT 5;
-- 46. Write a query to calculate the total number of unique products sold in 2023.
SELECT COUNT(DISTINCT product_id) FROM assignment.sales WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31';
-- 47. Write a query to find the products that have not been sold in the last 6 months.
SELECT product_id, product_name FROM assignment.products
WHERE product_id NOT IN (
    SELECT product_id FROM assignment.sales 
    WHERE sale_date > CURRENT_DATE - INTERVAL '6 months'
);

-- 48. Write a query to select the products with a price range between $200 and $800, and find the total quantity sold for each.
SELECT p.product_id, SUM(s.quantity_sold)
FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
WHERE p.price BETWEEN 200 AND 800
GROUP BY p.product_id;

-- 49. Write a query to find the customers who spent the most money in the year 2023.
SELECT customer_id, SUM(total_amount) as total
FROM assignment.sales
WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY customer_id
ORDER BY total DESC LIMIT 1;

-- 50. Write a query to select the products that have been sold more than 100 times and have a price greater than 200.
SELECT P.PRODUCT_NAME FROM ASSIGNMENT.PRODUCTS P
JOIN ASSIGNMENT.SALES S ON P.PRODUCT_ID=S.PRODUCT_ID
WHERE P.PRICE >200
GROUP BY P.PRODUCT_ID,P.PRODUCT_NAME
HAVING SUM(S.QUANTITY_SOLD)>100;

-- SUBQUERY QUESTIONS

-- 51. Which customers have spent more than the average spending of all customers?
SELECT customer_id, SUM(total_amount) 
FROM assignment.sales 
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_spent) FROM (
        SELECT SUM(total_amount) as total_spent 
        FROM assignment.sales 
        GROUP BY customer_id
    ) sub
);

-- 52. Which products are priced higher than the average price of all products?
SELECT * FROM assignment.products 
WHERE price > (SELECT AVG(price) FROM assignment.products);

-- 53. Which customers have never made a purchase?
SELECT * FROM assignment.customers 
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM assignment.sales);

-- 54. Which products have never been sold?
SELECT * FROM assignment.products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM assignment.sales);

-- 55. Which customer made the single most expensive purchase (total amount)?
SELECT * FROM CUSTOMERS WHERE CUSTOMER_ID = (SELECT CUSTOMER_ID FROM ASSIGNMENT.SALES ORDER BY TOTAL_AMOUNT DESC LIMIT 1);
-- 56. Which products have total sales greater than the average total sales across all products?
SELECT PRODUCT_ID, SUM(TOTAL_AMOUNT) 
FROM SALES
GROUP BY PRODUCT_ID
HAVING SUM(TOTAL_AMOUNT) >
(SELECT AVG(PRODUCT_TOTAL) 
FROM (SELECT SUM(TOTAL_AMOUNT) AS PRODUCT_TOTAL
FROM SALES 
GROUP BY PRODUCT_ID) SUB
);

-- 57. Which customers registered earlier than the average registration date?
-- Average of a date column can be calculated using; SELECT TO_TIMESTAMP(AVG(EXTRACT(EPOCH FROM registration_date)))::DATE FROM assignment.customers
SELECT * FROM CUSTOMERS
WHERE REGISTRATION_DATE < 
(SELECT 
TO_TIMESTAMP(AVG(EXTRACT(EPOCH FROM REGISTRATION_DATE)))::DATE
FROM ASSIGNMENT.CUSTOMERS);

-- 58. Which products have a price higher than the average price within their own category?
SELECT P1.* FROM ASSIGNMENT.PRODUCTS P1
WHERE P1.PRICE>
(SELECT AVG(P2.PRICE) FROM ASSIGNMENT.PRODUCTS P2 
WHERE P1.CATEGORY=P2.CATEGORY);
-- 59. Which customers have spent more than the customer with ID = 10?
SELECT CUSTOMER_ID,SUM(TOTAL_AMOUNT) AS TOTAL_AMOUNT FROM SALES 
GROUP BY CUSTOMER_ID
HAVING SUM(TOTAL_AMOUNT) > 
(SELECT COALESCE(SUM(TOTAL_AMOUNT),0) FROM SALES WHERE CUSTOMER_ID=10);
-- 60. Which products have total quantity sold greater than the overall average quantity sold?
SELECT PRODUCT_ID, SUM(QUANTITY_SOLD) AS TOTAL_QNTY FROM SALES
GROUP BY PRODUCT_ID
HAVING SUM(QUANTITY_SOLD) > ( SELECT AVG(TOTAL_QUANTITY) 
FROM (SELECT SUM(QUANTITY_SOLD) AS TOTAL_QUANTITY FROM SALES 
GROUP BY PRODUCT_ID)SUB
);

-- COMMON TABLE EXPRESSIONS (CTEs)

-- 61. Create an intermediate result that calculates the total amount spent by each customer,
--     then determine which customers are the top 5 highest spenders.
WITH customer_spending AS (
SELECT customer_id,
SUM(total_amount)as spending
FROM assignment.sales
GROUP BY customer_id
)
SELECT * FROM customer_spending
ORDER BY spending DESC
LIMIT 5;

-- 62. Create an intermediate result that calculates total quantity sold per product,
--     then determine which products are the top 3 most sold.
WITH product_volume AS (
    SELECT product_id, SUM(quantity_sold) AS total_qty
    FROM assignment.sales
    GROUP BY product_id
)
SELECT * FROM product_volume
ORDER BY total_qty DESC
LIMIT 3;

-- 63. Create an intermediate result showing total sales per product category,
--     then determine which category generates the highest revenue.
WITH category_revenue AS (
    SELECT p.category, SUM(s.total_amount) AS total_revenue
    FROM assignment.products p
    JOIN assignment.sales s ON p.product_id = s.product_id
    GROUP BY p.category
)
SELECT * FROM category_revenue
ORDER BY total_revenue DESC
LIMIT 1;

-- 64. Create an intermediate result that calculates the number of purchases per customer,
--     then identify customers who purchased more than twice.
WITH purchase_counts AS (
    SELECT customer_id, COUNT(sale_id) AS num_purchases
    FROM assignment.sales
    GROUP BY customer_id
)
SELECT * FROM purchase_counts
WHERE num_purchases > 2;

-- 65. Create an intermediate result that calculates the total quantity sold per product,
--     then determine which products sold more than the average quantity sold.
WITH product_totals AS (
    SELECT product_id, SUM(quantity_sold) AS total_qty
    FROM assignment.sales
    GROUP BY product_id
)
SELECT * FROM product_totals
WHERE total_qty > (SELECT AVG(total_qty) FROM product_totals);

-- 66. Create an intermediate result that calculates total spending per customer,
--     then determine which customers spent more than the average spending.
WITH customer_spending AS (
    SELECT customer_id, SUM(total_amount) AS total_spent
    FROM assignment.sales
    GROUP BY customer_id
)
SELECT * FROM customer_spending
WHERE total_spent > (SELECT AVG(total_spent) FROM customer_spending);

-- 67. Create an intermediate result that calculates total revenue per product,
--     then list the products ordered from highest revenue to lowest.
WITH product_revenue AS (
    SELECT product_id, SUM(total_amount) AS revenue
    FROM assignment.sales
    GROUP BY product_id
)
SELECT * FROM product_revenue
ORDER BY revenue DESC;

-- 68. Create an intermediate result showing monthly sales totals,
--     then determine which month had the highest revenue.
WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', sale_date) AS sale_month, SUM(total_amount) AS monthly_revenue
    FROM assignment.sales
    GROUP BY sale_month
)
SELECT * FROM monthly_sales
ORDER BY monthly_revenue DESC
LIMIT 1;

-- 69. Create an intermediate result that calculates the number of sales per product,
--     then determine which products were purchased by more than three customers.
WITH product_reach AS (
    SELECT product_id, COUNT(DISTINCT customer_id) AS unique_customers
    FROM assignment.sales
    GROUP BY product_id
)
SELECT * FROM product_reach
WHERE unique_customers > 3;

-- 70. Create an intermediate result showing total quantity sold per product,
--     then identify products that sold less than the average quantity sold.
WITH product_stats AS (
    SELECT product_id, SUM(quantity_sold) AS total_qty
    FROM assignment.sales
    GROUP BY product_id
)
SELECT * FROM product_stats
WHERE total_qty < (SELECT AVG(total_qty) FROM product_stats);

-- WINDOW FUNCTION QUESTIONS

-- 71. Rank customers based on the total amount they have spent.
SELECT customer_id, 
SUM(total_amount) as total_spent,
RANK() OVER(ORDER BY SUM(total_amount) DESC) AS spending_rank
FROM assignment.sales
GROUP BY customer_id;
-- 72. Rank products based on total quantity sold.
SELECT product_id, 
       SUM(quantity_sold) as total_qty,
       DENSE_RANK() OVER (ORDER BY SUM(quantity_sold) DESC) as qty_rank
FROM assignment.sales
GROUP BY product_id;

-- 73. Identify the 3rd highest spending customer.
SELECT * FROM (
    SELECT customer_id, 
           SUM(total_amount) as total_spent,
           ROW_NUMBER() OVER (ORDER BY SUM(total_amount) DESC) as spending_rank
    FROM assignment.sales
    GROUP BY customer_id
) spending_rank
WHERE spending_rank = 3;

-- 74. Identify the 2nd most expensive product.
SELECT * FROM (
    SELECT product_name, price,
           DENSE_RANK() OVER (ORDER BY price DESC) as price_rank
    FROM assignment.products
) expensive_pro
WHERE price_rank = 2;

-- 75. Show the ranking of products within each category based on price.
SELECT category, product_name, price,
       RANK() OVER (PARTITION BY category ORDER BY price DESC) as category_price_rank
FROM assignment.products;

-- 76. Show the ranking of customers based on the number of purchases they made.
SELECT customer_id, 
       COUNT(sale_id) as purchase_count,
       RANK() OVER (ORDER BY COUNT(sale_id) DESC) as frequency_rank
FROM assignment.sales
GROUP BY customer_id;

-- 77. Show the running total of sales amounts ordered by sale_date.
SELECT sale_id, sale_date, total_amount,
       SUM(total_amount) OVER (ORDER BY sale_date, sale_id) as running_total
FROM assignment.sales;

-- 78. Show the previous sale amount for each sale ordered by sale_date.
SELECT sale_id, sale_date, total_amount,
       LAG(total_amount) OVER (ORDER BY sale_date, sale_id) as previous_sale_amount
FROM assignment.sales;

-- 79. Show the next sale amount for each sale ordered by sale_date.
SELECT sale_id, sale_date, total_amount,
       LEAD(total_amount) OVER (ORDER BY sale_date, sale_id) as next_sale_amount
FROM assignment.sales;

-- 80. Divide customers into 4 groups based on total spending.
WITH customer_totals AS (
    SELECT customer_id, SUM(total_amount) as total_spent
    FROM assignment.sales
    GROUP BY customer_id
)
SELECT customer_id, total_spent,
       NTILE(4) OVER (ORDER BY total_spent DESC) as spending_group
FROM customer_totals;

-- =====================================================
-- ADVANCED ANALYTICAL QUESTIONS
-- =====================================================

-- 81. Which customers bought products in more than one category?
SELECT s.customer_id
FROM assignment.sales s
JOIN assignment.products p ON s.product_id = p.product_id
GROUP BY s.customer_id
HAVING COUNT(DISTINCT p.category) > 1;

-- 82. Which customers purchased products within 7 days of registering?
SELECT DISTINCT c.*
FROM assignment.customers c
JOIN assignment.sales s ON c.customer_id = s.customer_id
WHERE s.sale_date <= (c.registration_date + INTERVAL '7 days');

-- 83. Which products have lower stock remaining than the average stock quantity?
SELECT * FROM assignment.products
WHERE stock_quantity < (SELECT AVG(stock_quantity) FROM assignment.products);

-- 84. Which customers purchased the same product more than once?
SELECT customer_id, product_id
FROM assignment.sales
GROUP BY customer_id, product_id
HAVING COUNT(sale_id) > 1;

-- 85. Which product categories generated the highest total revenue?
SELECT p.category, SUM(s.total_amount) AS category_revenue
FROM assignment.products p
JOIN assignment.sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

-- 86. Which products are among the top 3 most sold products?
SELECT product_id, total_qty
FROM (
    SELECT product_id, SUM(quantity_sold) AS total_qty,
           DENSE_RANK() OVER (ORDER BY SUM(quantity_sold) DESC) as rnk
    FROM assignment.sales
    GROUP BY product_id
) sold_products
WHERE rnk <= 3;

-- 87. Which customers purchased the most expensive product?
SELECT DISTINCT s.customer_id
FROM assignment.sales s
WHERE s.product_id = (SELECT product_id FROM assignment.products ORDER BY price DESC LIMIT 1);

-- 88. Which products were purchased by the highest number of unique customers?
SELECT product_id, COUNT(DISTINCT customer_id) as unique_cust_count
FROM assignment.sales
GROUP BY product_id
ORDER BY unique_cust_count DESC;

-- 89. Which customers made purchases above the average sale amount?
SELECT DISTINCT customer_id
FROM assignment.sales
WHERE total_amount > (SELECT AVG(total_amount) FROM assignment.sales);

-- 90. Which customers purchased more products than the average quantity purchased per customer?
WITH customer_volumes AS (
    SELECT customer_id, SUM(quantity_sold) as total_qty
    FROM assignment.sales
    GROUP BY customer_id
)
SELECT * FROM customer_volumes
WHERE total_qty > (SELECT AVG(total_qty) FROM customer_volumes);

-- ADVANCED WINDOW + ANALYTICAL PROBLEMS

-- 91. Which customers rank in the top 10% of spending?
SELECT * FROM 
(SELECT customer_id, 
PERCENT_RANK() OVER (ORDER BY SUM(total_amount) DESC) as top_spenders
FROM assignment.sales 
GROUP BY customer_id) top_spenders
WHERE top_spenders <= 0.1;
-- 92. Which products contribute to the top 50% of total revenue?
WITH rev AS (SELECT product_id, SUM(total_amount) as r, 
SUM(SUM(total_amount)) OVER() as total 
FROM assignment.sales 
GROUP BY product_id
), 
cum AS (SELECT product_id,
SUM(r) OVER(ORDER BY r DESC) / total as running_pct 
FROM rev
) 
SELECT * FROM cum WHERE running_pct <= 0.5;
-- 93. Which customers made purchases in consecutive months?
SELECT DISTINCT s1.customer_id 
FROM assignment.sales s1
JOIN assignment.sales s2 ON s1.customer_id = s2.customer_id 
AND DATE_TRUNC('month', s2.sale_date) = DATE_TRUNC('month', s1.sale_date + INTERVAL '1 month');
-- 94. Which products experienced the largest difference between stock quantity and total quantity sold?
SELECT product_id,
ABS(stock_quantity - (SELECT COALESCE(SUM(quantity_sold),0) 
FROM assignment.sales s WHERE s.product_id = p.product_id)) as largest_diff 
FROM assignment.products p ORDER BY largest_diff DESC LIMIT 1;
-- 95. Which customers have spending above the average spending of their membership tier?
WITH tier_avg AS (
SELECT c.membership_status, 
AVG(s.total_amount) as avg_tier 
FROM assignment.customers c 
JOIN assignment.sales s ON c.customer_id = s.customer_id
GROUP BY 1 
) 
SELECT s.customer_id FROM assignment.sales s
JOIN assignment.customers c ON s.customer_id = c.customer_id 
JOIN tier_avg t ON c.membership_status = t.membership_status 
GROUP BY s.customer_id, t.avg_tier 
HAVING SUM(s.total_amount) > t.avg_tier;
-- 96. Which products have higher sales than the average sales within their category?
SELECT p.product_name FROM assignment.products p
JOIN (SELECT category, 
AVG(total_amount) as cat_avg 
FROM assignment.sales s 
JOIN assignment.products p2 ON s.product_id = p2.product_id
GROUP BY 1
) sub 
ON p.category = sub.category 
JOIN assignment.sales s ON p.product_id = s.product_id 
GROUP BY p.product_id, p.product_name, sub.cat_avg 
HAVING SUM(s.total_amount) > sub.cat_avg;
-- 97. Which customer made the largest single purchase relative to their total spending?
SELECT customer_id, 
MAX(total_amount) / SUM(total_amount) as ratio
FROM assignment.sales 
GROUP BY customer_id 
ORDER BY ratio DESC LIMIT 1;
-- 98. Which products rank among the top 3 most sold products within each category?
SELECT * FROM (
SELECT category,
product_name, 
RANK() OVER(PARTITION BY category ORDER BY SUM(quantity_sold) DESC
) 
FROM assignment.products p 
JOIN assignment.sales s ON p.product_id = s.product_id 
GROUP BY 1, 2) sub
WHERE rank <= 3;
-- 99. Which customers are tied for the highest total spending?
SELECT customer_id, 
SUM(total_amount) 
FROM assignment.sales 
GROUP BY customer_id 
HAVING SUM(total_amount) = (
SELECT SUM(total_amount) 
FROM assignment.sales 
GROUP BY customer_id 
ORDER BY 1 DESC
LIMIT 1
);
-- 100. Which products generated sales every year present in the dataset?
SELECT product_id 
FROM assignment.sales 
GROUP BY product_id 
HAVING COUNT(DISTINCT EXTRACT(YEAR FROM sale_date)) = 
(SELECT COUNT(DISTINCT EXTRACT(YEAR FROM sale_date)) 
FROM assignment.sales
);
-- 101. Update the products table to assign a price_category as Expensive (price > 1000), Moderate (price between 500 and 1000), or Affordable (price < 500) using CASE WHEN
SELECT product_name, 
CASE WHEN price > 1000 THEN 'Expensive'
WHEN price BETWEEN 500 AND 1000 THEN 'Moderate'
ELSE 'Affordable' END as price_category 
FROM assignment.products;
-- 102. Update the customers table to assign a customer_level based on total spending as VIP (>20000), Regular (10000–20000), or New (<10000) using CASE WHEN
SELECT customer_id,
CASE WHEN SUM(total_amount) > 20000 THEN 'VIP'
WHEN SUM(total_amount) BETWEEN 10000 AND 20000 THEN 'Regular' 
ELSE 'New' END as customer_level
FROM assignment.sales 
GROUP BY customer_id;

-- 103. Update the products table to assign a stock_status as Low Stock or Sufficient Stock based on stock_quantity using CASE WHEN
SELECT product_name,
CASE WHEN stock_quantity < 10 THEN 'Low Stock'
ELSE 'Sufficient Stock' END as stock_status 
FROM assignment.products;
-- 104. Display each customer’s registration year from the registration_date
SELECT first_name, 
EXTRACT(YEAR FROM registration_date) as reg_year 
FROM assignment.customers;
-- 105. Count how many customers registered in each year
SELECT 
EXTRACT(YEAR FROM registration_date) as yr,
COUNT(*)
FROM assignment.customers 
GROUP BY 1;
-- 106. Find the total sales amount for each month
SELECT 
    TO_CHAR(sale_date, 'Month YYYY') AS month_name,
    SUM(total_amount) AS monthly_revenue
FROM assignment.sales 
GROUP BY DATE_TRUNC('month', sale_date), TO_CHAR(sale_date, 'Month YYYY')
ORDER BY DATE_TRUNC('month', sale_date);

-- 107. Show all sales made in the year 2023
SELECT * FROM assignment.sales WHERE EXTRACT(YEAR FROM sale_date) = 2023;
-- 108. Find the total sales amount for each year
SELECT EXTRACT(YEAR FROM sale_date) as yr, SUM(total_amount) FROM assignment.sales GROUP BY 1;
-- 109. Calculate the number of days each customer has been registered (from registration_date to current date)
SELECT first_name, CURRENT_DATE - registration_date as days_registered FROM assignment.customers;
-- 110. Display each sale and extract the year and month from the sale date
SELECT sale_id, EXTRACT(YEAR FROM sale_date) as year, EXTRACT(MONTH FROM sale_date) as month FROM assignment.sales;
-- 111. Display each customer’s email and replace null values with 'No Email Provided' using COALESCE
SELECT COALESCE(email, 'No Email Provided') FROM assignment.customers;

-- 112. Find customers who do not have an email address
SELECT * FROM assignment.customers WHERE email IS NULL;
-- 113. Find products that have never been sold using a subquery
SELECT * FROM assignment.products WHERE product_id NOT IN (SELECT product_id FROM assignment.sales);
-- 114. Find customers who have not made any purchases using a subquery
SELECT * FROM assignment.customers WHERE customer_id NOT IN (SELECT customer_id FROM assignment.sales);

-- 115. Update the products table to assign a price_category (Premium, Standard, Budget) based on price using CASE WHEN
ALTER TABLE assignment.products 
ADD COLUMN price_category VARCHAR(20);
UPDATE assignment.products
SET price_category =
CASE WHEN price > 1000 THEN 'Premium' 
WHEN price BETWEEN 500 AND 1000 THEN 'Standard'
ELSE 'Budget' END;


-- 116. Create a PostgreSQL function/procedure that takes a minimum revenue as input and returns all products whose total sales exceed that value
CREATE OR REPLACE FUNCTION assignment.get_high_sales_products(min_rev DECIMAL) RETURNS TABLE(product_id INT) AS $$
  SELECT product_id FROM assignment.sales GROUP BY product_id HAVING SUM(total_amount) > min_rev;
$$ LANGUAGE SQL;
SELECT * FROM assignment.get_high_sales_products(1000.00);


-- 117. Create a PostgreSQL function/procedure that takes a customer_id as input and returns the total amount spent by that customer
CREATE FUNCTION assignment.get_customer_spend(c_id INT) RETURNS DECIMAL AS $$
  SELECT SUM(total_amount) FROM assignment.sales WHERE customer_id = c_id;
$$ LANGUAGE SQL;
SELECT * FROM assignment.get_customer_spend(10);
-- 118. Create a PostgreSQL function/procedure that takes a start_date and end_date as input and returns the number of orders made within that date range
CREATE FUNCTION assignment.count_orders(s_date DATE, e_date DATE) RETURNS INT AS $$
  SELECT COUNT(*) FROM assignment.sales WHERE sale_date BETWEEN s_date AND e_date;
$$ LANGUAGE SQL;

-- 119. Create a PostgreSQL stored procedure that inserts a new record into the sales table 
CREATE PROCEDURE assignment.add_sale(sid INT, cid INT, pid INT, qty INT, sdate DATE, amt DECIMAL) AS $$
  INSERT INTO assignment.sales VALUES (sid, cid, pid, qty, sdate, amt);
$$ LANGUAGE SQL;

-- 120. Create an index on the product_id column in the sales table to improve join performance
CREATE INDEX idx_sales_prod ON assignment.sales(product_id);
-- 121. Create an index on the registration_date column in the customers table to improve filtering by date
CREATE INDEX idx_cust_reg ON assignment.customers(registration_date);
-- 122. Write a transaction that inserts a new sale using sale_id, customer_id, product_id, quantity_sold, sale_date, and total_amount, then updates the corresponding product stock_quantity, ensuring both operations succeed or fail together
BEGIN;
INSERT INTO assignment.sales (sale_id, customer_id, product_id, quantity_sold, sale_date, total_amount) VALUES (999, 1, 1, 2, '2023-10-10', 500.00);
UPDATE assignment.products SET stock_quantity = stock_quantity - 2 WHERE product_id = 1;
COMMIT;

-- 123. Write a transaction that updates a customer’s email and rolls back the change if the email is invalid
BEGIN;
UPDATE assignment.customers SET email = 'invalid-email' WHERE customer_id = 1;
-- Logic to check validity would go here
ROLLBACK; 

-- 124. Create a view that shows total revenue per product
CREATE VIEW assignment.product_revenue AS SELECT product_id, SUM(total_amount) 
FROM assignment.sales GROUP BY 1;
-- 125. Create a view that shows each customer and their total spending
CREATE VIEW assignment.customer_spending AS SELECT customer_id, SUM(total_amount) FROM assignment.sales GROUP BY 1;
-- 126. Use UNION to combine a list of all customer first names and product names into a single column
SELECT first_name FROM assignment.customers UNION SELECT product_name FROM assignment.products;
-- 127. Use INTERSECT to find values that appear in both a list of customer IDs and a list of customer IDs who made purchases
SELECT customer_id FROM assignment.customers INTERSECT SELECT customer_id FROM assignment.sales;
-- 128. Perform an anti-join to find products that have never been sold using LEFT JOIN
SELECT p.* FROM assignment.products p 
LEFT JOIN assignment.sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;
-- 129. Use NOT EXISTS to find customers who have not made any purchases
SELECT * FROM assignment.customers c
WHERE NOT EXISTS (SELECT 1 FROM assignment.sales s WHERE s.customer_id = c.customer_id);
-- 130. Cast the price column to an integer and display it alongside the original price
SELECT price, price::INT as price_int FROM assignment.products;
-- 131. Convert registration_date to text format and display it in 'YYYY-MM' format
SELECT TO_CHAR(registration_date, 'YYYY-MM') FROM assignment.customers;
-- 132. The following query returns an error due to improper GROUP BY usage. Identify and fix the issue
-- SELECT product_id, product_name, SUM(total_amount) FROM sales GROUP BY product_id;
SELECT product_id, product_name, SUM(total_amount) FROM assignment.sales s 
JOIN assignment.products p ON s.product_id = p.product_id
GROUP BY product_id, product_name;
-- 133. The following query incorrectly filters aggregated results using WHERE. Identify and correct it
-- SELECT product_id, SUM(total_amount) FROM sales WHERE SUM(total_amount) > 1000 GROUP BY product_id;
SELECT product_id, SUM(total_amount) 
FROM assignment.sales 
GROUP BY product_id 
HAVING SUM(total_amount) > 1000;
-- 134. The following query returns incorrect results because it uses the wrong join condition. Identify and fix it
-- SELECT *
-- FROM assignment.sales s
-- JOIN assignment.products p
--   ON s.customer_id = p.product_id;
SELECT * FROM assignment.sales s JOIN assignment.products p ON s.product_id = p.product_id;

-- 135. Replace NULL email values with 'No Email Provided' using COALESCE if any
SELECT COALESCE(email, 'No Email Provided') FROM assignment.customers;
-- 136. Trim any leading or trailing spaces from customer first names if any
UPDATE assignment.customers SET first_name = TRIM(first_name);
-- 137. Convert all customer emails to lowercase if any
UPDATE assignment.customers SET email = LOWER(email);
-- 138. Replace empty strings in phone numbers with NULL if any
UPDATE assignment.customers SET phone_number = NULL WHERE phone_number = '';
-- 139. Extract the year from registration_date and handle any NULL dates gracefully if any
SELECT COALESCE(EXTRACT(YEAR FROM registration_date)::TEXT, 'Unknown') FROM assignment.customers;





