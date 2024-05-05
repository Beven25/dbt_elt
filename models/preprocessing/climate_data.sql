-- models/climate_data.sql

WITH cleaned_climate_data AS (
    SELECT
        date,
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
    FROM `data-management-2-421815.weather_quality_climate.climate_data`
    WHERE NOT (
        temperature_2m_mean IS NULL AND
        temperature_2m_min IS NULL AND
        temperature_2m_max IS NULL AND
        wind_speed_10m_mean IS NULL AND
        wind_speed_10m_max IS NULL AND
        cloud_cover_mean IS NULL AND
        shortwave_radiation_sum IS NULL AND
        relative_humidity_2m_mean IS NULL AND
        relative_humidity_2m_max IS NULL AND
        relative_humidity_2m_min IS NULL AND
        dew_point_2m_mean IS NULL
    )
)

SELECT *
FROM cleaned_climate_data
