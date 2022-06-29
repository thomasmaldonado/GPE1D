xmin, xmax = -32, 32 # computational domain
nx = 2**10 + 1 # number of grid points
beta = 25 # cooper pair interaction strength
potential = lambda x: -10 * ((x >= -8 and x < -1) or (1 <= x and x < 8)) # potential function
