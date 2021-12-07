data {
  int<lower = 0> I;
  int<lower = 0> y[I];  
  real<lower = 0> births[I];
  int<lower = 0> RA[I];
}

parameters {
  real alpha;
  real beta;
  // real<lower=0, upper = 100> sigma_a;
  // real<lower=0> sigma_b;
}

transformed parameters {
  real<lower=0> lambda[I];
  for (i in 1:I)
  lambda[i] = births[i]*exp(alpha+beta*RA[i]);
  }

model {
    alpha ~ normal(0, 1000);
    beta ~ normal(0, 1000);
    // sigma_a ~ uniform(0, 100);
    // sigma_b ~ cauchy(0,1);
        for (i in 1:I){
    y[i] ~ poisson(lambda[i]);
    }
}
