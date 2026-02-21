--Top 3 subcategories using DENSE_RANK() in order to get ties and not
--Dataset: clean_sales2324 (200K rows)

with base_reve as (
   select category,
          sub_category,
          sum(revenue) as total_revenue
     from clean_sales2324
    group by category,
             sub_category
),ranked as (
   select category,
          sub_category,
          total_revenue,
          dense_rank()
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