
select 
    generate_series(
        (select min(production_date) from {{ref("pdtn_t1")}}),
        (select max(production_date) from {{ref("pdtn_t1")}}),
        interval '1 day'
    )::date as expected_production_dates

/* */
