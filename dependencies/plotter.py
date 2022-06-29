import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import csv

with open('phi.csv', newline='') as f:
	reader = csv.reader(f)
	for row in reader:
		phi = [float(x) for x in row]

with open('gpe_params.csv', newline='') as f:
	reader = csv.reader(f)
	params = []
	for row in reader:
		params.append(float(row[1]))
xmin, xmax, Nx = params[1:4]
potential = params[5:]
xs = np.linspace(xmin, xmax, int(Nx))
data1 = [p**2 for p in phi]
data2 = potential
label1 = r'$\rho_0(x)$'
label2 = r'$V(x)$'

fig, ax1 = plt.subplots()
color = 'crimson'
ax1.set_xlabel('x')
ax1.set_ylabel(label1, color=color)
ax1.plot(xs, data1, color=color)
ax1.tick_params(axis='y', labelcolor=color)

ax2 = ax1.twinx()  # instantiate a second axes that shares the same x-axis

color = 'black'
ax2.set_ylabel(label2, color=color)  # we already handled the x-label with ax1
ax2.plot(xs, data2, color=color)
ax2.tick_params(axis='y', labelcolor=color)

fig.tight_layout()  # otherwise the right y-label is slightly clipped
plt.show()
 
	
