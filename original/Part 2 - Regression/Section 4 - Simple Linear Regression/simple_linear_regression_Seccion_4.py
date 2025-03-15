# -*- coding: utf-8 -*-
"""
Created on Fri Mar 14 13:46:20 2025

@author: karli
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv('Salary_Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
print(X)
print(y)

#Dividir el data en entrenamiento y test. 
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size = 1/3, random_state=0)



'''
#Escalar
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
'''

#Crear modelo de la Regresión Lineal Simple
from sklearn.linear_model import LinearRegression
regression =  LinearRegression()
regression.fit(X_train, y_train)

#Predecir el conjunto de test
y_pred = regression.predict(X_test)

plt.scatter(X_train, y_train, color = "red")
plt.plot(X_train, regression.predict(X_train))
plt.title("Sueldo vs Años de Experiencia(Conjunto de entrenamiento")
plt.xlabel("Años de Experiencia")
plt.ylabel("Sueldo en $")
plt.show()


