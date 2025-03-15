#Abrir dataset
dataset = read.csv('Salary_Data.csv')


library(caTools)
set.seed(123)
#Dividir en train y test
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
testing_set = subset(dataset, split == FALSE)

#Ajustar el modelo de regresión linea simple con el conjunto de entrenamiento 
regressor = lm(formula = Salary ~ YearsExperience, 
               data = training_set)
#summary(regressor)
y_pred = predict(regressor,newdata = testing_set)

#install.packages("ggplot2")
#Validación de los resultados en el conjunto de entrenamiento
library(ggplot2)
ggplot(training_set, aes(x = YearsExperience, y = Salary)) +
  geom_point(colour = "red") +  # Graficar los puntos
  geom_line(aes(x = YearsExperience, y = predict(regressor,newdata = training_set)), colour = "blue")  # Agregar la línea de regresión

