# Pizza Sales Data Analysis Using MySQL

## Project Overview

This project analyzes pizza sales data using MySQL to understand order volume, revenue, customer ordering patterns, pizza performance, and category-level sales trends.

The analysis uses multiple related tables and SQL techniques to answer practical business questions about pizza sales and ordering behavior.

## Business Questions

- How many orders were placed?
- What is the total revenue generated from pizza sales?
- Which pizza has the highest price?
- What is the most commonly ordered pizza size?
- Which pizza types are ordered the most?
- Which pizza categories have the highest order quantities?
- How are orders distributed by hour of the day?
- What is the average number of pizzas ordered per day?
- Which pizza types generate the highest revenue?
- What percentage of revenue is contributed by each pizza category?
- How does cumulative revenue change over time?
- Which are the top 3 pizza types by revenue within each category?

## Dataset

The project uses four related CSV files:

- `orders.csv` — Order date and order time information
- `order_details.csv` — Pizza quantities and order details
- `pizzas.csv` — Pizza size, price, and pizza information
- `pizza_types.csv` — Pizza names, categories, and pizza type information

## Database Tables

The analysis uses the following MySQL tables:

- `orders`
- `order_details`
- `pizzas`
- `pizza_types`

These tables are joined to combine order, pizza, category, quantity, price, date, and time information.

## Tools & Technologies

- MySQL
- SQL
- CSV Dataset

## Analysis Performed

### Order Analysis

- Calculated the total number of orders
- Identified the most commonly ordered pizza size
- Analyzed order distribution by hour of the day
- Calculated the average number of pizzas ordered per day

### Revenue Analysis

- Calculated total revenue generated from pizza sales
- Identified the highest-revenue pizza types
- Calculated revenue contribution by pizza category
- Analyzed cumulative revenue over time

### Pizza Performance Analysis

- Identified the highest-priced pizza
- Identified the top 5 most ordered pizza types
- Analyzed total pizza quantity by category
- Identified the top 3 pizza types by revenue within each category

## SQL Concepts Used

- `SELECT`
- `COUNT()`
- `SUM()`
- `AVG()`
- `ROUND()`
- `GROUP BY`
- `ORDER BY`
- `JOIN`
- Subqueries
- Aggregate Functions
- `LIMIT`
- `HOUR()`
- Derived Tables
- Window Functions
- `SUM() OVER()`
- `DENSE_RANK()`
- `PARTITION BY`

## Key Skills Demonstrated

- SQL Data Analysis
- Relational Data Analysis
- Multi-Table Joins
- Revenue Analysis
- Data Aggregation
- Time-Based Analysis
- Ranking Analysis
- Window Functions
- Business-Oriented Data Analysis

## Project Files

- `Pizza codes.sql` — SQL queries used for the complete pizza sales analysis
- `orders.csv` — Order date and time data
- `order_details.csv` — Order-level pizza quantity data
- `pizzas.csv` — Pizza, size, and price data
- `pizza_types.csv` — Pizza type and category data

## Project Structure

```text
pizza-sales-sql-analysis/
│
├── README.md
├── Pizza codes.sql
│
└── pizza_sales/
    ├── orders.csv
    ├── order_details.csv
    ├── pizzas.csv
    └── pizza_types.csv
