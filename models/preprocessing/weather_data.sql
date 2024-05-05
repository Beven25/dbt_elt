-- models/weather_data.sql

WITH cleaned_weather_data AS (
    SELECT DISTINCT
        date,
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
    FROM `data-management-2-421815.weather_quality_climate.weather_data`
    WHERE NOT (
        temperature_2m IS NULL AND
        relative_humidity_2m IS NULL AND
        precipitation IS NULL AND
        rain IS NULL AND
        snowfall IS NULL AND
        snow_depth IS NULL AND
        surface_pressure IS NULL AND
        cloud_cover IS NULL AND
        cloud_cover_low IS NULL AND
        cloud_cover_mid IS NULL AND
        apparent_temperature IS NULL AND
        et0_fao_evapotranspiration IS NULL AND
        vapour_pressure_deficit IS NULL AND
        weather_code IS NULL AND
        wind_speed_10m IS NULL AND
        wind_speed_100m IS NULL AND
        wind_direction_10m IS NULL AND
        pressure_msl IS NULL AND
        City IS NULL
    )
)

SELECT *
FROM cleaned_weather_data
