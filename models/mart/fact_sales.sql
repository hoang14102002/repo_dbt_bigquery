{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key=['order_id', 'product_id', 'discount'],
    partition_by={
        "field": "order_date",
        "data_type": "date"
    },
    cluster_by=['order_id', 'product_id']
) }}

select 
    order_id,
    max(order_date) as order_date,
    max(customer_id) as customer_id,
    product_id,
    sum(quantity) as quantity,
    sum(sales) as sales,
    discount,
    sum(profit) as profit,
    sum(shipping_cost) as shipping_cost
from {{ ref('stg_orders') }}

{% if is_incremental() %}
where order_date >= (
    select date_sub(max(order_date), interval 1 day)
    from {{ this }}
)
{% endif %}

group by order_id, product_id, discount