-- This file defines survival metrics by family and fare profile.
-- It helps analyze whether travelling alone or paying a higher fare was associated with survival.

CREATE OR REFRESH MATERIALIZED VIEW titanic_survival_by_family_fare_pipeline_2026_04_29 AS
SELECT
    CASE
        WHEN family_size = 1 THEN 'alone'
        WHEN family_size <= 4 THEN 'small_family'
        ELSE 'large_family'
    END AS family_group,
    fare_group,
    has_cabin,
    COUNT(*) AS passenger_count,
    SUM(survived) AS survived_count,
    COUNT(*) - SUM(survived) AS not_survived_count,
    ROUND(AVG(survived), 4) AS survival_rate,
    ROUND(AVG(fare), 2) AS avg_fare,
    ROUND(AVG(family_size), 2) AS avg_family_size
FROM titanic_features_pipeline_2026_04_29
GROUP BY
    CASE
        WHEN family_size = 1 THEN 'alone'
        WHEN family_size <= 4 THEN 'small_family'
        ELSE 'large_family'
    END,
    fare_group,
    has_cabin;
