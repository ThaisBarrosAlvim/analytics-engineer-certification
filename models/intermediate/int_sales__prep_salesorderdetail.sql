with 
    sales_order_detail as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    ),
    sales_order_header as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    ),
    enrich_sales_order as (
        select 
            detail.pk_sales_order_detail,
            detail.fk_product,
            header.fk_customer,
            header.fk_billto_address,
            header.fk_shipto_address,
            header.fk_credit_card,
            detail.fk_sales_order as sales_order_header_number,
            header.date_order,
            header.date_due,
            header.date_ship,
            detail.order_quantity,
            detail.unit_price,
            detail.unit_price_discount,
            header.subtotal,
            header.tax_amount,
            header.freight,
            header.total_due,
            header.revision_number,
            header.status,

            -- Extended order value (Gross total)
            (detail.order_quantity * detail.unit_price) as extended_amount,

            -- Net Amount (ExtendedAmount + tax_amount & freight)
            (detail.order_quantity * detail.unit_price) 
            + header.tax_amount + header.freight as net_amount,

            -- Total discount per item
            (detail.order_quantity * detail.unit_price_discount) as total_discount,

            -- Has discount
            case 
                when detail.unit_price_discount > 0 then true 
                else false 
            end as has_discount

        from sales_order_detail detail
        left join sales_order_header header
            on detail.fk_sales_order = header.pk_sales_order
    )

select *
from enrich_sales_order
