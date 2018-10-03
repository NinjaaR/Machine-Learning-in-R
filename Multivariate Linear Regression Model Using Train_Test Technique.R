data <- read.csv("Folds5x2_pp.csv") #Reading dataset
str(data) 
summary(data)

pairs(data[c("AT","V","AP","RH","PE")])   #Visualise correlation using pairs command

# Modelling Using train/test Split
set.seed(1) #To fetch random reproducible numbers
Dividedata <- sample(nrow(data), size = floor(0.70*nrow(data)))  #Spliting the data into train and test datasets
traindata <- data[Dividedata,] #traindata with 70% of the data
testdata <- data[-Dividedata,] #testdata with 30% of the data 

Pmodel <- lm(PE ~., data = traindata) #Running regression with all the predictor variables
summary(Pmodel)

predict <- predict(Pmodel, newdata = testdata) #Predict the values for test datset using Pmodel
summary(predict)

RMSEtest <- sqrt(mean((predict-testdata$PE)^2)) #RMSE for test data
RMSEtest

RMSEmodel <- sqrt(mean((Pmodel$residuals)^2))  #RMSE for training data
RMSEmodel