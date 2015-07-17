library(nlme)
library(lattice)
plotView <- xyplot(weight ~ Time | Diet, BodyWeight)
print(plotView)