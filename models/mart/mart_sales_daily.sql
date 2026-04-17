{{ config(materialized='table') }}

select 
    order_date,
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity
from {{ref('int_orders_detail')}}
group by order_date