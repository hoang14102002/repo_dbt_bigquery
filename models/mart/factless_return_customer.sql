{{ config(materialized='table') }}

select 
    customer_id,
    count(order_id) as total_orders,
    case when count(order_id) > 1 then 1 else 0 end as is_return
from {{ref('fact_sales')}}
group by customer_id