# ever wondered what happens with the exponential and gamma functions? remember
# Gamma is a continuous extension to the Factorial with:
# Gamma(k) = k * Gamma(k - 1), so the question generalizes the: What happens
# with Exponential and Factorial functions

rm(list = ls())

par(mfrow = c(2, 2))

p = seq(0.05, 4, 0.05)

plot(p, gamma(p), type = 'l', col = 'blue', xlab = 'x', ylab = 'F(x)')
lines(p, exp(p), col = 'red')
legend('top', c('gamma(x)', 'exp(x)'),
       lty=c(rep('solid',2),rep('solid',3)), col=c('blue', 'red'))
title('Gamma vs. Exp in [0, 4]')

p = seq(4, 8, 0.05)

plot(p, gamma(p), type = 'l', col = 'blue', xlab = 'x', ylab = 'F(x)')
lines(p, exp(p), col = 'red')
legend('top', c('gamma(x)', 'exp(x)'),
       lty=c(rep('solid',2),rep('solid',3)), col=c('blue', 'red'))
title('Gamma vs. Exp in [4, 8]')

p = seq(.05, 8, 0.05)
plot(p, log(gamma(p)), type = 'l', col = 'blue', xlab = 'x', ylab = 'log(F(x))')
lines(p, p, type = 'l', col = 'red')
legend('top', c('log(gamma(x))', 'x'),
       lty=c(rep('solid',2),rep('solid',3)), col=c('blue', 'red'))
title('Log(Gamma(x)) vs. Identity')

par(mfrow = c(1, 1))
