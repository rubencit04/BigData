-- This file defines feature engineering transformations for Titanic.
-- It creates groups that are useful for SQL analytics and dashboards.

CREATE OR REFRESH MATERIALIZED VIEW titanic_features_pipeline_2026_04_29 AS
SELECT
    *,

    CASE
        WHEN age IS NULL THEN 'unknown'
        WHEN age < 13 THEN 'child'
        WHEN age < 18 THEN 'teenager'
        WHEN age < 35 THEN 'young_adult'
        WHEN age < 60 THEN 'adult'
        ELSE 'senior'
    END AS age_group,

    CASE
        WHEN fare IS NULL THEN 'unknown'
        WHEN fare = 0 THEN 'zero'
        WHEN fare < 10 THEN 'low'
        WHEN fare < 30 THEN 'medium'
        WHEN fare < 100 THEN 'high'
        ELSE 'very_high'
    END AS fare_group,

    siblings_spouses_aboard + parents_children_aboard + 1 AS family_size,

    CASE
        WHEN siblings_spouses_aboard + parents_children_aboard = 0 THEN 1
        ELSE 0
    END AS is_alone,

    CASE
        WHEN cabin IS NULL OR cabin = '' THEN 0
        ELSE 1
    END AS has_cabin,

    CASE
        WHEN cabin IS NULL OR cabin = '' THEN 'unknown'
        ELSE SUBSTRING(cabin, 1, 1)
    END AS deck,

    CASE
        WHEN embarked = 'S' THEN 'Southampton'
        WHEN embarked = 'C' THEN 'Cherbourg'
        WHEN embarked = 'Q' THEN 'Queenstown'
        ELSE 'unknown'
    END AS embarked_port,

    REGEXP_EXTRACT(passenger_name, ', ([^.]+)\\.', 1) AS passenger_title

FROM titanic_clean_pipeline_2026_04_29;
