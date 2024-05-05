-- models/urban_health_index.sql

WITH environmental_factors AS (
  SELECT
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
    c.temperature_2m_mean,
    c.relative_humidity_2m_mean,
    c.wind_speed_10m_mean,
    c.cloud_cover_mean,
    c.dew_point_2m_mean
  FROM `data-management-2-421815.dbt_elt.weather_transformed` w
  LEFT JOIN
    data-management-2-421815.dbt_elt.aq_transformed a
  ON
    w.date = a.date AND w.city = a.city
  LEFT JOIN
    data-management-2-421815.dbt_elt.climate_transformed c
  ON
    w.date = c.date AND w.city = c.city
),
uehi_calculation AS (
  SELECT
    date,
    city,
    (temperature_2m + (pm10 / 10) + (pm2_5 / 10) - (ozone / 10) - (cloud_cover_mean / 10) - (european_aqi / 10)) AS uehi
  FROM
    environmental_factors
)
SELECT
  date,
  city,
  uehi
FROM
  uehi_calculation
ORDER BY
  date, city
