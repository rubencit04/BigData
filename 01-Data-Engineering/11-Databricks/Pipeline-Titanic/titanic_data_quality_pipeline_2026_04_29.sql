-- This file defines basic data quality checks for Titanic.
-- Each row is a check with PASS, FAIL or INFO status.

CREATE OR REFRESH MATERIALIZED VIEW titanic_data_quality_pipeline_2026_04_29 AS

SELECT
    'raw_table_has_rows' AS check_name,
    CASE WHEN COUNT(*) > 0 THEN 'PASS' ELSE 'FAIL' END AS status,
    COUNT(*) AS observed_value
FROM titanic_raw_pipeline_2026_04_29

UNION ALL

SELECT
    'clean_table_has_rows' AS check_name,
    CASE WHEN COUNT(*) > 0 THEN 'PASS' ELSE 'FAIL' END AS status,
    COUNT(*) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'passenger_id_is_unique' AS check_name,
    CASE
        WHEN COUNT(*) = COUNT(DISTINCT passenger_id) THEN 'PASS'
        ELSE 'FAIL'
    END AS status,
    COUNT(*) - COUNT(DISTINCT passenger_id) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'survived_values_are_valid' AS check_name,
    CASE
        WHEN SUM(CASE WHEN survived NOT IN (0, 1) OR survived IS NULL THEN 1 ELSE 0 END) = 0
        THEN 'PASS'
        ELSE 'FAIL'
    END AS status,
    SUM(CASE WHEN survived NOT IN (0, 1) OR survived IS NULL THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'passenger_class_values_are_valid' AS check_name,
    CASE
        WHEN SUM(CASE WHEN passenger_class NOT IN (1, 2, 3) OR passenger_class IS NULL THEN 1 ELSE 0 END) = 0
        THEN 'PASS'
        ELSE 'FAIL'
    END AS status,
    SUM(CASE WHEN passenger_class NOT IN (1, 2, 3) OR passenger_class IS NULL THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'sex_values_are_valid' AS check_name,
    CASE
        WHEN SUM(CASE WHEN sex NOT IN ('male', 'female') OR sex IS NULL THEN 1 ELSE 0 END) = 0
        THEN 'PASS'
        ELSE 'FAIL'
    END AS status,
    SUM(CASE WHEN sex NOT IN ('male', 'female') OR sex IS NULL THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'fare_is_non_negative' AS check_name,
    CASE
        WHEN SUM(CASE WHEN fare < 0 THEN 1 ELSE 0 END) = 0
        THEN 'PASS'
        ELSE 'FAIL'
    END AS status,
    SUM(CASE WHEN fare < 0 THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'age_missing_count' AS check_name,
    'INFO' AS status,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29

UNION ALL

SELECT
    'cabin_missing_count' AS check_name,
    'INFO' AS status,
    SUM(CASE WHEN cabin IS NULL OR cabin = '' THEN 1 ELSE 0 END) AS observed_value
FROM titanic_clean_pipeline_2026_04_29;
