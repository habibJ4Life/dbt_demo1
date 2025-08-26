{{ config(materialized='view') }}

select
  cast(vendor_id as int64)              as vendor_id,
  cast(passenger_count as int64)        as passenger_count,
  datetime(pickup_datetime)             as pickup_dt,
  datetime(dropoff_datetime)            as dropoff_dt,
  total_amount,
  payment_type
from {{ source('nyc', 'tlc_yellow_trips_2019') }}
where total_amount >= 0