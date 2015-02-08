##install the package: AppliedPredictiveModeling

#install.packages("AppliedPredictiveModeling")
# load the library
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)
data(iris)
featurePlot(x = iris[, 1:4],
            y = iris$Species,
            plot = "pairs",
            ## Add a key at the top
            auto.key = list(columns = 3))



# density plots for each attribute by class value
featurePlot(x=iris[,1:4], 
            y=iris[,5], 
            plot="density", 
            scales=list(x=list(relation="free"), 
                        y=list(relation="free")), 
            auto.key=list(columns=3))

###Box and Whisker Plots###
# box and whisker plots for each attribute by class value
featurePlot(x=iris[,1:4], 
            y=iris[,5], 
            plot="box", 
            scales=list(x=list(relation="free"), 
                        y=list(relation="free")), 
            auto.key=list(columns=3))

