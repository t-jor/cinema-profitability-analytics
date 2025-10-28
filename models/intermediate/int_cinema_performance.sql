with

monthly_rental_cost as (

    select * from {{ ref('stg_invoices') }}

),

monthly_revenue as (

    select * from {{ ref('int_movie_revenues') }}

),

monthly_performance as (

    select
    COALESCE(cst.movie_id, rev.movie_id) as movie_id,
    COALESCE(cst.month, rev.month) as month,
    COALESCE(cst.location, rev.location) as location,
    cst.rental_cost,
    rev.tickets_sold,
    rev.revenue

    from monthly_rental_cost cst
    full join monthly_revenue rev
    on cst.movie_id = rev.movie_id
    and cst.month = rev.month
    and cst.location = rev.location

)

select * from monthly_performance
order by movie_id, month, location