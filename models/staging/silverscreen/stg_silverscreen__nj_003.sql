with 

import_cinema_nj003 as (

    select * from {{ source('silverscreen', 'nj_003') }}

),

monthly_cinema_nj003 as (

    select
        details as movie_id,
        date_trunc('month', timestamp) as month,
        'NJ_003' as location,
        sum(amount) as tickets_sold,
        sum(total_value) as revenue

        --transaction_id,
        --product_type,
        --price
        
    from import_cinema_nj003
    where product_type = 'ticket'
    group by movie_id, month, location

)

select * from monthly_cinema_nj003
order by movie_id, month