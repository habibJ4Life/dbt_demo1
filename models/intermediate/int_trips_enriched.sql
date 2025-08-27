-- models/intermediate/int_trips_enriched.sql
{{ config(materialized='view') }}

with base as (
  select * from {{ ref('stg_yellow_trips') }}
)
select
  date(pickup_dt)               as pickup_date,
  extract(hour from pickup_dt)  as pickup_hour,
  passenger_count,
  total_amount,
  case cast(payment_type as int64)
    when 1 then 'Card' when 2 then 'Cash' when 3 then 'No charge'
    when 4 then 'Dispute' when 5 then 'Unknown' when 6 then 'Voided'
    else 'Other'
  end as payment_type_label
from base
where total_amount >= 0
  and passenger_count is not null     