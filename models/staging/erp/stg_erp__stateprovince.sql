with
    renamed as (
        select
            cast(STATEPROVINCEID as int) as pk_state_province,
            -- cast(TERRITORYID as int) as fk_territory,
            cast(COUNTRYREGIONCODE as string) as fk_country_region,
            -- cast(MODIFIEDDATE as date) as date_modified,
            cast(STATEPROVINCECODE as string) as state_province_code,
            cast(NAME as string) as name_state_province,
            -- cast(ISONLYSTATEPROVINCEFLAG as boolean) as is_only_state_province_flag,
            -- cast(ROWGUID as string) as row_guid
        from {{ source('erp', 'stateprovince') }}
    )

select *
from renamed