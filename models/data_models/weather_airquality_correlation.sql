-- models/weather_airquality_correlation.sql

{{ config(
    materialized='view',
) }}

select 
  corr(temperature_2m, european_aqi) as temp_aqi_corr,
  corr(relative_humidity_2m, european_aqi) as humidity_aqi_corr,
  corr(wind_speed_10m, european_aqi) as wind_aqi_corr,
  corr(temperature_2m_mean, european_aqi) as climate_temp_aqi_corr,
  corr(relative_humidity_2m_mean, european_aqi) as climate_humidity_aqi_corr,
  corr(wind_speed_10m_mean, european_aqi) as climate_wind_aqi_corr
from {{ref("weather_airquality_impact")}}