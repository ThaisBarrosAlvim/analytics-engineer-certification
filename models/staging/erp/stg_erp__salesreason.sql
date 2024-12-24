with
    renamed as (
        select
            cast(SALESREASONID as int) as pk_sales_reason,
            cast(NAME as string) as name_sales_reason,
            cast(REASONTYPE as string) as reason_type,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'salesreason') }}
    )

select *
from renamed
