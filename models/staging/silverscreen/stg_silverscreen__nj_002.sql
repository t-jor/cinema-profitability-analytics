with 

import_cinema_nj002 as (

    select * from {{ source('silverscreen', 'nj_002') }}

),

monthly_cinema_nj002 as (

    select
        movie_id,
        date_trunc('month', date) as month,
        'NJ_002' as location,
        sum(ticket_amount) as tickets_sold,
        sum(total_earned) as revenue

        --ticket_price

    from import_cinema_nj002
    group by movie_id, month, location

)

select * from monthly_cinema_nj002
order by movie_id, month