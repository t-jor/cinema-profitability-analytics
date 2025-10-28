--check sources for negative revenue and ticket sales

with 

source_nj003 as (

    select * from {{ source('silverscreen', 'nj_003') }}

)

select *
from source_nj003
where amount < 0 or total_value < 0