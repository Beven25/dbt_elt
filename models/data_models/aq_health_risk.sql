-- models/aq_health_risks.sql

WITH daily_air_quality AS (
  SELECT
    date,
    city,
    carbon_monoxide,
    nitrogen_dioxide,
    ozone,
  FROM {{ref("aq_transformed")}}
  WHERE
    EXTRACT(YEAR FROM date) = EXTRACT(YEAR FROM CURRENT_DATE())
),
health_risk_assessment AS (
  SELECT
    date,
    city,
    carbon_monoxide,
    nitrogen_dioxide,
    ozone,
    CASE
      WHEN carbon_monoxide > 9 OR nitrogen_dioxide > 40 OR ozone > 100 THEN 'High Risk'
      WHEN carbon_monoxide > 6 OR nitrogen_dioxide > 20 OR ozone > 70 THEN 'Moderate Risk'
      ELSE 'Low Risk'
    END AS air_quality_category
  FROM
    daily_air_quality
)
SELECT
  date,
  city,
  carbon_monoxide,
  nitrogen_dioxide,
  ozone,
  air_quality_category
FROM
  health_risk_assessment
ORDER BY
  date, city
