with
    sales_in_2011 as (
        select sum(unit_price*order_quantity) as sum_extended_amount
        from {{ ref('int_sales__prep_salesorderdetail') }}
        where date_order between '2011-01-01' and '2011-12-31'
    )

select sum_extended_amount
from sales_in_2011
where sum_extended_amount not between 12646113.00 and 12646113.00