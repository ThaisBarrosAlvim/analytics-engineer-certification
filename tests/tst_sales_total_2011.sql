
with distinct_orders as (
    select
        total_due,
        date_order,
        row_number() over (partition by sales_order_header_number order by sales_order_header_number) as rn
    from {{ ref('int_sales__prep_salesorderdetail') }}
)
select
    sum(total_due) as calculated_total_sum
from distinct_orders
where rn = 1
  and date_order between '2011-01-01' and '2011-12-31'
having sum(total_due) not between 14155700.00 and 14155701.00