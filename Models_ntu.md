# Behind the scene of machine learning 

** Author: Wenxiao


- Part 1. Techniques on Features tranforms
	
	- Kernel models: put the feature transform in a kernel model
	
		**Kernels**
		
		- polynomial kernel
		
		- Gaussian kernel: infinite-dim transforms
		
		- Stump kernel
		
		**Lemma**
		
		- Sum of kernels is kernel
		
		- Product of kernels is kernel
		
		- Math condition: Mercer condition
		
		**Kernel with other linear models into non-linear models**
		
		- SVM
		
		- SVR
		
		- Probabilisitic SVM
		
	- Aggregation
	
		**g**
		
		- Decision Stump (one branch decision tree)
		
		- Decision tree
		
		- Gaussian RBF
		
		**ways of voting**
		
		- Uniform
		
		- Non-uniform
		
		- Conditional
		
		**methods**
		
		- Bagging; Random Forest
		
		- AdaBoost; GradientBoost
		
		- Decision tree; Nearest Neighbor
		
		- Probabilisitic SVM
	
	- Finding hidden features
	
		- with unsupervised learning
		
		- Neural network
		
		- RBF Network
		
		- Matrix factorization
		
 		- unsupervised learning: K-means
 			
 			- Find cluster centers
 		
 		- Autoencoder; PCA
 			
 			- Find good basis directions
 			
 		- Adaboost;GradientBoost
 			
 			- Treat g as the parameters
	 
	-  Special feature transform: Compression (high-dim - > Low-dim)
	
		- Decision stump 
		
		- Random Forest: tree branching
		
		- Autoencoder, PCA
		
		- Matrix Factorization: projection from abstract to concrete
		
		- Feature selection (find a few useful)
		
		-
	
- Part 2. Techniques on Optimization

- Part 3. Techniques on Overfitting elimination





