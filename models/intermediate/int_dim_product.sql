{{ config(materialized='view') }}

select distinct
    product_id,
    product_name,
    category,
    sub_category
from {{ref('stg_orders')}}