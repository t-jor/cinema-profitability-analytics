with 

import_catalogue as (

    select * from {{ source('silverscreen', 'movie_catalogue') }}

),

clean_catalogue as (

    select
        movie_id,
        movie_title,
        COALESCE(genre, 'Unknown') as genre,
        studio

        --release_date,
        --country,
        --budget,
        --director,
        --rating,
        --minutes

    from import_catalogue

)

select * from clean_catalogue
--order by movie_id