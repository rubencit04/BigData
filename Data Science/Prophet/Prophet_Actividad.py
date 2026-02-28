# pip install yfinance prophet matplotlib

import yfinance as yf
import pandas as pd
from prophet import Prophet
import matplotlib.pyplot as plt

# -----------------------------------------------------------------------------
# 1. BAJAR DATOS DEL ORO (GC=F)
# -----------------------------------------------------------------------------
# 'GC=F' es el símbolo de los Futuros del Oro en Yahoo Finance
activo = "GC=F" 
print(f"Descargando datos históricos para {activo} (Oro)...")

# Bajamos datos desde 2020 para pillar bien la tendencia alcista reciente
data = yf.download(activo, start="2020-01-01", end="2025-12-31")

# PREPARACIÓN CON PANDAS (Obligatorio para Prophet)
df = data.reset_index()               # Sacamos la fecha del índice
df = df[['Date', 'Close']]            # Nos quedamos con Fecha y Cierre
df.columns = ['ds', 'y']              # Renombramos a 'ds' y 'y'

# Limpiamos la zona horaria para evitar warnings
df['ds'] = pd.to_datetime(df['ds']).dt.tz_localize(None)

# -----------------------------------------------------------------------------
# 2. ENTRENAMIENTO Y PREDICCIÓN CON PROPHET
# -----------------------------------------------------------------------------
print("Entrenando el modelo con la tendencia del Oro...")

# Activamos la estacionalidad diaria en False (es cierre diario) 
# y dejamos True la anual/semanal para ver patrones cíclicos.
m = Prophet(daily_seasonality=False, yearly_seasonality=True, weekly_seasonality=True)
m.fit(df)

# Predecimos 180 días (6 meses) a futuro para ver si rompe máximos
future = m.make_future_dataframe(periods=180)

# Filtramos los fines de semana (el mercado de futuros cierra sáb/dom)
future = future[future['ds'].dt.dayofweek < 5]

forecast = m.predict(future)

# Mostramos los números de los últimos 5 días predichos
print("Predicción final (últimos 5 días):")
print(forecast[['ds', 'yhat', 'yhat_lower', 'yhat_upper']].tail())

# -----------------------------------------------------------------------------
# 3. MOSTRAR EL GRÁFICO
# -----------------------------------------------------------------------------
print("Generando gráfico...")

# Gráfico principal
fig1 = m.plot(forecast)
plt.title(f"Predicción del Oro ({activo}) - ¿Seguirán los máximos?")
plt.xlabel("Fecha")
plt.ylabel("Precio (USD)")
plt.show()

# Gráfico de componentes (para ver en qué meses suele subir el oro)
fig2 = m.plot_components(forecast)
plt.show()