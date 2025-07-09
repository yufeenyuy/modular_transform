select 
"Date"::date production_date,
sum("Banana 50 "::numeric) banana_50,
sum("Banana 100"::numeric) banana_100,
sum("Square 50"::numeric) square_50,
sum("Local 50"::numeric) local_50,
sum("Local 100"::numeric) local_100,
sum("Local 200"::numeric) local_200,
sum("Local 250"::numeric) local_250,
sum("Local 300"::numeric) local_300,
sum("Special 100"::numeric) special_100,
sum("Special 150"::numeric) special_150,
sum("Special 200"::numeric) special_200,
sum("Special 400"::numeric) special_400,
sum("Special 500"::numeric) special_500,
sum("Special 800"::numeric) special_800,
sum("Old stuck"::numeric) old_stuck,
sum("Flour in bags"::numeric) flour,
sum("Fuel in cfa"::numeric) fuel,
sum("Feeding"::numeric) feeding
from {{source("local_baker_source_data","production_data")}}
    where "Date" not in ('1900-01-28 00:00:00','7030-01-26 00:00:00')
group by "Date"::date
