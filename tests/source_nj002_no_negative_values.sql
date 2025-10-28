--check sources for negative revenue and ticket sales

with 

source_nj002 as (

    select * from {{ source('silverscreen', 'nj_002') }}

)

select *
from source_nj002
where ticket_amount < 0 or total_earned < 0