with
    bridge_salesreason as (
        select *
        from {{ ref('int_sales__bridge_salesreason') }}
    )

select *
from bridge_salesreason