{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
d.date_day,
d.day_of_week,
d.month_name,
d.quarter_of_year,
d.year_number,
c.first_name as customer_first_name,
c.last_name as customer_last_name,
c.state as customer_state,
s.store_name,
s.city as store_city,
s.state as store_state,
e.first_name as employee_first_name,
e.last_name as employee_last_name,
e.position as employee_position,
p.product_name,
p.description as product_description,
f.quantity,
f.unit_price,
f.dollars_sold
FROM {{ ref('fact_sales') }} f

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON f.cust_key = c.cust_key

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON f.employee_key = e.employee_key

LEFT JOIN {{ ref('oliver_dim_store') }} s
    ON f.store_key = s.store_key

LEFT JOIN {{ ref('oliver_dim_product') }} p
    ON f.product_key = p.product_key

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON f.date_key = d.date_key
