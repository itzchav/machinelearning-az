# -*- coding: utf-8 -*-
"""
Created on Tue Mar 18 13:37:02 2025

@author: karli
"""


# SVR

# Cómo importar las librerías
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importar el data set
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

# Escalado de variables
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
sc_y = StandardScaler()
X = sc_X.fit_transform(X)
y = sc_y.fit_transform(y.reshape(-1,1))


# Ajustar la regresión con el dataset
from sklearn.svm import SVR
regression = SVR( C=15.0, kernel='rbf', degree=10, epsilon=0.0009, gamma='scale', coef0=0.0, shrinking=True,  tol=0.001, cache_size=200,  verbose=False, max_iter=-1)
regression.fit(X, y.ravel())

# Predicción de nuestros modelos con SVR
y_pred_1 =regression.predict(sc_X.transform(np.array([[6.5]]))).reshape(-1, 1)
y_pred = sc_y.inverse_transform(y_pred_1) 
#y_pred=regression.predict(6.5)
print(y_pred)
print(y_pred_1)
# Visualización de los resultados del SVR
X_grid = np.arange(min(X), max(X), 0.1)
X_grid = X_grid.reshape(len(X_grid), 1)
plt.scatter(X, y, color = "red")
plt.plot(X_grid, regression.predict(X_grid), color = "blue")
plt.title("Modelo de Regresión (SVR)")
plt.xlabel("Posición del empleado")
plt.ylabel("Sueldo (en $)")
plt.show()

