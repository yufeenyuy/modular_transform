select 
    production_date,
    fuel,
    lag(fuel, 1) over(order by production_date)::numeric flour_lagged
from {{ref("stg_pdtn")}} 
order by production_date asc

/*   */
