with
    dim_creditcard as (
        select *
        from {{ ref('int_sales__prep_creditcard') }}
    )

select *
from dim_creditcard