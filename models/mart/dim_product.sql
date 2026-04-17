{{ config(materialized='table') }}

select 
    product_id,
    product_name,
    category,
    sub_category
from {{ref('int_dim_product')}}