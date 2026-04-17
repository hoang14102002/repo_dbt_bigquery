{{ config(materialized='table') }}

select 
    customer_id,
    ustomer_name,
    segment
from {{ref('int_dim_customer')}}