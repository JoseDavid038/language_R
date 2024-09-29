setwd("~/Talent Tech")

Iris <- read.csv("~/Talent Tech/Iris.csv")
View(Iris)

library(readxl)
Mall_Customers <- read_excel("Mall_Customers.xlsx")
View(Mall_Customers)

getwd()

archivo_dian = read.csv("https://www.datos.gov.co/resource/5gac-vyg3.csv", header = TRUE, sep = ",")
View(archivo_dian)

install.packages("glue")
library(glue)

age = 20

if (age >= 18){
  print("you are old")
}else {
  print("You are baby")
}

output = glue("your age is: {age}")
print(output)

output2 = sprintf("your age is: %d",age)
print(output2)

output3 = paste0("Your age is: ", age)
print(output3)

is.logical(FALSE)
array1 = array(1:6, dim = c(1,5))
is.array(array1)
typeof(array1)
print(array1)

languages = c("python", "R", "JavaScript", "Java", "Android")
for (variable in languages){
  print(variable)
}

Iris <- read.csv("~/Talent Tech/Iris.csv")
View(Iris)
names(Iris)

for (numero in 1:10){
  resultado = numero * 2
  output = glue(" {numero} * 2 = {resultado}")
  print(output)
}

tabla = 3
for (numero in 1:10){
  print(paste(tabla, "*",numero,"=", tabla*numero ))
}

flag = 1
while(flag < 10){
  print(flag)
  flag = flag + 1
}

Iris[1:5,]
Iris[,c("SepalLengthCm", "PetalWidthCm")]
Iris[1:5,c("SepalLengthCm", "PetalWidthCm")]

#Functions

multiplicar = function(x,n){
  resultado = x * n
  return(resultado)
}

multiplicar(5,2)


