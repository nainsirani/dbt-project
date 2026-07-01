{{
   config(
    materialized='table',
    alias='transaction_bronze'
   ) 
}}
with transaction_cte as(
    select transaction_id,customer_id,transaction_amount,transaction_date,last_updated from {{source('DB_Connection','TRANSACTION_DATA')}} where customer_id is not null and transaction_amount is not null and transaction_amount >0
)
select transaction_id,customer_id,transaction_amount,transaction_date,last_updated from transaction_cte