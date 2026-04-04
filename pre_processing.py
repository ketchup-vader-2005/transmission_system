import numpy as np
import pandas as pd
import tensorflow as tf

f = pd.read_parquet('/Users/faizshaikh/Documents/MATLAB/transmission_system/live_test.parquet')
print(f.head())

#This iterates through every simulation, expands the dictionaries, and stacks them
#X = np.array([pd.DataFrame.from_records(sim).values for sim in f['TransientData']])
features = ['D6[Va]', 'D6[Vb]', 'D6[Vc]', 'D6[Ia]', 'D6[Ib]', 'D6[Ic]', 'D2[Ia]', 'D2[Ib]', 'D2[Ic]', 'Ig']

X = np.array([
    pd.DataFrame(
    list(sim))[features].values for sim in f['TransientData']
])

X = X[:, 50:290, :]
