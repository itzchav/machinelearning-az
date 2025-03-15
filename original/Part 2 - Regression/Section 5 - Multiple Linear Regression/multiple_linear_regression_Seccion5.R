#Abrir dataset
dataset = read.csv('50_Startups.csv')

# Codificar las variables categ√≥ricas
dataset$State = factor(dataset$State,
                         levels = c("New York", "California", "Florida"),
                         labels = c(1, 2, 3))

str(dataset)



library(caTools)
set.seed(123)
#Dividir en train y test
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               # data = training_set)
regression = lm(formula = Profit ~ .,
                data = training_set)

#Predecir con testing 
y_pred = predict.lm(regression, newdata = testing_set)

#Construir un modelo Ûptimo con la eliminacion hacia ·tras
regression = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                 data = dataset)

regression = lm(formula = Profit ~ R.D.Spend,
                 data = training_set)

backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

SL = 0.05
dataset = dataset[, c(1,2,3,4,5)]
backwardElimination(training_set, SL)

