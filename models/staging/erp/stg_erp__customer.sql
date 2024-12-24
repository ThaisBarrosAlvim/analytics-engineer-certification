with
    renamed as (
        select
            cast(CUSTOMERID as int) as pk_customer,
            cast(PERSONID as int) as fk_person,
            cast(STOREID as int) as fk_store,
            -- cast(TERRITORYID as int) as fk_territory, 
            -- cast(ROWGUID as string) as row_guid,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'customer') }}
    )

select *
from renamed
