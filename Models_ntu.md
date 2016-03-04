# Behind the scene of machine learning 
**机器学习幕后总结**
**Author: Wenxiao Jeremy Gu**

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

- Part 2. Techniques on Optimization

	- Basic: gradient descent
		
		- Find the direction (1st order approx)
		
		- SGD
			
			- Logistic regression
			
			- Neural network (backprop)
			
			- Matrix Factorization
			
			- Linear SVM (Maybe)
			
		- Functional GD
		
			- Adaboost
			
			- GradientBoost
			
		- Steepest Descent
		
			- Adaboost
			
			- GradientBoost

	- Advanced GD:
	
		- 2nd order technique (newton)
		
		- GD under constraints
	
	- Equivalent Solution
	
		- Dual SVM: convext QP
		
		- Kernel LogReg: via representer
		
		- PCA: eigenvalue problem
		
	- Multiple steps
	
		- Probablistic SVM
		
		- Linear blending
		
		- Stacking
		
		- RBF Network
		
		- DeepNet pre-training
		
	- Alternating optimization (fixed one and do the other)
	
		- K-means
		
		- Matrix factorization: alternating least sqaure
		
	- Divide and conquer
	
		- Decision tree
		
- Part 3. Techniques on Overfitting elimination

	- Regularization
	
		- when model perform too well: add breaks (augubly the most important techniques)
		
			- Large-margin: SVM; Adaboost
			
			- L2: Kernel, NNet, SVR
			
			- Voting/averaging: uniform blending, bagging, random forest
			
			- Denoising: autoencoder
			
			- Pruning: decision tree
			
			- Wight-elimination: NNet
			
			- Early stopping: NNet (any GD like)
			
			- Constraining: autoenc[weight], RBF[# center]
		
		- Validation: Check performance (simple but necessary)
			
			- OOB: Random Forest
			
			- svm/svr: # of support vectors
			
			- Internal validation: blending, decision tree pruning
			
			
				
			
			
			




