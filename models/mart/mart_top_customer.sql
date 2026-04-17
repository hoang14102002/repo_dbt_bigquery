{{ config(materialized='table') }}

select 
    customer_id,
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    count(distinct order_id) as total_orders
from {{ref('int_orders_detail')}}
group by customer_id