import pandas as pd
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


df = pd.read_csv("exp1_data.csv",index_col=0)

# df = df.drop('Marker', axis=1)
df = df.drop('Date', axis=1)
df = df.drop('DrugDose', axis=1)
df = df.drop('WellId', axis=1)

df.to_csv('exp1_data_clipped.csv') 

df = pd.read_csv("exp1_data_mono.csv",index_col=0)

# df = df.drop('Marker', axis=1)
df = df.drop('Date', axis=1)
df = df.drop('DrugDose', axis=1)
df = df.drop('WellId', axis=1)

df.to_csv('exp1_data_mono_clipped.csv') 
