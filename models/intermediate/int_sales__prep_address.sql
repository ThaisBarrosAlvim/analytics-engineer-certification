with 
    address as (
        select *
        from {{ ref('stg_erp__address') }}
    ),
    state_province as (
        select *
        from {{ ref('stg_erp__stateprovince') }}
    ),
    country_region as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    ),
    enrich_address as (
        select 
            address.pk_address as pk_address,
            address.city as city,
            state_province.name_state_province as name_state_province,
            state_province.state_province_code as state_province_code,
            country_region.name_country_region as name_country_region,
            country_region.pk_country_region as country_region_code
        from address
        left join state_province on address.fk_state_province = state_province.pk_state_province
        left join country_region on state_province.fk_country_region = country_region.pk_country_region
    )

select *
from enrich_address
