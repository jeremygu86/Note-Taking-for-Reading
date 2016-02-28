import numpy as np
from copy import deepcopy

## counting and finding majorities
### http://stackoverflow.com/questions/6252280/find-the-most-frequent-number-in-a-numpy-vector
import collections

## input: X,Y,K, NEWX
## step 1. calculate distance
## step 2. choose top 7 


## 
X1 = np.random.normal(2, 5, 1000)
X2 = np.random.normal(-2, 3, 1000)
Y = np.random.choice([-1,1],size = 1000, replace = True)
X = np.concatenate([[X1],[X2]], axis=0).transpose()
np.shape(X) # (1000, 2)
NEWX = deepcopy(X)
def knn2(X,Y,k,NEWX):
	nRows = np.shape(NEWX)[0]
	y_hat = np.zeros(nRows)
	for i in np.arange(0,nRows):
		dists = np.sum( (X - NEWX[i,:])**2, axis = 1)
		# dists[:10] # show top 10 lines
		indices = dists.argsort(axis=0) ## the indices that sort the data
		## np.sign(np.sum(Y[indices[:k]])) #  vote by top k neighbors
		count = collections.Counter(Y[indices[:k]])
		y_hat[i] = count.most_common(1)[0][0]
	return(y_hat)	
 
k=5
y_hats = knn2(X,Y,k,NEWX)
