select 
    b.id business_id,
    c.value ->> 'alias' alias,
    c.value ->> 'title' title
from {{ref("yelp_businesses_stg")}} b, json_array_elements(replace(b.categories, '''','"')::json) as c(value)