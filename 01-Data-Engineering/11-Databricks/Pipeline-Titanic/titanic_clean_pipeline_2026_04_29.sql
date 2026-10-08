-- This file defines a cleaned Titanic transformation.
-- It standardizes data types and creates readable survival labels.

CREATE OR REFRESH MATERIALIZED VIEW titanic_clean_pipeline_2026_04_29 AS
SELECT DISTINCT
    CAST(`PassengerId` AS INT) AS passenger_id,
    CAST(`Survived` AS INT) AS survived,
    CASE
        WHEN CAST(`Survived` AS INT) = 1 THEN 'survived'
        WHEN CAST(`Survived` AS INT) = 0 THEN 'not_survived'
        ELSE 'unknown'
    END AS survival_status,
    CAST(`Pclass` AS INT) AS passenger_class,
    `Name` AS passenger_name,
    `Sex` AS sex,
    CAST(`Age` AS DOUBLE) AS age,
    CAST(`SibSp` AS INT) AS siblings_spouses_aboard,
    CAST(`Parch` AS INT) AS parents_children_aboard,
    `Ticket` AS ticket,
    CAST(`Fare` AS DOUBLE) AS fare,
    `Cabin` AS cabin,
    `Embarked` AS embarked
FROM titanic_raw_pipeline_2026_04_29
WHERE `PassengerId` IS NOT NULL
  AND `Survived` IS NOT NULL
  AND `Pclass` IS NOT NULL;
