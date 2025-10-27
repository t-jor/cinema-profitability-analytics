with 

import_invoices as (

    select * from {{ source('silverscreen', 'invoices') }}

),

monthly_invoices as (

    select
        movie_id,
        month,
        location_id as location,
        sum(total_invoice_sum) as rental_cost

        --invoice_id,
        --studio,
        --release_date,
        --weekly_price

    from import_invoices
    group by movie_id, month, location

)

select * from monthly_invoices
--order by movie_id, month, location