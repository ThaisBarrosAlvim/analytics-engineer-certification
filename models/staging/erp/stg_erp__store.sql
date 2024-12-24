with
    renamed as (
        select
            cast(BUSINESSENTITYID as int) as pk_store,
            -- cast(SALESPERSONID as int) as fk_salesperson,
            cast(NAME as string) as name_store,
            -- cast(DEMOGRAPHICS as string) as demographics,
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'store') }}
    )

select *
from renamed
