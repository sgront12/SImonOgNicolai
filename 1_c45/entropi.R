entropi <- function(D,target="play"){
  p <- table(D[[target]])/nrow(D) ## Compute the p_i
  sum(ifelse(p==0,0,-p*log2(p))) ## Compute the entropi where p_i=0 => -p_i*log2(p_i) = 0
}
