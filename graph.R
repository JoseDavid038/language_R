#Tipos de Graficas
setwd("~/Talent Tech")
#histograma

vector = c(10,10,9,8,11)
hist(vector, xlab = "Eje X", xlim = c(6,13),breaks = seq(7,12, by=1))

df_sabana_de_torres = read.csv("https://www.datos.gov.co/resource/knbe-t62n.csv")
typeof(df_sabana_de_torres)
edad = df_sabana_de_torres[["edad"]]
typeof(edad)
hist(edad, xlab = "Edad (años)", main = "Edad población Sabana de Torres - Santander", col = "chocolate2")

jpeg(filename = "sabana_de_torres_edad.jpeg", width = 600, height = 400, units = "px")
hist(edad, xlab = "Edad (años)", main = "Edad población Sabana de Torres - Santander", col = "royalblue1")
dev.off()

svg(filename = "sabana_de_torres_edad.svg", width = 6, height = 4)
hist(edad, xlab = "Edad (años)", main = "Edad población Sabana de Torres - Santander", col = "cyan3")
dev.off()

#Barplot

animals = c('dog','cat','turtle','bird')
cantidad =c(10,5,3,8)
#Un color para cada barra.
barplot(height = cantidad, names= animals,col=palette())
palette() #es un vector de 8 colores

barplot(height = cantidad, names= animals,col=palette("Pastel 2"))

#Creacion de vector de colores personalizados
colores_profesionales <- c(
  "#4E79A7",  # Azul grisáceo suave
  "#F28E2B",  # Naranja suave
  "#E15759",  # Rojo oscuro
  "#76B7B2",  # Verde azulado
  "#59A14F",  # Verde
  "#EDC949",  # Amarillo dorado
  "#AF7AA1",  # Púrpura suave
  "#FF9DA7",  # Rosa suave
  "#9C755F",  # Marrón suave
  "#BAB0AC"   # Gris claro
)

bar_positions = barplot(
                  height = cantidad, 
                  names.arg = animals, 
                  xlab = "Cantidad", ylab = "Animales",
                  col = colores_profesionales, 
                  border = "white",
                  #legend.text = cantidad,
                  ylim = c(0, max(cantidad) + 5),
                  main = "Grafico de barras con Colores Profesionales")

legend(
  "topright",
  legend = cantidad,
  fill = colores_profesionales,
  title = "Cantidad"
)

text(
  x = bar_positions,                       # Posiciones de las barras en el eje X
  y = cantidad,                            # Valores de 'cantidad' en el eje Y
  labels = cantidad,                       # Etiquetas que mostrar (las cantidades)
  pos = 3,                                 # Posición (3 = justo encima de las barras)
  cex = 0.8,                               # Tamaño del texto
  col = "black"                            # Color de las etiquetas
)

#instalar libreria para obtener fuente de datos
install.packages("repmis")
library(repmis)
source_data("https://github.com/hllinas/DatosPublicos/blob/main/Estudiantes.Rdata?raw=false")
datosCompleto <- Estudiantes

#Definición de variables a utilizar
Sexo <- as.factor(datosCompleto$Sexo)
Fuma <- as.factor(datosCompleto$Fuma)

Cuentas1 <- table(Sexo)                 #A) Tabla de frecuencias no agrupadas para Sexo
Cuentas1
barplot(Cuentas1,                       #B) Se aplica barplot a esa tabla
        main="TITULO GENERAL",          #C) Título principal     
        xlab="Eje X",                   #D) Tíulo del eje X
        ylab="Eje Y",                   #E) Título del eje Y
        legend = rownames(Cuentas1),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("pink","blue")            #H) Colorear las barras
) 
Cuentas2 <- table(Sexo, Fuma); Cuentas2  #A) Tabla de frecuencias no agrupadas para Sexo y Fuma
barplot(Cuentas2,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Fuma",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas2),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("pink","blue")            #H) Colorear las barras
) 

Cuentas3 <- table(Fuma, Sexo); Cuentas3    #A) Tabla de frecuencias no agrupadas para Sexo y Fuma
barplot(Cuentas3,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Sexo",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas3),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("yellow","red")         #H) Colorear las barras
)     

Cuentas3
Mujeres_no_fuman = Cuentas3["No","Femenino"]
Mujeres_no_fuman

Cuentas3 <- table(Fuma, Sexo); Cuentas3    #A) Tabla de frecuencias no agrupadas para Sexo y Fuma
barplot(Cuentas3,                       #B) Se aplica barplot a esa tabla
        main="Diagrama de barras",      #C) Título principal     
        xlab="Sexo",                    #D) Tíulo del eje X
        ylab="Frecuencias",             #E) Título del eje Y
        legend = rownames(Cuentas3),    #F) Mostrar las leyendas
        ylim = c(0, 300),               #G) Ajustar límites en eje Y
        col=c("green","blue"),        #H) Colorear las barras
        beside = TRUE
) 

#Graficos de lineas

x = 1:50
y = x**2
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "blue", pch = 2)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "blue", pch = 3)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "blue", pch = 5)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "blue", pch = "A")
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = 1:50, pch = 1:50)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "b",pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "l",pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "h",pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "s",pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "o",pch = 19)
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^2", col = "red", type = "b",cex = 3, pch = 19)

x = 1:50
y = x**3
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X^3", col = "green", type = "b",cex = 1, pch = 16)
#vertical line
x_line = c(40,40)
y_line =c(min(y), max(y))
lines(x = x_line, y = y_line, col = 1, lwd = 1, type = "l")

#horizontal line
x_line = c(min(x), max(x))
y_line = c(64000,64000)
lines(x = x_line, y = y_line, col = 1, lwd = 1, type = "l")

#other line
x_line = c(1, max(x))
y_line = c(1, max(y))
lines(x = x_line, y = y_line, col = 1, lwd = 2, type = "l", lty = 2)


x = 1:50
y = x + 10
plot(x,y, main = "Title....", xlab = "seq 1:50", ylab = "X + 10", col = "green", type = "b",cex = 1, pch = 16)
#grid
grid(nx = NULL, ny = NULL,
     lty = 2,      # Grid line type
     col = "gray", # Grid line color
     lwd = 2)      # Grid line width

#Scatter plot
set.seed(132)
x <- rnorm(500)

plot(x, pch = 19, col = 4)
grid(nx = NULL, ny = NULL,
     lty = 2,      # Grid line type
     col = "gray", # Grid line color
     lwd = 2)      # Grid line width


set.seed(132)
x <- rnorm(500)

plot(x, pch = 19, col = 4)
grid(nx = NULL, ny = NULL,
     lty = "solid",      # Grid line type
     col = "gray", # Grid line color
     lwd = 0.5)      # Grid line width

#Histograma
set.seed(132)
x <- rnorm(500)

hist(x)
grid(nx = NA, ny = NULL,
     lty = 1, col = "gray", lwd = 1)
hist(x, col = 4,
     add = TRUE)

#Boxplot 
set.seed(132)
x <- rnorm(500)
boxplot(x, main = "Grafico de Cajas", ylab = "random normal")


set.seed(132)
x1 <- rnorm(500)
x2 <- rnorm(500, mean = 2, sd = 2)
data = cbind(x1,x2)
boxplot(data, main = "Grafico de Cajas", ylab = "random normal")

median(data[,1])
median(data[,2])

quantile(data[,1])
quantile(data[,2])

#Pie chart
x = c(5,4,9)
x_sort = sort(x)
pie(x_sort, col = c("blue","red","yellow"), main = "Pie Chart",clockwise = TRUE, init.angle = 90)
legend(
  "topright",
  legend = x_sort,
  fill = c("blue","red","yellow"),
  title = "Pie Chart"
)

#Grafica con libreria. 
#install.packages("lessR")
library(lessR)

# Categorical data
cat_var <- factor(c(rep("Group 1", 10),
                    rep("Group 2", 15),
                    rep("Group 3", 30),
                    rep("Group 4", 20)))

# Store the variable as data frame
cat <- data.frame(cat_var)

# Pie
cols <-  hcl.colors(length(levels(cat_var)), "Fall")
PieChart(cat_var, data = cat, hole = 0,
         fill = cols,
         labels_cex = 0.6)



