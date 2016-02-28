# Note-Taking-for-Reading

[madoko](https://www.npmjs.com/package/madoko-local)

1. The Elements of Statistical Learning

#### CH13 Prototy methods and Nearest-Neighbors

**[13.3]** ***k*-Nearest-Neightbor Classifiers**

1. They are highly **unstructured**. They not not useful for understanding the nature of the relationship between the features and the outcome class.

2. Nearest neighbor work well in low-dimensional data. Nearest neighbor also work well in regression for low-dimensional problems. 

- In the high-dimensional data, the bias-variance tradeoff doesn't work as well for NN regression as it does for classification.

	- **Reason**:  distance gets larger when the number of features increases. dist (1,1) = 2^(1/2), but dist (1,1,1) = 3^(1/2) is larger/further.
	
```python
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


```


```r

## Simulated data
### Class -1, 1
Test.Y <- sample(c(-1, 1), size = 1000, replace = TRUE)
Test.X1 <- rnorm(1000, mean = Test.Y * 1.6, sd = 1)
Test.X2 <- rnorm(1000)
Test.X <- rbind(Test.X1, Test.X2)


X = t(Test.X)
Y = Test.Y
newX = X
data = data.frame(x1 = Test.X1, x2 = Test.X2, y = Test.Y)
head(data)
plot(data[,"x1"],data[,"x2"], col = c("red","black","blue")[data[,"y"]+2],
     pch = 1, size = 0.8)

## k-nn function V2
knn2 = function(X,Y,k,newX){
  y_hat = c()
  ## calculate the distance between pairs
  ### Don't need to store everything. 
  ### Just store the top k
  for (i in 1:ncol(newX)){
    dists = apply((X - newX[1,])^2,1,sum)
    nearest_id = sort.int(dists, decreasing = F, index.return = T)$ix[1:k]
    y_hat[i] = sign(sum(Y[nearest_id]))
  }
  return(y_hat)
}

````