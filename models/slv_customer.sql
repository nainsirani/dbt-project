{{
    config(
        materialized='table',
        alias='slv_customer',
         pre_hook=[
            "DELETE FROM audit_log where model_name='slv_customer'"
        ],
        post_hook=[
             "INSERT INTO audit_log (model_name, status, run_time)
             VALUES ('slv_customer','Started',CURRENT_TIMESTAMP())"
        ]
    )
}}

with cte_slv_customer as(
    select * from  {{ref('brz_customer')}} where first_name is not null and email is not null 
)
select customer_id,first_name,last_name,email,signup_date,
    TO_TIMESTAMP(last_updated, 'MM/DD/YYYY HH24:MI:SS') AS last_updated
 from cte_slv_customer