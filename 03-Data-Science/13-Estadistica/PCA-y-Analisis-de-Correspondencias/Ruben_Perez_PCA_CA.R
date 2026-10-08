# Limpiar gráficos antiguos
graphics.off()

# Instalación y carga de librerías
if(!require(bpca)) install.packages("bpca")
if(!require(ca)) install.packages("ca")

library(bpca)
library(ca)

# ==============================================================================
# EJERCICIO 3: PCA sobre datos 'gabriel1971'
# ==============================================================================
cat("\n--- EJERCICIO 3: gabriel1971 ---\n")

# Cargar datos
data(gabriel1971)

# PCA (Estandarizado)
pca_gabriel <- prcomp(gabriel1971, scale = TRUE)

print(summary(pca_gabriel)) 

# Biplot
biplot(pca_gabriel, main = "Biplot: Gabriel1971 (Jerusalén)", cex = 0.7)

# ==============================================================================
# EJERCICIO 4: CA sobre datos 'HairEyeColor'
# ==============================================================================
cat("\n--- EJERCICIO 4: HairEyeColor ---\n")

data(HairEyeColor)
tabla_hombres <- HairEyeColor[,,1]
tabla_mujeres <- HairEyeColor[,,2]
tabla_global  <- tabla_hombres + tabla_mujeres 

# CA GLOBAL
ca_global <- ca(tabla_global)
plot(ca_global, main = "CA Global: Pelo vs Ojos")

# CA HOMBRES
ca_hombres <- ca(tabla_hombres)
plot(ca_hombres, main = "CA Hombres")

# CA MUJERES
ca_mujeres <- ca(tabla_mujeres)
plot(ca_mujeres, main = "CA Mujeres")

# ==============================================================================
# EJERCICIO 5 (OPCIONAL): PCA y CA con datos propios
# ==============================================================================
cat("\n--- EJERCICIO 5: Opcional ---\n")

# --- A) PCA sobre 'mtcars' ---
data(mtcars)
pca_coches <- prcomp(mtcars, scale = TRUE)
biplot(pca_coches, main = "PCA Opcional: mtcars (Coches)")

# --- B) CA sobre 'Encuesta Móviles' (Datos Generados) ---
# Matriz 3x3 manual
datos_moviles <- matrix(c(50, 20, 10,  # Jovenes
                          30, 45, 25,  # Adultos
                          10, 30, 60), # Mayores
                        nrow = 3, byrow = TRUE)

rownames(datos_moviles) <- c("Jovenes", "Adultos", "Mayores")
colnames(datos_moviles) <- c("Apple", "Samsung", "Huawei")

# Ejecutar CA
ca_moviles <- ca(datos_moviles)
plot(ca_moviles, main = "CA Opcional: Edad vs Marca Móvil")