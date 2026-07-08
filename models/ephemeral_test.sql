{{
    config(
        materialized="ephemeral"
    )
}}
with cte_customer as(
    select * from {{ref('brz_customer')}} 
)
select * from cte_customer  where first_name={{var('first_name')}}