{{ config(
  materialized='table',
  alias='tgt_orders'
) }}
-- SELECT * FROM {{ source('DB_Connection', 'ORDERS') }}
with cte_emp as(
    select  order_id,customer_name,amount,order_date from {{ source('DB_Connection', 'ORDERS') }} where order_id is not null and customer_name is not null and amount>0
)
select order_id,customer_name,amount,order_date from cte_emp