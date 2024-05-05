{{ config(
    materialized='table',
) }}

SELECT DISTINCT
    city
FROM {{ref('aq_transformed')}}
