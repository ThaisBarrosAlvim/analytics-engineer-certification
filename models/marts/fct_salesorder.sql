with
    fct_salesorder as (
        select *
        from {{ ref('int_sales__prep_salesorderdetail') }}
    )

select *
from fct_salesorder