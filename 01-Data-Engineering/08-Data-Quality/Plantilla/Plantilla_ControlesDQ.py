import pandas as pd
import sqlite3
from datetime import datetime


###### CARGA DE DATOS ######

ruta = r"TU RUTA DEL FICHERO"
ruta_salida = r"TU RUTA DEL FICHERO DE SALIDA"


df_facturas = pd.read_excel(ruta, sheet_name='Facturas')

# Seguir con el resto de hojas...




###### CREAR BASE DE DATOS ######

conn = sqlite3.connect(":memory:")

df_facturas.to_sql("Facturas", conn, index=False, if_exists="replace")

# Seguir con el resto de dataframes...






###### DEFINICIÓN DE CONTROLES ######

controles = {

    
    ### NIVEL 1
       
    "DQ00001": """
        SELECT COUNT(*) as errores 
        FROM Facturas
        WHERE CodFactura IS NULL
    """,

    # Seguimos con el resto de controles de nivel 1...







    
    ### NIVEL 2
    
    "DQ00020": """
        SELECT COUNT(*) 
        FROM Facturas
        WHERE FechaFactura > FechaVencimiento
    """,

    # Seguimos con el resto de controles de nivel 2...









    ### NIVEL 3
    
    "DQ00023": """
        SELECT  
        FROM 
        WHERE
    """,

    # Seguimos con el resto de controles de nivel 3...






    
    ### NIVEL 4 

    "DQ00030": """
        SELECT
        WHERE
        FROM
    """,

    # Seguimos con el resto de controles de nivel 4...







    #### EL ÚLTIMO CONTROL NO LLEVA COMA AL FINAL ####
}



###### EJECUCIÓN DE CONTROLES ######


resultados = []

for nombre, query in controles.items():
    try:
        errores = pd.read_sql(query, conn).iloc[0,0]
    except:
        errores = None

    resultados.append({
        "control": nombre,
        "errores": errores
    })


df_resultados = pd.DataFrame(resultados)

df_resultados["estado"] = df_resultados["errores"].apply(lambda x: "OK" if x == 0 else "KO")



###### RESULTADOS ######

print(df_resultados)

df_resultados.to_excel(ruta_salida, index=False)

print(f"Resultados exportados a: {ruta_salida}")