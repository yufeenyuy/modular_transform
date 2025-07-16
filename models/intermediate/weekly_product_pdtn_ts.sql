with daily_product_amts as(
    select 
        d.expected_production_dates production_date,
        coalesce(dpp.banana50_amt, 0) as banana50_amt,
        coalesce(dpp.square50_amt, 0) as square50_amt,
        coalesce(dpp.local50_amt, 0) as local50_amt,
        coalesce(dpp.banana100_amt, 0) as banana100_amt,
        coalesce(dpp.local100_amt, 0) as local100_amt,
        coalesce(dpp.special100_amt, 0) as special100_amt,
        coalesce(dpp.special150_amt, 0) as special150_amt,
        coalesce(dpp.local200_amt, 0) as local200_amt,
        coalesce(dpp.special200_amt, 0) as special200_amt,
        coalesce(dpp.local250_amt, 0) as local250_amt,
        coalesce(dpp.local300_amt, 0) as local300_amt,
        coalesce(dpp.special400_amt, 0) as special400_amt,
        coalesce(dpp.special500_amt, 0) as special500_amt,
        coalesce(dpp.special800_amt, 0) as special800_amt
    from {{ref("daily_expected_production_dates")}} d
    left join {{ref("daily_product_pdtn_amt")}} dpp on d.expected_production_dates = dpp.production_date
)

select 
    (date_trunc('week', production_date) + interval '6 days')::date as endofweek,
    sum(banana50_amt)::numeric as banana50_amt,
    sum(square50_amt)::numeric as square50_amt,
    sum(local50_amt)::numeric as local50_amt,
    sum(banana100_amt)::numeric as banana100_amt,
    sum(local100_amt)::numeric as local100_amt,
    sum(special100_amt)::numeric as special100_amt,
    sum(special150_amt)::numeric as special150_amt,
    sum(local200_amt)::numeric as local200_amt,
    sum(special200_amt)::numeric as special200_amt,
    sum(local250_amt)::numeric as local250_amt,
    sum(local300_amt)::numeric as local300_amt,
    sum(special400_amt)::numeric as special400_amt,
    sum(special500_amt)::numeric as special500_amt,
    sum(special800_amt)::numeric as special800_amt
from daily_product_amts
group by endofweek
order by endofweek desc

