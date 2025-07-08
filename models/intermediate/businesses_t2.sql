select 
    b.id business_id,
    b.name,
    b.rating,
    case 
        when b.price = '€' or b.price = '$' then 'inexpensive'
        when b.price = '€€' or b.price = '$$' then 'moderate' 
        when b.price = '€€€' or b.price = '$$$' then 'expensive' 
        when b.price = '€€€€' or b.price = '$$$$' then 'luxary'
        else 'not yet defined' 
    end "price level",
    replace(replace(b.location, '''', '"'),'None','null')::json ->> 'city' as city
from {{ref("yelp_businesses_stg")}} b