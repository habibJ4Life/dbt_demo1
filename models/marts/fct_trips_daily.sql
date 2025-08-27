{{ config(materialized='table') }}

select
  pickup_date,
  count(*)                      as trips_count,
  sum(passenger_count)          as total_passengers,
  sum(total_amount)             as revenue_sum,
  avg(total_amount)             as revenue_avg,
  sum(case when payment_type_label = 'Card' then total_amount else 0 end) as revenue_card,
  sum(case when payment_type_label = 'Cash' then total_amount else 0 end) as revenue_cash
from {{ ref('int_trips_enriched') }}
group by pickup_date
