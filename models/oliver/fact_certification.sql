{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

select
    dd.date_key,
    de.employee_key,
    ec.certification_name,
    ec.certification_cost
from {{ ref('oliver_employee_certifications') }} ec
inner join {{ ref('oliver_dim_date') }} dd
    on ec.certification_awarded_date = dd.date_key
inner join {{ ref('oliver_dim_employee') }} de
    on ec.employee_id = de.employee_id