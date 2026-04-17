{{ config(materialized='table') }}

with date_bounds as (
    select
        min(order_date) as min_date,
        max(order_date) as max_date
    from {{ ref('int_orders') }}
),

date_spine as (
    select
        date
    from date_bounds,
    unnest(generate_date_array(min_date, max_date)) as date
)

select
    date,
    extract(year from date) as year,
    extract(month from date) as month,
    extract(day from date) as day,
    extract(dayofweek from date) as day_of_week,
    format_date('%A', date) as day_name,
    extract(week from date) as week_of_year,
    extract(quarter from date) as quarter,
    
    -- useful flags
    case when extract(dayofweek from date) in (1,7) then true else false end as is_weekend

from date_spine