with
    renamed as (
        select
            cast(SALESORDERDETAILID as int) as pk_sales_order_detail,
            cast(SALESORDERID as int) as fk_sales_order,
            cast(PRODUCTID as int) as fk_product,
            -- cast(SPECIALOFFERID as int) as fk_special_offer,
            -- cast(MODIFIEDDATE as date) as date_modified,
            cast(ORDERQTY as int) as order_quantity,
            cast(UNITPRICE as numeric(18, 4)) as unit_price,
            cast(UNITPRICEDISCOUNT as numeric(18, 2)) as unit_price_discount,
            -- cast(CARRIERTRACKINGNUMBER as string) as carrier_tracking_number,
            -- cast(ROWGUID as string) as row_guid
        from {{ source('erp', 'salesorderdetail') }}
    )

select *
from renamed
