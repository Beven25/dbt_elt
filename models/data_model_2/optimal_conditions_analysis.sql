-- models/optimal_conditions_analysis.sql

WITH weather_conditions AS (
  SELECT
    city,
    EXTRACT(MONTH FROM date) AS month,
    AVG(temperature_2m) AS avg_temperature,
    AVG(relative_humidity_2m) AS avg_relative_humidity,
    AVG(precipitation) AS avg_precipitation
  FROM {{ref("weather_transformed")}}
  GROUP BY
    city,
    month
),
air_quality_conditions AS (
  SELECT
    city,
    EXTRACT(MONTH FROM date) AS month,
    AVG(pm10) AS avg_pm10,
    AVG(pm2_5) AS avg_pm2_5,
    AVG(ozone) AS avg_ozone
  FROM {{ref("aq_transformed")}}
  GROUP BY
    city,
    month
)
SELECT
  'Weather' AS condition_type,
  city,
  month,
  avg_temperature,
  avg_relative_humidity,
  avg_precipitation
FROM
  weather_conditions
WHERE
  avg_temperature > 15 -- Example criteria for "good" weather

UNION ALL

SELECT
  'Air Quality' AS condition_type,
  city,
  month,
  avg_pm10,
  avg_pm2_5,
  avg_ozone
FROM
  air_quality_conditions
WHERE
  avg_pm10 < 20 -- Example criteria for "good" air quality
  AND avg_pm2_5 < 10
  AND avg_ozone < 50
ORDER BY
  city,
  month
