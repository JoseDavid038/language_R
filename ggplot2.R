setwd("~/Talent Tech")
#install.packages("tidyverse")
#install.packages("ggplot2")
library(ggplot2)
library(tidyverse)

# Data simulation
set.seed(5)
x <- runif(100)
df <- data.frame(x = seq_along(x), var = x)

# Box plot
p1 <- ggplot(df, aes(x = "", y = var)) +
  geom_boxplot()

# Density plot
p2 <- ggplot() +
  stat_function(fun = dnorm, geom = "density",
                xlim = c(-3, 3), fill = "white") 

# Line chart
p3 <- ggplot(df, aes(x = x, y = var)) +
  geom_line(color = "gray20")

# Scatter plot
p4 <- ggplot(df, aes(x = x, y = var)) +
  geom_point(color = "gray20")

# View the plots
p1
p2
p3
p4

head(df)



