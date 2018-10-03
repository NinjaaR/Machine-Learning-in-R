install.packages("caret")
library(caret)

data <- read.csv("Folds5x2_pp.csv") #Reading dataset
str(data) 
summary(data)

pairs(data[c("AT","V","AP","RH","PE")])   #Visualise correlation using pairs command


# Define training control
set.seed(123) 
train.control <- trainControl(method = "cv", number = 10, repeat = 3)
# Train the model
model <- train(PE ~., data = data, method = "lm",
               trControl = train.control)
# Summarize the results
print(model)