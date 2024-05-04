-- models/check_null_counts.sql

WITH null_counts AS (
  SELECT
    COUNTIF(date IS NULL) AS null_date_count,
    COUNTIF(city IS NULL) AS null_city_id_count,
    COUNTIF(pm10 IS NULL) AS null_pm10_count,
    COUNTIF(pm2_5 IS NULL) AS null_pm2_5_count,
    COUNTIF(carbon_monoxide IS NULL) AS null_carbon_monoxide_count,
    COUNTIF(nitrogen_dioxide IS NULL) AS null_nitrogen_dioxide_count,
    COUNTIF(ozone IS NULL) AS null_ozone_count,
    COUNTIF(dust IS NULL) AS null_dust_count,
    COUNTIF(uv_index IS NULL) AS null_uv_index_count,
    COUNTIF(ammonia IS NULL) AS null_ammonia_count,
    COUNTIF(alder_pollen IS NULL) AS null_alder_pollen_count,
    COUNTIF(grass_pollen IS NULL) AS null_grass_pollen_count,
    COUNTIF(ragweed_pollen IS NULL) AS null_ragweed_pollen_count,
    COUNTIF(european_aqi IS NULL) AS null_european_aqi_count
  FROM `data-management-2-421815.weather_quality_climate.air_quality_data`
)

SELECT * FROM null_counts
