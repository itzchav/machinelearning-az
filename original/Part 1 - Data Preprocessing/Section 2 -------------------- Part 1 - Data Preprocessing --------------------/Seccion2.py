# -*- coding: utf-8 -*-
"""
Created on Wed Mar 12 16:17:52 2025

@author: karli
"""


import numpy as np
import matplotlib as plt
import pandas as pd

dataset = pd.read_csv('Data.csv')
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, -1].values