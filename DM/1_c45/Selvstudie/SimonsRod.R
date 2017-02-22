

library(MASS) 
data(crabs)
head(crabs)

num_cols <- c("FL","RW","CL","CW","BD")

ccol <- function(sp) ifelse(sp=="B","#0f7fa9","#fa8d0f")
cpch <- function(sx) 1 + 15*(crabs$sex=="M")
[c("Comp.1","Comp.2","Comp.3","Comp.4","Comp.5")]
pairs(crab.pca$scores, col=ccol(crabs$sp), pch=cpch(crabs$sex))

crab.pca <- princomp(crabs[,-(1:3)],cor = TRUE)
?pairs

biplot(crab.pca)
crab.pca$scores




aims<-read.csv("aims_freq.csv",header = TRUE)
aims_d<-dist(aims[,4:100])

aims_d_cmd <- cmdscale(aims_d)
plot(aims_d_cmd)

aims_d_sammon <- sammon(aims_d)
plot(aims_d_sammon$points)

aims_d_isoMDS <- isoMDS(aims_d)
plot(aims_d_isoMDS$points)



library(ggplot2)
ggplot() + borders("world", colour="gray50", fill="gray50") +geom_text(data = aims_freq, aes(x = long, y = lat, label = pop))





golf<-read.csv("golf.csv",header = TRUE)

library(C50)
?C5.0
tree<-C5.0(play~.,data=golf)
plot(tree)
C5.0Control( noGlobalPruning = TRUE)
tree<-C5.0(play~.,data=golf, control=C5.0Control(sample = 0.1))
summary(tree)
tree
plot(tree)

?C5.0

