{{ config(materialized='table') }}

select distinct
    region,
    market
from {{ref('int_dim_location')}}