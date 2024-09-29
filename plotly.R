setwd("~/Talent Tech")

#install.packages("plotly")

library(plotly)
library(repmis)
source_data("https://github.com/hllinas/DatosPublicos/blob/main/Estudiantes.Rdata?raw=false")
Estudiantes
head(Estudiantes)

# Paso 1: Seleccionar las columnas "Sexo" y "Fuma"
datos_filtrados <- Estudiantes[, c("Sexo", "Fuma")]

# Paso 2: Crear una tabla de frecuencias
tabla_frecuencia <- as.data.frame(table(datos_filtrados$Sexo, datos_filtrados$Fuma))

# Renombrar las columnas de la tabla para facilitar el manejo
colnames(tabla_frecuencia) <- c("Sexo", "Fuma", "Frecuencia")

# Paso 3: Crear gráfico de barras apiladas o agrupadas con plotly
fig <- plot_ly(
  data = tabla_frecuencia, 
  x = ~Sexo, 
  y = ~Frecuencia, 
  color = ~Fuma,  # Usamos color para diferenciar "No" y "Si" en la variable "Fuma"
  type = "bar"
) %>%
  layout(
    barmode = "stack",  # Usar "stack" para apilar las barras o "group" para agruparlas
    title = "Distribución de Fumadores por Sexo",
    yaxis = list(title = "Frecuencia"),
    xaxis = list(title = "Sexo")
  )

#Mostrar el grafico
fig


# Convertir las columnas Edad e Ingreso a numéricas si es necesario
datos_filtrados <- Estudiantes
datos_filtrados$Edad <- as.numeric(as.character(datos_filtrados$Edad))
datos_filtrados$Ingreso <- as.numeric(as.character(datos_filtrados$Ingreso))

# Crear el gráfico de dispersión
fig <- plot_ly(
  data = datos_filtrados, 
  x = ~Edad, 
  y = ~Ingreso, 
  type = "scatter",  # Definir el tipo de gráfico como de dispersión
  mode = "markers",  # Mostrar solo los puntos
  marker = list(color = 'blue')  # Cambiar color de los puntos si deseas
)

# Añadir títulos y etiquetas
fig <- fig %>%
  layout(
    title = "Relación entre Edad e Ingreso",
    xaxis = list(title = "Edad (años)"),
    yaxis = list(title = "Ingreso")
  )

# Mostrar el gráfico
fig

