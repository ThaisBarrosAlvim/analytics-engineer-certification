with
    renamed as (
        select
            cast(SALESORDERID as int) as pk_sales_order,
            cast(SALESREASONID as int) as fk_sales_reason,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select *
from renamed
