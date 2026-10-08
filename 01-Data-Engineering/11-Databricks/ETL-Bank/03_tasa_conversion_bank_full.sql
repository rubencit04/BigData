-- ==========================================================
-- 03) TASA DE CONVERSION POR VARIABLE
-- Variables: job, education, balance_segment, contact, month
-- ==========================================================
USE CATALOG nebrija;
USE SCHEMA etl_bank;

CREATE OR REPLACE TEMP VIEW bank_full_conversion_base AS
SELECT
  job,
  education,
  contact,
  month,
  y,
  CASE
    WHEN balance < 0 THEN 'negative'
    WHEN balance BETWEEN 0 AND 999 THEN '0_999'
    WHEN balance BETWEEN 1000 AND 4999 THEN '1000_4999'
    ELSE '5000_plus'
  END AS balance_segment
FROM bank_full_silver;

CREATE OR REPLACE TABLE bank_full_conversion_metrics AS
SELECT
  variable,
  category_value,
  COUNT(*) AS total_clientes,
  SUM(y) AS clientes_convertidos,
  ROUND(SUM(y) / COUNT(*), 4) AS tasa_conversion
FROM (
  SELECT 'job' AS variable, job AS category_value, y FROM bank_full_conversion_base
  UNION ALL
  SELECT 'education' AS variable, education AS category_value, y FROM bank_full_conversion_base
  UNION ALL
  SELECT 'balance_segment' AS variable, balance_segment AS category_value, y FROM bank_full_conversion_base
  UNION ALL
  SELECT 'contact' AS variable, contact AS category_value, y FROM bank_full_conversion_base
  UNION ALL
  SELECT 'month' AS variable, month AS category_value, y FROM bank_full_conversion_base
) src
GROUP BY variable, category_value
ORDER BY variable, tasa_conversion DESC, total_clientes DESC;

-- Consulta final de resultados
SELECT * FROM bank_full_conversion_metrics;
