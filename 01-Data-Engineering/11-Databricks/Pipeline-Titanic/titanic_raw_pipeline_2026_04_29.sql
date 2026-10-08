-- This file defines the raw Titanic ingestion transformation.
-- Replace ${titanic.source_path} with the path where you uploaded titanic.csv.
-- Example path: /Volumes/workspace/default/titanic_data/titanic.csv

CREATE OR REFRESH MATERIALIZED VIEW titanic_raw_pipeline_2026_04_29 AS
SELECT
    *
FROM read_files(
    '${titanic.source_path}',
    format => 'csv',
    header => true,
    inferSchema => true,
    delimiter => ','
);
