-- models/climate_transformed.sql

-- Step 1: Extract only the date component
WITH extract_date AS (
    SELECT
        DATE(date) AS date,
        city,
        temperature_2m_mean,
        temperature_2m_min,
        temperature_2m_max,
        wind_speed_10m_mean,
        wind_speed_10m_max,
        cloud_cover_mean,
        shortwave_radiation_sum,
        relative_humidity_2m_mean,
        relative_humidity_2m_max,
        relative_humidity_2m_min,
        dew_point_2m_mean
    FROM {{ ref('climate_data') }}
)

-- Step 2: Output the transformed data
SELECT *
FROM extract_date
