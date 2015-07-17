### Lattice Plot ###
library(lattice)
state <- data.frame(state.x77, region = state.region)
plotView = xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))
print(plotView)
print(class(plotView))
## Simple Base Graphics: Boxplot
library(datasets)
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb)")