select 
    production_date,
    flour,
    lag(flour, 1) over(order by production_date)::numeric flour_lagged,
    flour - lag(flour, 1) over(order by production_date)::numeric lag_dif
from {{ref("stg_pdtn")}}
order by production_date asc