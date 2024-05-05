WITH humidity_and_air_quality AS (
  SELECT
    relative_humidity_2m,
    AVG(pm10) AS avg_pm10,
    AVG(pm2_5) AS avg_pm2_5,
    AVG(ozone) AS avg_ozone
  FROM {{ref("weather_airquality_impact")}}
  GROUP BY relative_humidity_2m
)
SELECT
  relative_humidity_2m,
  CORR(relative_humidity_2m, avg_pm10) AS correlation_pm10,
  CORR(relative_humidity_2m, avg_pm2_5) AS correlation_pm2_5,
  CORR(relative_humidity_2m, avg_ozone) AS correlation_ozone
FROM humidity_and_air_quality
GROUP BY relative_humidity_2m
