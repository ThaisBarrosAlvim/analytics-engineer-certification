with
    renamed as (
        select
            cast(COUNTRYREGIONCODE as string) as pk_country_region,
            cast(NAME as string) as name_country_region,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'countryregion') }}
    )

select *
from renamed
