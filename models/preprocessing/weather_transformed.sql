-- models/weather_transformed.sql

-- Step 1: Seperate the date and time into separate columns
WITH split_datetime AS (
    SELECT
        DATE(date) AS date,
        TIME(date) AS time,
        temperature_2m,
        relative_humidity_2m,
        precipitation,
        rain,
        snowfall,
        snow_depth,
        surface_pressure,
        cloud_cover,
        cloud_cover_low,
        cloud_cover_mid,
        apparent_temperature,
        et0_fao_evapotranspiration,
        vapour_pressure_deficit,
        weather_code,
        wind_speed_10m,
        wind_speed_100m,
        wind_direction_10m,
        pressure_msl,
        City
    FROM {{ ref('weather_data') }}
),

-- Step 2: Output the transformed data
transformed_weather_data AS (
    SELECT
        date,
        time,
        temperature_2m,
        relative_humidity_2m,
        precipitation,
        rain,
        snowfall,
        snow_depth,
        surface_pressure,
        cloud_cover,
        cloud_cover_low,
        cloud_cover_mid,
        apparent_temperature,
        et0_fao_evapotranspiration,
        vapour_pressure_deficit,
        weather_code,
        wind_speed_10m,
        wind_speed_100m,
        wind_direction_10m,
        pressure_msl,
        City
    FROM split_datetime
)

-- Step 3: Output the transformed data
SELECT *
FROM transformed_weather_data
