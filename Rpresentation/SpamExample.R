library(caret); library(kernlab); data(spam);


training <- spam[inTrain,];
testing <- spam[-inTrain,];

# Fit a model using glm
set.seed(32343)
modelFit <- train(type ~.,data=training, method="glm")
modelFit

#Check the model
modelFit
modelFit$finalModel


# Predict the testing data
predictions <- predict(modelFit, newdata=testing)
predictions








