data {
  int<lower = 0> I;
  int<lower = 0> y[I];  
  real<lower = 0> births[I];
  int<lower = 0> RA[I];
}

parameters {
  real alpha_tilde;
  real beta_tilde;
  real mu_a;
  real mu_b;
  real<lower=0, upper = 100> sigma_a;
  real<lower=0> sigma_b;
}

transformed parameters {
  real alpha = mu_a + sigma_a*alpha_tilde;
  real beta = mu_b + sigma_b*beta_tilde;
  real<lower=0> lambda[I];
  for (i in 1:I)
  lambda[i] = births[i]*exp(alpha+beta*RA[i]);
  }

model {
    alpha_tilde ~ normal(0,1);
    beta_tilde~ normal(0,1);
    mu_a ~ normal(0, 100);
    sigma_a ~ uniform(0, 100);
    mu_b ~ normal(0, 100);
    sigma_b ~ cauchy(0,5);
        for (i in 1:I){
    y[i] ~ poisson(lambda[i]);
    }
}
