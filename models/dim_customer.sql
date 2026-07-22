{{
    config(
        materialized='incremental',
        unique_key='customer_id',
        incremental_strategy='merge',
        alias='dim_customer'
    )
}}

SELECT customer_id,first_name,last_name,email,signup_date,last_updated FROM {{ref('slv_customer')}}
{% if is_incremental() %}
    where last_updated>
    (
        SELECT MAX(LAST_UPDATED)
        FROM {{this}}
    )
{% endif%}