with 
    creditcard as (
        select *
        from {{ ref('stg_erp__creditcard') }}
    )

    , enrich_creditcard as (
        select 
            creditcard.pk_credit_card
            , creditcard.card_type
        from creditcard
    )
    
select *
from enrich_creditcard