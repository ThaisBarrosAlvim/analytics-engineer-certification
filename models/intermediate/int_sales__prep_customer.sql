with 
    store as (
        select *
        from {{ ref('stg_erp__store') }}
    )
    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )
    , customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )
    , enrich_customer as (
        select 
            customer.pk_customer,
            -- Rule: If store.name_store exists, use it; otherwise, use the full name of the person
            case 
                when store.name_store is not null and store.name_store != '' then store.name_store
                else person.first_name || ' ' || coalesce(person.middle_name || ' ', '') || person.last_name
            end as name_customer
        from customer
        left join store on customer.fk_store = store.pk_store
        left join person on customer.fk_person = person.pk_person
    )
select *
from enrich_customer
