-- models/aq_transformed.sql

-- Step 1: Seperate the date and time into separate columns
WITH split_datetime AS (
    SELECT
        DATE(date) AS date,
        TIME(date) AS time,
        city,
        pm10,
        pm2_5,
        carbon_monoxide,
        nitrogen_dioxide,
        ozone,
        dust,
        uv_index,
        ammonia,
        alder_pollen,
        grass_pollen,
        ragweed_pollen,
        european_aqi
    FROM {{ref('air_quality_data')}}
),

-- Step 2: Classify european_aqi into different categories
classified_air_quality AS (
    SELECT
        date,
        time,
        city,
        pm10,
        pm2_5,
        carbon_monoxide,
        nitrogen_dioxide,
        ozone,
        dust,
        uv_index,
        ammonia,
        alder_pollen,
        grass_pollen,
        ragweed_pollen,
        european_aqi,
        CASE
            WHEN european_aqi <= 50 THEN 'Good'
            WHEN european_aqi <= 100 THEN 'Moderate'
            WHEN european_aqi <= 150 THEN 'Unhealthy for Sensitive Groups'
            WHEN european_aqi <= 200 THEN 'Unhealthy'
            WHEN european_aqi <= 300 THEN 'Very Unhealthy'
            ELSE 'Hazardous'
        END AS aqi_category
    FROM split_datetime
)

-- Step 3: Output the transformed data
SELECT *
FROM classified_air_quality
