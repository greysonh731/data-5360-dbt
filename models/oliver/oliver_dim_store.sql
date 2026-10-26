{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

-- source store table contains exact duplicate rows, so DISTINCT keeps one row per store
SELECT DISTINCT
store_id as store_key,
store_id,
store_name,
street,
city,
state
FROM {{ source('oliver_landing', 'store') }}
