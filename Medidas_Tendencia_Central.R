#Medidas de Tendencia Central

#Media

mean(c(3,5,4,3.5,4.5,5,5))

9 %% 2
16 %% 2

#Mediana 

x = c(3,4,5,9,2,6,8)
sort(x)
median(x)

#Moda

install.packages("modeest")

library(modeest)
datos = c(1,2,2,3,4,5,6,7,7,2,8)
moda = mlv(datos,method = "mfv")
print(moda)

minimo = min(x)
maximo = max(x)

range = maximo - minimo
print(range)
range


#varianza muestral 

data = c(2,4,6,8,10)
var(data)

#varianza poblacional

varianza_poblacionial = function(x){
  vp = var(x) * (length(x)- 1) / length(x)
  return(vp)
}

varianza_poblacionial(data)

#Desviación estandar

pesos_maquina_A = c(500, 502, 499, 501, 500)
pesos_maquina_B <- c(500, 510, 490, 495, 505)

desviacion_A <- sd(pesos_maquina_A)
desviacion_B <- sd(pesos_maquina_B)

print(paste("Desviación estándar Máquina A:", desviacion_A))
print(paste("Desviación estándar Máquina B:", desviacion_B))


