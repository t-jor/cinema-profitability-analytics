with 

import_sales_nj001 as (

    select * from {{ source('silverscreen', 'nj_001') }}

),

monthly_sales_nj001 as (

    select
        movie_id,
        date_trunc('month', timestamp) as month,
        'NJ_001' as location,
        sum(ticket_amount) as tickets_sold,
        sum(transaction_total) as revenue
        
        --transaction_id,
        --price,
        --transaction_total,
        --is_discounted,
        --is_3d

    from import_sales_nj001
    group by movie_id, month, location

)

select * from monthly_sales_nj001
--order by movie_id, month