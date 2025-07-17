select 
    endofweek,
    round(banana50_amt/1000,2) as banana50_amt,
    round(square50_amt/1000,2) as square50_amt,
    round(local50_amt/1000, 2) as local50_amt,
    round(banana100_amt/1000, 2) as banana100_amt,
    round(local100_amt/1000, 2) as local100_amt,
    round(special100_amt/1000, 2) as special100_amt,
    round(special150_amt/1000,2) as special150_amt,
    round(local200_amt/1000,2) as local200_amt,
    round(special200_amt/1000, 2) as special200_amt,
    round(local250_amt/1000, 2) as local250_amt,
    round(local300_amt/1000, 2) as local300_amt,
    round(special400_amt/1000, 2) as special400_amt,
    round(special500_amt/1000, 2) as special500_amt,
    round(special800_amt/1000, 2) as special800_amt
from {{ref("weekly_product_pdtn_ts")}}