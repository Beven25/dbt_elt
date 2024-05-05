-- models/city_wise_air_quality_comparison.sql

SELECT
  city,
  AVG(carbon_monoxide) AS avg_co,
  AVG(nitrogen_dioxide) AS avg_no2,
  AVG(ozone) AS avg_o3,
  AVG(dust) AS avg_dust,
  AVG(uv_index) AS avg_uv_index
FROM {{ref("aq_transformed")}}
GROUP BY
  city
ORDER BY
  city
