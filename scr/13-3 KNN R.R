
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






############
knn <- function(X, Y, K, test){
  yhat <- c()
  for(i in 1:ncol(test)){
    dist <- colSums((X - test[, i])^2)
    id <- sort.int(dist, decreasing = FALSE, index.return = TRUE)$ix[1:K]
    yhat[i] <- sign(sum(Y[id]))
  }
  return(yhat)
}

K <- seq(from = 1, to = 81, by = 2)

l <- matrix(nrow = 50, ncol = length(K))
L <- matrix(nrow = 50, ncol = length(K))
p.test <- matrix(0, ncol = 1000, nrow = length(K))
for(b in 1:50){
  b.Y <- sample(c(-1, 1), size = 100, replace = TRUE)
  b.X1 <- rnorm(100, mean = b.Y * 1.6, sd = 1)
  b.X2 <- rnorm(100)
  b.X <- rbind(b.X1, b.X2)
  print(b)
  Yhat.test <- matrix(nrow = length(K), ncol = 1000)
  Yhat.train <- matrix(nrow = length(K), ncol = 100)
  for(j in 1:length(K)){
    Yhat.test[j, ] <- knn(b.X, b.Y, K[j], Test.X)
    Yhat.train[j, ] <- knn(b.X, b.Y, K[j], b.X)
    l[b, j] <- mean(abs(Yhat.train[j, ] - b.Y) / 2)
    L[b, j] <- mean(abs(Yhat.test[j, ] - Test.Y) / 2)
  }
  p.test <- p.test + (Yhat.test + 1) / 2 / 50
}
L.mean <- colMeans(L)
L.sd <- apply(L, 2, sd)
l.mean <- colMeans(l)
l.sd <- apply(l, 2, sd)
V <- rowMeans(p.test * (1 - p.test))
L.min <- apply(L, 1, min)

plot(x = K, y = L.mean, type = "l", xlab = "K", ylab = "", ylim = c(0, 0.2), lwd = 2)
lines(x = K, y = L.mean + L.sd, lty = 2)
lines(x = K, y = L.mean - L.sd, lty = 2)
abline(h = mean(L.min), lty = 3, lwd = 2)
lines(x = K, y = l.mean, col = 2, lwd = 2)
lines(x = K, y = l.mean + l.sd, lty = 2, col = 2)
lines(x = K, y = l.mean - l.sd, lty = 2, col = 2)
lines(x = K, y = V, col = 3, lwd = 2)
legend("topleft", c("L", "l", "V", "Bayes Error"), col = c(1:3, 1), lty = c(1, 1, 1, 3))



data <- read.table("hw1-1d-train.dat", sep = " ")
attach(data)
X <- data[, 1]
Y <- data[, 2]
mu.pos <- mean(X[Y == 1])
mu.neg <- mean(X[Y == -1])
p <- sum(Y == 1) / length(Y)
theta.g <- (2 * log((1 - p) / p) + mu.pos^2 - mu.neg^2) / 2 / (mu.pos - mu.neg)

theta.L <- seq(from = -5, to = 5, by = 0.01)
error.pos <- c()
for(i in 1:length(theta.L)){
  Yhat <- sign(X - theta.L[i])
  error.pos[i] <- mean(abs(Yhat - Y) / 2)
}
error.neg <- c()
for(i in 1:length(theta.L)){
  Yhat <- sign(-X - theta.L[i])
  error.neg[i] <- mean(abs(Yhat - Y) / 2)
}

plot(x = theta.L, y = error.pos, ylab = "Error", main = "Empirical Classification Error", type = "l", ylim = c(0, 1))
lines(x = theta.L, y = error.neg, col = 2)
legend("topright", c("s = 1", "s = -1"), col = 1:2, lty = 1)
theta.L[which.min(error.pos)]

x <- seq(from = -6, to = 6, by = 0.01)
P <- 1 / (1 + exp(-4 * x + log(2)))
P.error <- (1 - P) * (P > 0.5) + P * (P < 0.5)
plot(x = x, y = P.error, ylab = "P(error|x)", type = "l", main = "P(error|x)")
abline(v = 2, lty = 2)
abline(v = -2, lty = 2)
abline(v = 0, lty = 3)

L.star <- 2 / 3 * (1 - pnorm(log(2) / 4, mean = -2)) + 1 / 3 * pnorm(log(2) / 4, mean = 2)

k.pos <- dnorm(x, mean = 2) / 3
k.neg <- dnorm(x, mean = -2) * 2 / 3
plot(x = x, y = k.pos, ylab = "", type = "l", ylim = c(0, 0.3))
lines(x = x, y = k.neg, col = 2)
abline(v = 2, lty = 2)
abline(v = -2, lty = 2)
abline(v = theta.g, lty = 3)
abline(v = theta.L[which.min(error.pos)], lty = 3)
abline(v = log(2) / 4, lty = 3)