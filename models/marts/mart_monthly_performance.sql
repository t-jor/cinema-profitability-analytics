with

monthly_movie_performance as (

    select * from {{ ref('int_monthly_performance') }}

),

movie_information as (

    select * from {{ ref('stg_movie_catalogue') }}

),

monthly_performance_final as (

    select
        perf.movie_id,
        info.movie_title,
        info.genre,
        info.studio,
        perf.month,
        perf.location,
        perf.rental_cost,
        perf.tickets_sold,
        perf.revenue,
        perf.revenue - perf.rental_cost as profit,
        round(div0(perf.revenue - perf.rental_cost, perf.rental_cost), 2) as roi

    from monthly_movie_performance perf
    left join movie_information info
    on perf.movie_id = info.movie_id

)

select * from monthly_performance_final