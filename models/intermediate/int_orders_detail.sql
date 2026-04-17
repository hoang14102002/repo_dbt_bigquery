{{ config(materialized='view') }}

select 
    order_id,
    min(order_date) as order_date,
    max(ship_date) as ship_date,
    max(customer_id) as customer_id,
    max(region) as region,
    any_value(ship_mode) as ship_mode,
    any_value(order_priority) as order_priority,
    date_diff(max(ship_date), min(order_date), day) as delivery_days,
    product_id,
    sum(quantity) as quantity,
    sum(sales) as sales,
    discount as discount,
    sum(profit) as profit,
    sum(shipping_cost) as shipping_cost
from {{ ref('stg_orders') }}
group by order_id,product_id, discount