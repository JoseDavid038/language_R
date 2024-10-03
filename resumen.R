setwd("~/Talent Tech")
library(repmis)
source_data("https://github.com/hllinas/DatosPublicos/blob/main/Estudiantes.Rdata?raw=false")
View(Estudiantes)

#La función cbind() en R sirve para combinar vectores, matrices o data frames por columnas
# Ejemplo 1. creo un dataframe.

dataframe <- data.frame(edad = c(25,30,22), estatura = c(1.75, 1.80, 1.68))

# creo el vector que voy a agregar al dataframe.
peso <- c(65, 70, 85)

#Añado el vector al dataframe.
dataframe_modificado <- cbind(dataframe, peso)
print(dataframe)
print(dataframe_modificado)

#La función rbind() en R se utiliza para combinar vectores, matrices o data frames por filas

nueva_fila <-c(39, 1.67, 65)
dataframe_modificado_2 <- rbind(dataframe_modificado, nueva_fila)
print(dataframe_modificado)
print(dataframe_modificado_2)

#Unir 2 dataframe por filas. 
nuevo_dataframe <- rbind(dataframe_modificado, dataframe_modificado_2)
print(nuevo_dataframe)

#Función agregación 
#calculamos la media de las edades en los hombres y en las mujeres
#primero casteamos la edad a numerico
Estudiantes$Edad <- as.numeric(as.character(Estudiantes$Edad))
aggregate(Edad ~ Sexo, Estudiantes, mean)

#Desviación estandar
sd(Estudiantes$Edad)

#varianza
var(Estudiantes$Edad)

#Resumen
summary(Estudiantes)

#casteo a numerico la columna Definitiva de notas y vuelvo a generar el resumen
Estudiantes$Definitiva <- as.numeric(as.character(Estudiantes$Definitiva))
summary(Estudiantes)

#min
min(Estudiantes$Definitiva)
#max
max(Estudiantes$Definitiva)

#cuantil
quantile(Estudiantes$Definitiva)


#Crear nnumeros aleatorios con distribucion normal
distribucion_normal <- rnorm(100, mean = 0, sd = 1)
hist(distribucion_normal)

#vector
vector1 <- c(4,6,7)
vector1

#matriz
max1 <- matrix(1:9, nrow = 3, ncol = 3)
max1

#dataframe
dataframe_creado <- data.frame(Edad = c(25,30,35), Peso = c(70,76,80))
dataframe_creado

#info del dataframe
#numero de filas y columnas
dim(dataframe_creado)

#numero de filas
nrow(dataframe_creado)

#numero de columnas
ncol(dataframe_creado)


#longitud de vectores
length(vector1)

#sumar por filas en una matriz
max1
apply(max1, 1, sum)
apply(max1, 1, mean)

#cual nota es mayor a 4.5, me da la posicion y con este dato puedo realizar varias operaciones
#entre ellas reemplazos de informacion.
Estudiantes$Definitiva
posiciones = which(Estudiantes$Definitiva > 4.5)
posiciones

#Me devuelve los valores que estan en la posicion previamente mostrada y que 
#cummplieron la condicion
Estudiantes[which(Estudiantes$Definitiva > 4.5), "Definitiva"]

#Valores unicos
unique(Estudiantes$Definitiva)

#ordenar
vector2 <- c(3,5,6,8,2)
vector2
vector_ordenado <- sort(vector2)
vector_ordenado

#primeras y ultimas 5 filas del dataframe
head(Estudiantes)
tail(Estudiantes)

#Libreria para manipulacion de dataframe
library(dplyr)

#funciones de esta libreria.

#selecciona columnas
#selecciona las dos primeras columnas del dataset mtcars incluido en R.
mtcars %>%
  select(mpg, cyl)

#opcion sin usar la libreria
mtcars[,c("mpg","cyl")]


#Filtra filas segun condiciones
#autos que tienen mas de 6 cilindros
mtcars %>%
  filter(cyl > 6)
#otra forma
mtcars[mtcars$cyl > 6,]

#crea nuevas columnas
#convierto de libras a toneladas
mtcars %>%
  mutate(peso_ton = wt * 0.453592)
#otra forma sin libreria
peso_ton = mtcars[,"wt"]*0.453592
cbind(mtcars, peso_ton)

#ordenas las filas
#ordenar por millas por galon (mpg) en orden ascendente
mtcars %>%
  arrange(mpg)

#ordenar por millas por galon (mpg) en orden ascendente
mtcars %>%
  arrange(desc(mpg))

#resume datos
#media de millas por galon (mpg)
mtcars %>%
  summarize(media_mpg = mean(mpg))

#multiples estadisticas
mtcars %>%
  summarize(media_mpg = mean(mpg), max_hp = max(hp))

#agrupa datos
#Calcular la media de las millas por galon agrupado por numero de cilindros
mtcars %>%
  group_by(cyl) %>%
  summarize(media_mpg = mean(mpg))

#Calcular la media de las millas por galon y el maximo de caballos de fuerza
#agrupado por numero de cilindros
mtcars %>%
  group_by(cyl) %>%
  summarize(media_mpg = mean(mpg), max_hp = max(hp))

#renombra columnas
View(mtcars)
mtcars %>%
  rename(millas_x_galon = mpg)

#El cambio de nombre de la columna solo se fijara si dataset se guarda en espacio de data.
colnames(mtcars)[1] = "millas_x_galon"
mtcars

#elimina duplicados
mtcars %>%
  distinct(cyl)

#Filtrar autos con mas de 4 cilindros, seleccionar columnas a visualizar y ordenarlos
#por millas por galon. 

mtcars %>%
  filter(cyl > 4) %>%
  select(millas_x_galon, cyl, hp) %>%
  arrange(desc(millas_x_galon))

#une dos tablas
left_join()

df1 = data.frame(ID = 1:5, Valor1 = c(10,20,30,40,50))
df2 = data.frame(ID = 3:7, Valor1 = c(300,400,500,600,700))
#unir las tablas por la columna ID
df1 %>%
  left_join(df2, by = "ID")

#cuenta filas agrupadas
#Cuantos autos tienen cada nnumero de cilindros
mtcars %>%
  count(cyl)

#seleccionar filas por posicion
#seleccionar las primeras 5 filas
mtcars %>%
  slice(1:5)

#dataset de ejemplo incluido dentro de R.
View(mtcars)

#buscar filas y columnas
head(mtcars)
#primera fila
mtcars[1,]
#primera columna
mtcars[,1]

#nombre de filas
rownames(mtcars)

#nombre de columnas
colnames(mtcars)

