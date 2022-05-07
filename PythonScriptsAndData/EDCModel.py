import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
from sklearn import preprocessing, svm
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, LogisticRegression, BayesianRidge
from sklearn.metrics import accuracy_score
from sklearn.datasets import make_blobs
from sklearn.metrics import mean_squared_error, r2_score

df = pd.read_csv('edcDataset.csv',converters={'Rank': eval,'Cycle': eval})
df.columns = ['Cycle','Rank','Total','Pred']
df_test = pd.read_csv('testData.csv',converters={'Rank': eval,'Cycle': eval})


y = [0.4]*18
y2 = [4.6]*18
y = np.array(y)
y2 = np.array(y2)
df = df[['Cycle','Rank','Pred']]
df_test = df_test[['Cycle','Rank']]

y = np.concatenate((y,y2))

x = df[['Cycle','Rank']]
y = df.Pred

model = LinearRegression()
model.fit(x,y)

yhat = model.predict(df[['Cycle','Rank']])

print(r2_score(y_true = df.Pred,y_pred = model.predict(df[['Cycle','Rank']])))

model3 = BayesianRidge()
model3.fit(x,y)
y3_pred = model3.predict([[0,0],[212,0.5]])


