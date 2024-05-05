SELECT
    EXTRACT(YEAR FROM d.date) AS year,
    EXTRACT(MONTH FROM d.date) AS month,
    d.city,
    MAX(f.temperature_2m) AS max_temperature,
    MIN(f.temperature_2m) AS min_temperature,
    MAX(f.precipitation) AS max_precipitation,
    MAX(f.wind_speed_10m) AS max_wind_speed
FROM {{ref("date_dimension")}} d
JOIN
    {{ref("env_facts_table")}} f ON d.date = f.date AND d.city = f.city
GROUP BY
    year, month, d.city
ORDER BY
    year, month, d.city
