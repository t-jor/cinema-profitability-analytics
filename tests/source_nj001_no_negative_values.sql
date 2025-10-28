--check sources for negative revenue and ticket sales

with 

source_nj001 as (

    select * from {{ source('silverscreen', 'nj_001') }}

)

select *
from source_nj001
where ticket_amount < 0 or transaction_total < 0