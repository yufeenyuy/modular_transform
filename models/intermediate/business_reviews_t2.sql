select 
    ti.id review_id,
    ti.business_id,
    ti.time_created::date review_created,
    extract(year from ti.time_created::date) review_created_year,
    extract(month from ti.time_created::date) review_created_month,
    extract(day from ti.time_created::date) review_created_dayofmonth,
    to_char(ti.time_created::date, 'yyyy-Mon') review_created_yearmonth,
    to_char(ti.time_created::date, 'yyyyMM') review_created_yearmonth_sorter,
    to_char(ti.time_created::date, 'mon-Dy') review_created_monthday,
    to_char(ti.time_created::date, 'Dy') review_created_weekday,
    to_char(ti.time_created::date, 'ID') review_created_weekday_sorter,
    to_char(ti.time_created::date, 'yyyy-Mon-WW') review_created_wknum,
    (date_trunc('week', ti.time_created::date) + interval '6 days')::date date_endofwik,
    to_char(ti.time_created::timestamp, 'HH24') review_dayhour
from {{ref("yelp_business_reviews_stg")}} ti