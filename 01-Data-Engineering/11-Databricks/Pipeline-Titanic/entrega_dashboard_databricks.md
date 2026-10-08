# Entrega ejercicio Databricks Dashboard (ETL Titanic)

## Objetivo cumplido
Después de ejecutar el ETL, se ha creado un Dashboard con **al menos 4 plots** usando estos tipos:
- Counter
- Bar
- Combo
- Box
- Area

Las consultas están en:
`titanic_dashboard_databricks_2026_05_05.sql`

## Dashboard mínimo (4 plots obligatorios)

### 1) Counter: Overall Survival Rate
- Query: bloque `Plot 1`
- Visualización: `Counter`
- Campo: `survival_rate_pct`

### 2) Bar: Survival Rate by Passenger Class
- Query: bloque `Plot 3`
- Visualización: `Bar`
- Eje X: `passenger_class`
- Eje Y: `survival_rate_pct`

### 3) Combo: Survival and Volume by Age Group
- Query: bloque `Plot 4`
- Visualización: `Combo`
- Eje X: `age_group`
- Barras: `passenger_count`
- Línea: `survival_rate_pct`

### 4) Box: Fare Distribution by Survival Status
- Query: bloque `Plot 5`
- Visualización: `Box`
- Categoría: `survival_status`
- Valor: `fare`

## Extras (si quieres más nota)
- `Plot 2`: Counter de pasajeros totales
- `Plot 6`: Area de distribución por `fare_group`
- Tabla QA: estado de calidad de datos

## Pasos exactos en Databricks
1. Ejecuta el ETL completo (views materializadas del pipeline Titanic).
2. Abre Databricks SQL y crea una query por cada bloque (Plot 1, 3, 4 y 5 como mínimo).
3. En cada resultado selecciona `Add visualization` y el tipo correspondiente.
4. Pulsa `Add to dashboard` y crea un dashboard llamado `Titanic ETL Dashboard`.
5. Organiza los widgets en una sola página y guarda.

## Evidencia recomendada para entregar
- Captura del dashboard completo.
- Captura de una visualización `Counter`.
- Captura de una visualización `Bar` o `Combo`.
- Captura de una visualización `Box`.
