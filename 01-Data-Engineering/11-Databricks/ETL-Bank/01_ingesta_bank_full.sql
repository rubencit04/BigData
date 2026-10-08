-- ==========================================================
-- 01) INGESTA DEL DATASET bank-full.csv EN DATABRICKS
-- ==========================================================
-- Ajusta catalog/schema/volume según tu entorno.

CREATE CATALOG IF NOT EXISTS nebrija;
USE CATALOG nebrija;

CREATE SCHEMA IF NOT EXISTS etl_bank;
USE SCHEMA etl_bank;

CREATE VOLUME IF NOT EXISTS bank_volume;

-- Se asume que el archivo ya está cargado en:
-- /Volumes/nebrija/etl_bank/bank_volume/bank-full.csv
-- (si no está, súbelo primero al volumen).

CREATE OR REPLACE TABLE bank_full_bronze
USING CSV
OPTIONS (
  header 'true',
  sep ';',
  inferSchema 'true'
)
LOCATION '/Volumes/nebrija/etl_bank/bank_volume/bank-full.csv';
