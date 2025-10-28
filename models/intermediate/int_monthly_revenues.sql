with 

monthly_sales_nj001 as (

    select * from {{ ref('stg_nj_001') }}

),

monthly_sales_nj002 as (

    select * from {{ ref('stg_nj_002') }}

),

monthly_sales_nj003 as (

    select * from {{ ref('stg_nj_003') }}

),

monthly_cinema_sales AS (

    select * from monthly_sales_nj001
    UNION
    select * from monthly_sales_nj002
    UNION
    select * from monthly_sales_nj003

)

select * from monthly_cinema_sales
order by movie_id, month, location
