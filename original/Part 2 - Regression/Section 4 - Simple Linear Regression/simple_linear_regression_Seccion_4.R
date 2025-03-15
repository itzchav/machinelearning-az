#Abrir dataset
dataset = read.csv('Salary_Data.csv')


library(caTools)
set.seed(123)
#Dividir en train y test
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

