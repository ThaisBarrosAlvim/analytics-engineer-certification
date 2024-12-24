with 
    product as (
        select *
        from {{ ref('stg_erp__product') }}
    )

    , enrich_product as (
        select 
            product.pk_product
            , product.standard_cost
            , product.list_price
            , product.name_product
            , product.product_number
        from product
    )
    
select *
from enrich_product