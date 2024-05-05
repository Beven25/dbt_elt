{{ config(
    materialized='table',
) }}

SELECT
    w.date,
    w.city,
    w.temperature_2m,
    w.relative_humidity_2m,
    w.precipitation,
    w.rain,
    w.snowfall,
    w.snow_depth,
    w.surface_pressure,
    w.cloud_cover,
    w.cloud_cover_low,
    w.cloud_cover_mid,
    w.apparent_temperature,
    w.et0_fao_evapotranspiration,
    w.vapour_pressure_deficit,
    w.weather_code,
    w.wind_speed_10m,
    w.wind_speed_100m,
    w.wind_direction_10m,
    w.pressure_msl,
    a.pm10,
    a.pm2_5,
    a.carbon_monoxide,
    a.nitrogen_dioxide,
    a.ozone,
    a.dust,
    a.uv_index,
    a.ammonia,
    a.alder_pollen,
    a.grass_pollen,
    a.ragweed_pollen,
    a.european_aqi,
    c.temperature_2m_mean,
    c.temperature_2m_min,
    c.temperature_2m_max,
    c.wind_speed_10m_mean,
    c.wind_speed_10m_max,
    c.cloud_cover_mean,
    c.shortwave_radiation_sum,
    c.relative_humidity_2m_mean,
    c.relative_humidity_2m_max,
    c.relative_humidity_2m_min,
    c.dew_point_2m_mean
FROM
    {{ref("weather_transformed")}} w
    LEFT JOIN {{ref("aq_transformed")}}  a ON w.date = a.date AND w.city = a.city
    LEFT JOIN {{ref("climate_transformed")}} c ON w.date = c.date AND w.city = c.city