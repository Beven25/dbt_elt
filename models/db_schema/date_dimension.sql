{{ config(
    materialized='table',
) }}

SELECT DISTINCT
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    EXTRACT(DAY FROM date) AS day
FROM {{ref('weather_transformed')}}