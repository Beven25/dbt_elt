-- models/cities_with_good_air_quality.sql

WITH cities_with_good_air_quality AS (
  SELECT
    city
  FROM `data-management-2-421815.weather_quality_climate.air_quality_data`
  WHERE european_aqi < 50
  GROUP BY city
)

SELECT * FROM cities_with_good_air_quality
