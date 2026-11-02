{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}

SELECT
    CERTIFICATION_COMPLETION_ID as certification_completion_id,
    FIRST_NAME as first_name,
    LAST_NAME as last_name,
    EMAIL as email,
    EMPLOYEE_ID as employee_id,
    PARSE_JSON(CERTIFICATION_JSON):certification_name::string AS certification_name,
    PARSE_JSON(CERTIFICATION_JSON):certification_cost::float AS certification_cost,
    PARSE_JSON(CERTIFICATION_JSON):certification_awarded_date::date AS certification_awarded_date
    FROM {{ source('oliver_landing', 'employee_certifications') }}
