# -*- coding: utf-8 -*-
"""
Created on Fri Mar 14 12:43:46 2025

@author: karli
"""


# -*- coding: utf-8 -*-
"""
Created on Wed Mar 12 16:17:52 2025

@author: karli
"""


import numpy as np
import pandas as pd

dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values
print(X)
print(y)

#Eliminar los Nans
from sklearn.impute import SimpleImputer
#sustituir por la media
imputer = SimpleImputer(missing_values=np.nan, strategy='mean')
imputer.fit(X[:, 1:3])
X[:, 1:3] = imputer.transform(X[:, 1:3])
print("\nEliminación NaN")
print(X)


#Codificar datos Categóricos
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
ct = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), [0])], remainder='passthrough')
X = np.array(ct.fit_transform(X))

#Se usa label ya que es si o no - 1 o 0
labelencoder_y = LabelEncoder()
y=labelencoder_y.fit_transform(y)


#Dividir el data en entrenamiento y test. 
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size = 0.2, random_state=0)

#Escalar
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
