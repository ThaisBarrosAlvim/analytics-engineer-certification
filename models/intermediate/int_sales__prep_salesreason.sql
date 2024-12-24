with 
    
    source_data as (
    
        select
            pk_sales_reason
            ,name_sales_reason
            ,reason_type
        from {{ ref('stg_erp__salesreason') }})

    , enrich_salesreason as (
        
        select
        {{ dbt_utils.surrogate_key(
            [
                'pk_sales_reason::string'
                ,'name_sales_reason'
                ,'reason_type'
            ]
        ) }} as sales_reason_key
        ,pk_sales_reason
        ,name_sales_reason
        ,reason_type
    from source_data )

select * 
from enrich_salesreason