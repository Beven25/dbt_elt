-- models/weather_airquality_impact.sql

{{ config(
    materialized='table',
) }}

select
  w.date,
  w.city,
  w.temperature_2m,
  w.relative_humidity_2m,
  w.precipitation,
  w.wind_speed_10m,
  w.cloud_cover,
  w.weather_code,
  a.pm10,
  a.pm2_5,
  a.ozone,
  a.european_aqi,
  a.aqi_category,
  c.temperature_2m_mean,
  c.relative_humidity_2m_mean,
  c.wind_speed_10m_mean,
  c.cloud_cover_mean,
  c.dew_point_2m_mean
FROM {{ref("weather_transformed")}} w
left join
   {{ref("aq_transformed")}} a
on
  w.date = a.date and w.city = a.city
left join
  {{ref("climate_transformed")}} c
on
  w.date = c.date and w.city = c.city
