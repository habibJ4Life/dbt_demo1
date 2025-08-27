select *
from {{ ref('stg_yellow_trips') }}
where passenger_count < 0