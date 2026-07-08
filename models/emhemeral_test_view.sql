{{
    config(
        materialized="view",
        alias="emhemeral_view1"
    )
}}

with dim_cust as(
    select first_name,last_name,email from {{ref('ephemeral_test')}}
)
select * from dim_cust