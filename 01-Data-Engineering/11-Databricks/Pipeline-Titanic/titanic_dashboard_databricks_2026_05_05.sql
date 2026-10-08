-- Databricks Dashboard queries (post-ETL)
-- Source views:
-- - titanic_survival_distribution_pipeline_2026_04_29
-- - titanic_survival_by_segment_pipeline_2026_04_29
-- - titanic_survival_by_family_fare_pipeline_2026_04_29
-- - titanic_survival_by_title_pipeline_2026_04_29
-- - titanic_features_pipeline_2026_04_29
-- - titanic_data_quality_pipeline_2026_04_29

-- =========================================================
-- Plot 1: Counter (KPI)
-- Title: Overall Survival Rate
-- Visualization: Counter
-- =========================================================
SELECT
  ROUND(AVG(survived) * 100, 2) AS survival_rate_pct
FROM titanic_features_pipeline_2026_04_29;

-- =========================================================
-- Plot 2: Counter (KPI)
-- Title: Total Passengers
-- Visualization: Counter
-- =========================================================
SELECT
  COUNT(*) AS total_passengers
FROM titanic_features_pipeline_2026_04_29;

-- =========================================================
-- Plot 3: Bar
-- Title: Survival Rate by Passenger Class
-- Visualization: Bar
-- X: passenger_class
-- Y: survival_rate_pct
-- =========================================================
SELECT
  passenger_class,
  ROUND(AVG(survived) * 100, 2) AS survival_rate_pct,
  COUNT(*) AS passenger_count
FROM titanic_features_pipeline_2026_04_29
GROUP BY passenger_class
ORDER BY passenger_class;

-- =========================================================
-- Plot 4: Combo (bar + line)
-- Title: Survival and Volume by Age Group
-- Visualization: Combo
-- X: age_group
-- Bar Y: passenger_count
-- Line Y: survival_rate_pct
-- =========================================================
SELECT
  CASE age_group
    WHEN 'child' THEN 1
    WHEN 'teenager' THEN 2
    WHEN 'young_adult' THEN 3
    WHEN 'adult' THEN 4
    WHEN 'senior' THEN 5
    ELSE 6
  END AS age_group_order,
  age_group,
  COUNT(*) AS passenger_count,
  ROUND(AVG(survived) * 100, 2) AS survival_rate_pct
FROM titanic_features_pipeline_2026_04_29
GROUP BY age_group
ORDER BY age_group_order;

-- =========================================================
-- Plot 5: Box
-- Title: Fare Distribution by Survival Status
-- Visualization: Box
-- X: survival_status
-- Y: fare
-- =========================================================
SELECT
  survival_status,
  fare
FROM titanic_features_pipeline_2026_04_29
WHERE fare IS NOT NULL
  AND fare >= 0;

-- =========================================================
-- Plot 6: Area
-- Title: Passenger Share by Fare Group
-- Visualization: Area
-- X: fare_group_order (or fare_group)
-- Y: passenger_percentage
-- =========================================================
WITH totals AS (
  SELECT COUNT(*) AS total_count
  FROM titanic_features_pipeline_2026_04_29
)
SELECT
  CASE fare_group
    WHEN 'zero' THEN 1
    WHEN 'low' THEN 2
    WHEN 'medium' THEN 3
    WHEN 'high' THEN 4
    WHEN 'very_high' THEN 5
    ELSE 6
  END AS fare_group_order,
  fare_group,
  COUNT(*) AS passenger_count,
  ROUND(COUNT(*) * 100.0 / totals.total_count, 2) AS passenger_percentage
FROM titanic_features_pipeline_2026_04_29
CROSS JOIN totals
GROUP BY fare_group, totals.total_count
ORDER BY fare_group_order;

-- =========================================================
-- Optional QA table widget
-- Title: Data Quality Checks
-- Visualization: Table
-- =========================================================
SELECT
  check_name,
  status,
  observed_value
FROM titanic_data_quality_pipeline_2026_04_29
ORDER BY
  CASE status
    WHEN 'FAIL' THEN 1
    WHEN 'INFO' THEN 2
    ELSE 3
  END,
  check_name;
