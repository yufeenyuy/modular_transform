select 
    b.id business_id,
    trim(both '"' from json_array_elements(replace(b.transactions,'''','"')::json)::text) as transactions
from {{ref("yelp_businesses_stg")}} b