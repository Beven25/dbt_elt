-- models/aqi_co_correlation.sql

SELECT
  CORR(carbon_monoxide, european_aqi) AS co_aqi_corr,
  CORR(nitrogen_dioxide,european_aqi) AS no2_aqi_corr,
  CORR(ozone, european_aqi) AS o3_aqi_corr,
  CORR(dust, european_aqi) AS dust_aqicorr
FROM {{ref("aq_transformed")}}