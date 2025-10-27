with 

monthly_cinema_nj001 as (

    select * from {{ ref('stg_silverscreen__nj_001') }}

),

monthly_cinema_nj002 as (

    select * from {{ ref('stg_silverscreen__nj_002') }}

),

monthly_cinema_nj003 as (

    select * from {{ ref('stg_silverscreen__nj_003') }}

),

movie_revenues_combined AS (

    select * from monthly_cinema_nj001
    UNION
    select * from monthly_cinema_nj002
    UNION
    select * from monthly_cinema_nj003

)

select * from movie_revenues_combined
order by movie_id, month, location
