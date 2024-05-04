-- models/air_quality_summary.sql

WITH summary_stats AS (
  SELECT
    AVG(pm10) AS avg_pm10,
    AVG(pm2_5) AS avg_pm2_5,
    MAX(carbon_monoxide) AS max_carbon_monoxide,
    MAX(nitrogen_dioxide) AS max_nitrogen_dioxide
  FROM `data-management-2-421815.dbt_elt.air_quality`
)

-- Select summary statistics
SELECT * FROM summary_stats
