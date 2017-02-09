library(ISLR)
data("Auto")
?princomp
crab.pca <- 

auto.pca <- princomp(Auto[1:8])
loadings(auto.pca)

auto.pca.corr <- princomp(Auto[1:8],cor = TRUE)
loadings(auto.pca.corr)

auto.pca.nocorr <- princomp(Auto[1:8],cor = FALSE)
loadings(auto.pca.nocorr)
