-- models/extreme_weather.sql

SELECT 
  date,
  city,
  temperature_2m,
  relative_humidity_2m,
  precipitation,
  wind_speed_10m,
  pm10,
  pm2_5,
  ozone
FROM 
  {{ref("weather_airquality_impact")}}
WHERE 
  temperature_2m > (SELECT APPROX_QUANTILES(temperature_2m, 100)[OFFSET(95)] FROM {{ref("weather_airquality_impact")}})
  OR precipitation > (SELECT APPROX_QUANTILES(precipitation, 100)[OFFSET(95)] FROM {{ref("weather_airquality_impact")}})
  OR wind_speed_10m > (SELECT APPROX_QUANTILES(wind_speed_10m, 100)[OFFSET(95)] FROM {{ref("weather_airquality_impact")}})
