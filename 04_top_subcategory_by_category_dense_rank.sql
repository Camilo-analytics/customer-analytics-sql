-- Top 3 product by category with porcentage of product by category----Dataset: clean_sales2324 (200K rows)
with base_table as (
   select category,
          product_name,
          count(order_id) as orders,
          sum(revenue) as total_revenue
     from clean_sales2324
    group by category,
             product_name
    order by category,
             product_name desc
),top_rev as (
   select category,
          product_name,
          orders,
          total_revenue,
          dense_rank()
          over(partition by category
               order by total_revenue desc
          ) as ranking,
          round(
             total_revenue * 100.0 / sum(total_revenue)
                                     over(partition by category),
             2
          ) as share
     from base_table
    where orders >= 100
)
select *
  from top_rev
 where ranking <= 3