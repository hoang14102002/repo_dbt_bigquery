{{ config(materialized='view') }}

select distinct
    postal_code,
    city,
    state,
    country,
    region,
    market
from {{ref('stg_orders')}}