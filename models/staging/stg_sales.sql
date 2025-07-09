select 
    s.* 
from {{source("local_baker_source_data","sales_data")}} s
