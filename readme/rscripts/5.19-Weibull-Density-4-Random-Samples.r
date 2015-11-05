# Follows example 5.19 from Stats Devore 8th edition
# Material strength for a random specimen.  The goal here is to create
# 4 different random samples of size 10 from a weibull distribution
# and understand how means, variance and std dev vary between samples

library("ggplot2")

n <- 10
shape <- 2
scale <- 5

# Density Curve - the p of a material strength measurement
# occuring at a specifc point (we can't have a specific (P=X))
# in a continuous function

s1 <- rweibull(n, shape, scale)
s2 <- rweibull(n, shape, scale)
s3 <- rweibull(n, shape, scale)
s4 <- rweibull(n, shape, scale)

dat <- cbind(s1,s2,s3,s4)
m <- matrix(data=dat, nrow=10, ncol=4)

# Convert the matrix into a dataframe.
df <- as.data.frame(m)

# Stack the dataframes
dfs <- stack(df)

# geom_histogram takes discrete values and plots them in a 
# histogram bin
#g <- ggplot(dfs, aes(x=values)) + geom_histogram(binwidth=.5)

g <- ggplot(dfs, aes(x=values)) + geom_density(aes(group=ind, colour=ind, fill=ind, alpha=0.3))

print(g)
