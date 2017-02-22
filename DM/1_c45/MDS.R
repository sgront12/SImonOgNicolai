library(mvtnorm) ## Simulerer multivariate normal fordelinger

n <- 100

pars <- list(list(mean=rep(-2,8),sigma=5*diag(8)),
             list(mean=rep(c(1,0,2,4),2),sigma=4*diag(8)),
             list(mean=rep(c(0,0,5,0),2),sigma=7*diag(8)))

sims <- do.call("rbind",lapply(pars,function(x) rmvnorm(n,mean=x$mean,sigma=x$sigma)))

pairs(sims,col=rep(1:length(pars),each=n))
