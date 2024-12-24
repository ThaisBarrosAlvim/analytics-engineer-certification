with
    renamed as (
        select
            cast(CREDITCARDID as int) as pk_credit_card,
            cast(CARDTYPE as string) as card_type,
            -- cast(CARDNUMBER as numeric(18, 2)) as card_number,
            -- cast(EXPMONTH as int) as expiration_month,
            -- cast(EXPYEAR as int) as expiration_year,
            -- cast(MODIFIEDDATE as date) as date_modified
        from {{ source('erp', 'creditcard') }}
    )

select *
from renamed
