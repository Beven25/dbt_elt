-- models/air_quality_data.sql

WITH air_quality_data AS (
    SELECT
        date,
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
    FROM `data-management-2-421815.weather_quality_climate.air_quality_data`
    WHERE NOT (
        pm10 IS NULL AND
        pm2_5 IS NULL AND
        carbon_monoxide IS NULL AND
        nitrogen_dioxide IS NULL AND
        ozone IS NULL AND
        dust IS NULL AND
        uv_index IS NULL AND
        ammonia IS NULL AND
        alder_pollen IS NULL AND
        grass_pollen IS NULL AND
        ragweed_pollen IS NULL AND
        european_aqi IS NULL
    )
)

SELECT *
FROM air_quality_data
