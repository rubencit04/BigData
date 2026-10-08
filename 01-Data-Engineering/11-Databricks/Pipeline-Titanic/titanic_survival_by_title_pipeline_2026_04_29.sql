-- This file defines survival metrics by passenger title.
-- The title is extracted from the passenger name, for example Mr, Mrs, Miss or Master.

CREATE OR REFRESH MATERIALIZED VIEW titanic_survival_by_title_pipeline_2026_04_29 AS
SELECT
    passenger_title,
    COUNT(*) AS passenger_count,
    SUM(survived) AS survived_count,
    COUNT(*) - SUM(survived) AS not_survived_count,
    ROUND(AVG(survived), 4) AS survival_rate,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(fare), 2) AS avg_fare
FROM titanic_features_pipeline_2026_04_29
GROUP BY passenger_title
HAVING COUNT(*) >= 2;
