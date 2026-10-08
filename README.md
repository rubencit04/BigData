# 🚀 BigData: Ecosistema de Ingeniería y Ciencia de Datos

Este repositorio reúne los proyectos que he desarrollado durante el **Máster en Inteligencia Artificial y Big Data (Nebrija)** y abarca el ciclo de vida completo del dato: desde el modelado y la ingesta hasta el análisis, los modelos predictivos y los cuadros de mando.

Está organizado en cuatro pilares:

| Pilar | Qué contiene |
| --- | --- |
| 🏗️ [01-Data-Engineering](./01-Data-Engineering) | Python, SQL, MongoDB, EDA, outliers, calidad del dato, Hadoop, Kafka, Spark y Databricks |
| ☁️ [02-Cloud-Engineering](./02-Cloud-Engineering) | Google Cloud, Vertex AI y Gemini, enmascarado de datos personales |
| 🧪 [03-Data-Science](./03-Data-Science) | Machine Learning, series temporales, clustering, estadística, validación y explicabilidad |
| 📊 [04-Business-Intelligence](./04-Business-Intelligence) | Power BI, Power Query y Tableau |

> Los proyectos de Inteligencia Artificial (deep learning, LLMs, RAG, agentes, MCP y n8n) están en el repositorio [Inteligencia-Artificial](https://github.com/rubencit04/Inteligencia-Artificial).

---

## 🏗️ 1. Data Engineering

| Carpeta | Contenido |
| --- | --- |
| [01-Introduccion-al-Dato](./01-Data-Engineering/01-Introduccion-al-Dato) | Primera actividad de análisis de datos |
| [02-Python](./01-Data-Engineering/02-Python) | Fundamentos (estructuras, ficheros, JSON, Pandas), ejercicios y 50 ejercicios de repaso |
| [03-SQL](./01-Data-Engineering/03-SQL) | SQL básico con Pandas y un caso de uso de marketing directo con el dataset bancario |
| [04-MongoDB](./01-Data-Engineering/04-MongoDB) | Aggregation pipelines en MongoDB Atlas y mongomock |
| [05-Analisis-Exploratorio](./01-Data-Engineering/05-Analisis-Exploratorio) | Análisis exploratorio de datos (EDA) |
| [06-Outliers](./01-Data-Engineering/06-Outliers) | Detección y gestión de valores atípicos en datos empresariales |
| [07-Preprocesamiento-de-Texto](./01-Data-Engineering/07-Preprocesamiento-de-Texto) | Limpieza y normalización de texto |
| [08-Data-Quality](./01-Data-Engineering/08-Data-Quality) | Controles de calidad sobre una empresa ficticia (Nexora), controles AML y una plantilla reutilizable en Python |
| [09-Hadoop-y-Kafka](./01-Data-Engineering/09-Hadoop-y-Kafka) | WordCount con MapReduce, entorno con Docker Compose y un productor y consumidor de Kafka |
| [10-Spark](./01-Data-Engineering/10-Spark) | PySpark: ejercicios, funciones de ventana, JSON y SQL, y regresión sobre ETH-USDT |
| [11-Databricks](./01-Data-Engineering/11-Databricks) | Pipeline SQL por capas con Titanic, su dashboard y una ETL del dataset bancario |

## ☁️ 2. Cloud Engineering

| Carpeta | Contenido |
| --- | --- |
| [01-Vertex-AI-Gemini](./02-Cloud-Engineering/01-Vertex-AI-Gemini) | Prompting con Gemini (few-shot, chain-of-thought), meta-evaluación y control de tokens y costes |
| [02-Enmascarado-de-Datos-PII](./02-Cloud-Engineering/02-Enmascarado-de-Datos-PII) | Ofuscación de datos personales con expresiones regulares, pensada para cumplir el RGPD |

## 🧪 3. Data Science

| Carpeta | Contenido |
| --- | --- |
| [01-ML-desde-Cero](./03-Data-Science/01-ML-desde-Cero) | Perceptrón y descenso de gradiente implementados a mano |
| [02-Regresion-Lineal](./03-Data-Science/02-Regresion-Lineal) | Modelos de regresión |
| [03-Clasificacion-y-Metricas](./03-Data-Science/03-Clasificacion-y-Metricas) | Evaluación de clasificadores con métricas |
| [04-Arboles-de-Decision](./03-Data-Science/04-Arboles-de-Decision) | Árboles de decisión |
| [05-Random-Forest](./03-Data-Science/05-Random-Forest) | Random Forest |
| [06-Naive-Bayes](./03-Data-Science/06-Naive-Bayes) | Predicción con Naive Bayes |
| [07-SVM](./03-Data-Science/07-SVM) | Máquinas de soporte vectorial |
| [08-Ensambles](./03-Data-Science/08-Ensambles) | Comparativa de Bagging, AdaBoost y Gradient Boosting, y stacking |
| [09-Clustering](./03-Data-Science/09-Clustering) | K-Means, clustering jerárquico, TF-IDF, embeddings y actividades |
| [10-Series-Temporales](./03-Data-Science/10-Series-Temporales) | ARIMA y Prophet con datos de una cafetería y un gimnasio |
| [11-Deteccion-de-Anomalias](./03-Data-Science/11-Deteccion-de-Anomalias) | Algoritmos sobre datasets sintéticos y series temporales |
| [12-Grafos](./03-Data-Science/12-Grafos) | Análisis de relaciones entre clientes |
| [13-Estadistica](./03-Data-Science/13-Estadistica) | PCA, análisis de correspondencias y estadística descriptiva con R |
| [14-Validacion-y-Explicabilidad](./03-Data-Science/14-Validacion-y-Explicabilidad) | Deepchecks (datos, train/test y evaluación de modelos) y SHAP |
| [15-MLOps-MLflow](./03-Data-Science/15-MLOps-MLflow) | Seguimiento de experimentos con MLflow |
| [16-Proyecto-Cobertura-Forestal](./03-Data-Science/16-Proyecto-Cobertura-Forestal) | Proyecto completo: predicción de cobertura forestal con datos cartográficos |

## 📊 4. Business Intelligence

| Carpeta | Contenido |
| --- | --- |
| [01-Proyecto-Power-BI](./04-Business-Intelligence/01-Proyecto-Power-BI) | Cuadro de mando de una empresa con datos del ERP (facturas, cobros, clientes, empleados y servicios) y ventas proyectadas para 2026 |
| [02-Power-BI](./04-Business-Intelligence/02-Power-BI) | Informes de ventas globales y de estadísticas de LaLiga 2019/20 |
| [03-Power-Query](./04-Business-Intelligence/03-Power-Query) | Limpieza de datos y una cartera de acciones (Alphabet, Amazon, Apple, NVIDIA y Tesla) |
| [04-Tableau](./04-Business-Intelligence/04-Tableau) | Catálogo de Netflix y dataset SuperStore |

---

## 🛠️ Stack tecnológico

- **Lenguajes:** Python (Pandas, NumPy, scikit-learn, Matplotlib, Seaborn), SQL, R y SAS.
- **Big Data:** Hadoop, Kafka, Apache Spark (PySpark) y Databricks.
- **Bases de datos:** SQL (SQLite), MongoDB Atlas y SQL en Databricks.
- **Calidad y MLOps:** Deepchecks, SHAP y MLflow.
- **Cloud:** Google Cloud Platform y Vertex AI.
- **BI:** Power BI, Power Query (M) y Tableau.
- **Herramientas:** Jupyter, Docker y Git.
