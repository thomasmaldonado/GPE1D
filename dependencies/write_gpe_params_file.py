from gpe_params import *

import pandas as pd 
import numpy as np

x = np.linspace(xmin, xmax, nx)
arr = np.zeros(nx + 4)
arr[0] = xmin
arr[1] = xmax
arr[2] = nx
arr[3] = beta
for i in range(nx):
	arr[i + 4] = potential(x[i])
df = pd.DataFrame(arr)
df.to_csv("gpe_params.csv")
