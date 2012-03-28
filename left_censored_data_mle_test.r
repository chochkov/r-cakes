# To Teil I Aufgabe 2 We test the likelihood by providing some MLE Estimation
# procedure
 
rm(list = ls())

simulate  = function(k, m, n, h, theta, N.simulation) {
  likelihood = function(th) {
    - (n * log(th) - th * sum(Y.observed) + k * log(1 - exp(-h * th)))
  }

  gradient  = function(th) {
    - (n / th - sum(Y.observed) + k * 1 / (1 - exp(-h * th)) * ( h * exp( - h * th)))
  }

  results = matrix(NA, ncol = 1, nrow = N.simulation)

  for ( i in 1:N.simulation ) {
    Y = rexp(n, theta)
    missing_index = sample(n, k)
    is.na(Y[missing_index]) = TRUE
    observed_index = which(! is.na(Y))
    Y.observed = Y[observed_index]

    results[i, ] = nlminb(c(theta * .85), obj = likelihood, grad = gradient,
                          lower = c(theta * 0.1), upper = c(theta * 5))$par
  }

  return(results)
}

k = 50                 # they left already
m = 1000               # we know their waiting time
n = k + m              # all observed cases
h = 1                  # left censoring
theta = .05            # true value of the exponential distribution rate parameter
N.simulation = 1000

par(mfrow = c(2, 2))

hist(simulate(k, m, n, h, theta, N.simulation), main = '50 censored, 1000
     observed cases; Theta = .05')
abline(v = theta, col = 'red', lty = 2)

k = 50
m = 100
n = k + m
hist(simulate(k, m, n, h, theta, N.simulation), main = '50 censored 100 observed
     cases; Theta = .05')
abline(v = theta, col = 'red', lty = 2)
