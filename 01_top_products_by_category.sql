--Top 3 products by category based on total revenue 
--Dataset: clean_sales2324 (200K rows)

with base_reve as (
   select category,
          product_name,
          sum(revenue) as total_revenue
     from clean_sales2324
    group by category,
             product_name
),ranked as (
   select category,
          product_name,
          total_revenue,
          row_number()
          over(partition by category
               order by total_revenue desc
          ) as ranking
     from base_reve
)
select *
  from ranked
 where ranking <= 3
 order by category,
          ranking;