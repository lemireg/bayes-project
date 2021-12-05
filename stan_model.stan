data{
  
}

model{
    ## Likelihood
    for(i in 1:length(RA)){
      y[i] ~ dpois(lambda[i])
      lambda[i] <- births[i]*exp(RA[i]*beta)
      }     
    ## Priors 
    beta ~ dnorm(a0,b0)
}
