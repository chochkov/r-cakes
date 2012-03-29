# from https://stat.ethz.ch/pipermail/r-help/2003-September/038314.html
# lets first simulate a bivariate normal sample
library(MASS)

bivn <- mvrnorm(1000, mu = c(0, 0), Sigma = matrix(c(1, .5, .5, 1), 2))

# now we do a kernel density estimate
bivn.kde <- kde2d(bivn[,1], bivn[,2], n = 50)

# now plot your results
contour(bivn.kde)
image(bivn.kde)
persp(bivn.kde, phi = 45, theta = 30)

# fancy contour with image
image(bivn.kde); contour(bivn.kde, add = T)

# fancy perspective
persp(bivn.kde, phi = 45, theta = 30, shade = .1, border = NA)
