data {
  int<lower = 0> I;
  int<lower = 0> y[I];  
  int<lower = 0> births[I];
  int RA[I];
}

parameters {
  real alpha;
  real beta;
  real mu_a;
  real mu_b;
  real<lower=0> sigma_a;
  real<lower=0> sigma_b;
}

transformed parameters {
  real<lower=0> lambda[I];
  for (i in 1:I)
  lambda[i] = births[i]*exp(alpha+beta*RA[i]);
  //real<lower=0> lambda[I] = births[I]*exp(beta*RA[I]);
  }

model {
    for (i in 1:I)
    y[i] ~ poisson(lambda[i]);
    alpha ~ normal(mu_a, sigma_a);
    beta ~ normal(mu_b, sqrt(sigma_b));
    mu_a ~ normal(0, 100);
    sigma_b ~ uniform(0, 100);
    mu_b ~ normal(0, 100);
    sigma_b ~ cauchy(0, 5);
}
