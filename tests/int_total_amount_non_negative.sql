select *
from {{ ref('int_trips_enriched') }}
where total_amount < 0