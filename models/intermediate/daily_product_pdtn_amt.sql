select 
    production_date,
    sum(case when trim(p.bread_type) = 'banana50' then p.amount else 0 end) banana50_amt,
    sum(case when trim(p.bread_type) = 'square50' then p.amount else 0 end) square50_amt,
    sum(case when trim(p.bread_type) = 'local50' then p.amount else 0 end) local50_amt,
    sum(case when trim(p.bread_type) = 'banana100' then p.amount else 0 end) banana100_amt,
    sum(case when trim(p.bread_type) = 'local100' then p.amount else 0 end) local100_amt,
    sum(case when trim(p.bread_type) = 'special100' then p.amount else 0 end) special100_amt,
    sum(case when trim(p.bread_type) = 'special150' then p.amount else 0 end) special150_amt,
    sum(case when trim(p.bread_type) = 'local200' then p.amount else 0 end) local200_amt,
    sum(case when trim(p.bread_type) = 'special200' then p.amount else 0 end) special200_amt,
    sum(case when trim(p.bread_type) = 'local250' then p.amount else 0 end) local250_amt,
    sum(case when trim(p.bread_type) = 'local300' then p.amount else 0 end) local300_amt,
    sum(case when trim(p.bread_type) = 'special400' then p.amount else 0 end) special400_amt,
    sum(case when trim(p.bread_type) = 'special500' then p.amount else 0 end) special500_amt,
    sum(case when trim(p.bread_type) = 'special800' then p.amount else 0 end) special800_amt
from {{ref("pdtn_t1")}} p
group by production_date
order by production_date desc