# PostgreSQL Sales & Inventory Analytics Project

![PostgreSQL](https://shields.io)
![SQL](https://shields.io)

## 📌 Project Overview
This repository contains a comprehensive SQL deep-dive into a retail management system. 
The project focuses on solving **139 real-world business problems** using PostgreSQL, 
ranging from basic data retrieval to advanced analytical engineering.

## 🏗️ Database Schema
The project operates within a custom `assignment` schema to ensure data isolation.


| Table | Description | Key Columns |
| :--- | :--- | :--- |
| **Customers** | Demographic & Membership data | `customer_id`, `membership_status`, `registration_date` |
| **Products** | Inventory catalog & Pricing | `product_id`, `category`, `price`, `stock_quantity` |
| **Sales** | Transaction history | `sale_id`, `quantity_sold`, `total_amount`, `sale_date` |
| **Inventory** | Stock tracking | `product_id`, `stock_quantity` |

## 🚀 Skills Demonstrated

### 1. Advanced Analytical SQL
*   **Window Functions:** Ranking customers by spending (`RANK`, `DENSE_RANK`) and calculating running totals.
*   **CTEs & Subqueries:** Creating modular, readable queries for multi-step logic.
*   **Set Operations:** Utilizing `UNION`, `INTERSECT`, and `EXCEPT` for customer segmentation.

### 2. Database Engineering
*   **Functions & Procedures:** Created reusable PL/pgSQL logic for sales reporting and dynamic calculations.
*   **Optimization:** Implemented **B-Tree Indexes** on foreign keys and date columns to speed up joins and filtering.
*   **Views:** Built virtual tables for frequent reports like `total_revenue_per_product`.

### 3. Data Integrity & Transactions
*   **ACID Transactions:** Atomic operations to ensure that when a sale is recorded, the inventory stock is updated simultaneously.
*   **Data Cleaning:** Handling `NULL` values via `COALESCE` and standardizing text with `TRIM` and `LOWER`.

## 📁 Project Structure
```text
├── schema/
│   └── tables.sql          # Table definitions and constraints
├── queries/
│   ├── basic_crud.sql      # Questions 1-50 (Filtering & Joins)
│   ├── intermediate.sql    # Questions 51-90 (Subqueries & CTEs)
│   └── advanced.sql        # Questions 91-139 (Window Funcs & Procedures)
└── README.md
```

## 🛠️ How to Use
1.  **Clone the repository:**
    ```bash
    git clone https://github.com
    ```
2.  **Initialize the database:**
    Run the `CREATE SCHEMA` and `CREATE TABLE` scripts in your PostgreSQL tool (pgAdmin, psql, or DBeaver).
3.  **Run Queries:**
    Execute the SQL files located in the `queries/` folder to view business insights.

## 📊 Sample Business Insight
**Query:** *Find customers who spent more than the average of their membership tier.*
```sql
WITH tier_avg AS (
    SELECT c.membership_status, AVG(s.total_amount) as avg_tier
    FROM assignment.customers c
    JOIN assignment.sales s ON c.customer_id = s.customer_id
    GROUP BY 1
)
SELECT s.customer_id 
FROM assignment.sales s
JOIN assignment.customers c ON s.customer_id = c.customer_id
JOIN tier_avg t ON c.membership_status = t.membership_status
GROUP BY s.customer_id, t.avg_tier
HAVING SUM(s.total_amount) > t.avg_tier;
```

---
⭐ **If you find this project helpful, please give it a star!**
