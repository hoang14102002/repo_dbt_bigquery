{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_date'
) }}

select 
    order_date,
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    count(distinct order_id) as total_orders,
    sum(quantity) as total_quantity
from {{ ref('int_orders_detail') }}

{% if is_incremental() %}
where order_date >= (
    select date_sub(max(order_date), interval 1 day)
    from {{ this }}
)
{% endif %}

group by order_date