{{ config(materialized='view') }}

select distinct
    customer_id,
    ustomer_name,
    segment
from {{ref('stg_orders')}}