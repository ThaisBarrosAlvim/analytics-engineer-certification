with
    dim_products as (
        select *
        from {{ ref('int_sales__prep_product') }}
    )

select *
from dim_products