# Regresión Polin�mica

# Importar el dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[, 2:3]
# Ajustar Modelo de Regresión Lineal con el Conjunto de Datos
lin_reg = lm(formula = Salary ~ ., 
             data = dataset)
# Ajustar Modelo de Regresi�n Polin�mica con el Conjunto de Datos
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

# Visualizaci�n del modelo lineal
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = "blue") +
  ggtitle("Predicci�n lineal del sueldo en funci�n del nivel del empleado") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")


ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = "blue") +
  ggtitle("Predicci�n lineal del sueldo en funci�n del nivel del empleado") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")

# Visualizaci�n del modelo polin�mico
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.2)
ggplot() +
  geom_point(aes(x = dataset$Level , y = dataset$Salary),
             color = "red") +
  geom_line(aes(x = x_grid, y = predict(poly_reg, 
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            color = "blue") +
  ggtitle("Predicci�n polin�mica del sueldo en funci�n del nivel del empleado") +
  xlab("Nivel del empleado") +
  ylab("Sueldo (en $)")

# Predicci�n de nuevos resultados con Regresi�n Lineal
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))

# Predicci�n de nuevos resultados con Regresi�n Polin�mica
y_pred_poly = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                     Level2 = 6.5^2,
                                                     Level3 = 6.5^3,
                                                     Level4 = 6.5^4))


