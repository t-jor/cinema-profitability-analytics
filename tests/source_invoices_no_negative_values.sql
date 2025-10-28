--check sources for negative invoices

with 

source_invoices as (

    select * from {{ source('silverscreen', 'invoices') }}

)

select *
from source_invoices
where total_invoice_sum < 0