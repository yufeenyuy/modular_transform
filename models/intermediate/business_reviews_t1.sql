select 
    br.id review_id,
    br.business_id,
    br.text review,
    br.rating
from {{ref("yelp_business_reviews_stg")}} br