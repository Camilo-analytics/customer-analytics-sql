# customer-analytics-sql
# Customer Revenue Analysis – SQL Project

## Business Objective
Identify the top revenue contributors within each category to understand product and subcategory concentration patterns.

## Dataset
Sales dataset (200k rows) covering 2023–2024 transactions.
Table used: clean_sales2324.

## Key Questions Answered
1. What are the top 3 products by revenue within each category?
2. What are the top 3 subcategories by revenue within each category?
3. How does the ranking change when including revenue ties?

## Methods Used
- GROUP BY aggregation
- SUM(revenue)
- Window functions:
  - ROW_NUMBER() for exact Top N
  - DENSE_RANK() for tie-inclusive Top N
- PARTITION BY category
- ORDER BY total_revenue DESC

## Key Insight
Revenue concentration varies by category, and tie-handling logic can change the number of results returned in Top N reporting scenarios.
