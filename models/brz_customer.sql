{{
    config(
        materialized='table',
        alias='bronze_customer'
    )
}}

with cte_bronze_customer as(
    select customer_id,first_name,last_name,email,signup_date ,last_updated from  {{source('DB_Connection','RAW_CUSTOMER')}}
)
 select * from cte_bronze_customer 

