{{ config(materialized='table') }}

select 
    customer_id,
    customer_name,
    segment
from {{ref('int_dim_customer')}}