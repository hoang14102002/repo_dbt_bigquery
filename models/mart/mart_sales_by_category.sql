{{ config(materialized='table') }}

select 
    t2.sub_category,
    t2.category,
    sum(t1.sales) as total_sales,
    sum(t1.profit) as total_profit,
    count(distinct t1.order_id) as total_orders
from {{ref('int_orders_detail')}} t1
    left join {{ref('int_dim_product')}} t2 ON t1.product_id = t2.product_id
group by t2.category, t2.sub_category