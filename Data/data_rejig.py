import pandas as pd
import math
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.patches import Rectangle
import seaborn as sns
#matplotlib inline
import sys
import os
import string
import tqdm
import scipy
import statsmodels.stats.api as sms


#df2 = pd.DataFrame(columns={'Condition','Confluence','Glucose','Time','Channel'})

df = pd.read_csv("exp1_data.csv",index_col=0)

# df = df.drop('Marker', axis=1)
df = df.drop('Date', axis=1)
df = df.drop('DrugDose', axis=1)
df = df.drop('WellId', axis=1)
df = df[df['Time'] <= 72]

#df.to_csv('exp1_data_clipped.csv') 

# df2 = pd.read_csv("exp1_data_mono.csv",index_col=0)

# # df = df.drop('Marker', axis=1)
# df2 = df2.drop('Date', axis=1)
# df2 = df2.drop('DrugDose', axis=1)
# df2 = df2.drop('WellId', axis=1)
# df2 = df2[df2['Time'] <= 72]

# #df2.to_csv('exp1_data_mono_clipped.csv') 

length = df.shape[0]
print(length)

#length = df2.shape[0]
#print(length)

iters = math.floor(length/4)
print(iters)

df3 = pd.DataFrame()
for i in range(iters):
    print('Hi')
    df3[i,:] = df[4*i,:]

df3.to_csv('test1.csv')