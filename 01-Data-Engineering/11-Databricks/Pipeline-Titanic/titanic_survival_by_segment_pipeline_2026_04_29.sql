-- This file defines segment-level survival metrics.
-- It can be used to compare survival rates by class, sex, age group and embarked port.

CREATE OR REFRESH MATERIALIZED VIEW titanic_survival_by_segment_pipeline_2026_04_29 AS
SELECT
    passenger_class,
    sex,
    age_group,
    embarked_port,
    COUNT(*) AS passenger_count,
    SUM(survived) AS survived_count,
    COUNT(*) - SUM(survived) AS not_survived_count,
    ROUND(AVG(survived), 4) AS survival_rate,
    ROUND(AVG(age), 2) AS avg_age,
    ROUND(AVG(fare), 2) AS avg_fare
FROM titanic_features_pipeline_2026_04_29
GROUP BY
    passenger_class,
    sex,
    age_group,
    embarked_port;
