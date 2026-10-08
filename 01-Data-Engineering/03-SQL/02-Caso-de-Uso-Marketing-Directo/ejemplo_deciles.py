import pandas as pd
import numpy as np

# Ejemplo de datos
datos = [12, 45, 67, 23, 89, 34, 56, 78, 90, 11, 43, 65, 87, 32, 54, 76, 98, 21, 41, 63]

# Convertir a Serie de pandas
serie = pd.Series(datos)

# Calcular los deciles (del 10% al 90%)
deciles = [serie.quantile(q) for q in np.arange(0.1, 1.0, 0.1)]

# Mostrar los deciles
for i, decil in enumerate(deciles, start=1):
    print(f"Decil {i}: {decil:.2f}")


# In[ ]:


import pandas as pd
import numpy as np


# In[25]:


# Simulación de datos ficticios
np.random.seed(42)  # Para reproducibilidad
num_clientes = 1000

# Crear DataFrame con nómina simulada
clientes = pd.DataFrame({
    'cliente_id': range(1, num_clientes + 1),
    'nomina': np.random.normal(loc=3000, scale=800, size=num_clientes).round(2)  # Nómina mensual
})
# Simular contratación de seguro (probabilidad aleatoria)
clientes['seguro_contratado'] = np.random.choice([True, False], size=num_clientes)




# In[26]:


clientes.head(3)


# In[27]:


# Calcular deciles
clientes['decil'] = pd.qcut(clientes['nomina'], 10, labels=False) + 1  # Deciles del 1 al 10


# In[32]:


clientes.decil.value_counts()


# In[28]:


clientes.head(3)


# In[29]:


# Contar clientes con seguro por decil
seguros_por_decil = clientes.groupby('decil')['seguro_contratado'].sum()


# In[30]:


seguros_por_decil