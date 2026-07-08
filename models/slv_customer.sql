{{
    config(
        materialized='table',
        alias='slv_customer'
    )
}}

with cte_slv_customer as(
    select * from  {{ref('brz_customer')}} where first_name is not null and email is not null 
)
select * from cte_slv_customer