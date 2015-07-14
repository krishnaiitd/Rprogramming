library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

trainingCol = names(training)
#print(trainingCol)
ILCol <- c();
for(i in 1:length(trainingCol)) {
        if(substr(trainingCol[i], 1, 2) == "IL") {
                ILCol <- c(ILCol, i)
                print(i)     
        }    
}
trainingData <- training[,ILCol]
prComp <- prcomp(trainingData)

#preProc <- preProcess(log10(trainingData+1),method="pca",pcaComp=2)



