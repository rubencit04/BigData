# Titanic SQL Pipeline for Databricks

These files are designed to be used in a Databricks SQL / Lakeflow Declarative Pipeline.

## Suggested order

1. `titanic_raw_pipeline_2026_04_29.sql`
2. `titanic_clean_pipeline_2026_04_29.sql`
3. `titanic_features_pipeline_2026_04_29.sql`
4. `titanic_survival_distribution_pipeline_2026_04_29.sql`
5. `titanic_survival_by_segment_pipeline_2026_04_29.sql`
6. `titanic_survival_by_family_fare_pipeline_2026_04_29.sql`
7. `titanic_survival_by_title_pipeline_2026_04_29.sql`
8. `titanic_data_quality_pipeline_2026_04_29.sql`

## Important

In `titanic_raw_pipeline_2026_04_29.sql`, replace:

`${titanic.source_path}`

with the real path of your uploaded `titanic.csv`.

Example:

`/Volumes/workspace/default/titanic_data/titanic.csv`

The CSV must contain these columns:

`PassengerId, Survived, Pclass, Name, Sex, Age, SibSp, Parch, Ticket, Fare, Cabin, Embarked`

## Main outputs

- `titanic_survival_distribution_pipeline_2026_04_29`
- `titanic_survival_by_segment_pipeline_2026_04_29`
- `titanic_survival_by_family_fare_pipeline_2026_04_29`
- `titanic_survival_by_title_pipeline_2026_04_29`
- `titanic_data_quality_pipeline_2026_04_29`
