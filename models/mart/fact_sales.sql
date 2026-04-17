{{ config(materialized='table') }}

select 
    order_id,
    max(order_date) as order_date,
    max(customer_id) as customer_id,
    product_id,
    sum(quantity) as quantity,
    sum(sales) as sales,
    discount as discount,
    sum(profit) as profit,
    sum(shipping_cost) as shipping_cost
from {{ ref('stg_orders') }}
group by order_id,product_id, discount