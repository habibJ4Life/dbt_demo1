select *
from {{ ref('fct_trips_daily') }}
where revenue_sum < 0