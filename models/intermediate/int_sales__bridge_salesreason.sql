with sohr as (
    select
        pk_sales_order,
        fk_sales_reason
    from {{ ref('stg_erp__salesorderheadersalesreason') }}
),

bridge_salesreason as (
    select
        sohr.pk_sales_order as sales_order_id,
        dsr.sales_reason_key
    from sohr
    left join {{ ref('int_sales__prep_salesreason') }} dsr
        on sohr.fk_sales_reason = dsr.pk_sales_reason
)

select
    sales_order_id,
    sales_reason_key,
from bridge_salesreason
