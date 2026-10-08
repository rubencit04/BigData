-- This file defines a survival distribution aggregation.
-- It shows how many passengers survived and did not survive.

CREATE OR REFRESH MATERIALIZED VIEW titanic_survival_distribution_pipeline_2026_04_29 AS
WITH total_rows AS (
    SELECT COUNT(*) AS total_count
    FROM titanic_features_pipeline_2026_04_29
)
SELECT
    survived,
    survival_status,
    COUNT(*) AS passenger_count,
    ROUND(COUNT(*) * 100.0 / total_rows.total_count, 2) AS passenger_percentage
FROM titanic_features_pipeline_2026_04_29
CROSS JOIN total_rows
GROUP BY survived, survival_status, total_rows.total_count;
