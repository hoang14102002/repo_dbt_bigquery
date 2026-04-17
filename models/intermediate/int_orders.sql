{{ config(materialized='view') }}

select 
    order_id,
    min(order_date) as order_date,
    max(ship_date) as ship_date,
    any_value(customer_id) as customer_id,
    any_value(ship_mode) as ship_mode,
    any_value(order_priority) as order_priority,
    date_diff(max(ship_date), min(order_date), day) as delivery_days
from {{ ref('stg_orders') }}
group by order_id