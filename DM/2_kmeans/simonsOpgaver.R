data("iris")
?iris
plot(iris[,-5])
kmeaned_iris<-kmeans(iris[,-5],4,nstart = 10)
plot(iris[,-5], col=kmeaned_iris$cluster)
kmeaned_iris$cluster

mydata<- iris[,3:4]
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,centers=i,nstart = 10)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")

library(clues)
get_CH(as.matrix.data.frame( mydata),kmeaned_iris$cluster)
wss <- rep(NA,14)
for (i in 2:15) wss[i-1] <- get_CH(as.matrix.data.frame( mydata),kmeans(mydata,centers=i,nstart = 10)$cluster)
plot(1:14, wss, type="b", xlab="Number of Clusters", ylab="CH")

?get_CH

k4 <- kmeans(mydata, 4, nstart = 20)
(k4$betweenss/(4-1))/(k4$tot.withinss/(nrow(mydata)-4))

get_CH(as.matrix(mydata), mem = k4$cluster)
