-- ==========================================================
-- 02) SELECCION Y ESTANDARIZACION DE COLUMNAS
-- ==========================================================
USE CATALOG nebrija;
USE SCHEMA etl_bank;

CREATE OR REPLACE TABLE bank_full_silver AS
SELECT
  CAST(age AS INT) AS age,
  CASE
    WHEN job IS NULL OR TRIM(job) = '' OR LOWER(TRIM(job)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(job))
  END AS job,
  CASE
    WHEN marital IS NULL OR TRIM(marital) = '' OR LOWER(TRIM(marital)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(marital))
  END AS marital,
  CASE
    WHEN education IS NULL OR TRIM(education) = '' OR LOWER(TRIM(education)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(education))
  END AS education,
  CAST(balance AS DOUBLE) AS balance,
  CASE
    WHEN housing IS NULL OR TRIM(housing) = '' OR LOWER(TRIM(housing)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(housing))
  END AS housing,
  CASE
    WHEN loan IS NULL OR TRIM(loan) = '' OR LOWER(TRIM(loan)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(loan))
  END AS loan,
  CASE
    WHEN contact IS NULL OR TRIM(contact) = '' OR LOWER(TRIM(contact)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(contact))
  END AS contact,
  CASE
    WHEN month IS NULL OR TRIM(month) = '' OR LOWER(TRIM(month)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(month))
  END AS month,
  CAST(campaign AS INT) AS campaign,
  CAST(pdays AS INT) AS pdays,
  CAST(previous AS INT) AS previous,
  CASE
    WHEN poutcome IS NULL OR TRIM(poutcome) = '' OR LOWER(TRIM(poutcome)) = 'unknown' THEN 'unknown'
    ELSE LOWER(TRIM(poutcome))
  END AS poutcome,
  CASE
    WHEN LOWER(TRIM(y)) = 'yes' THEN 1
    ELSE 0
  END AS y
FROM bank_full_bronze;
