library("ggplot2")

# 1. Generate a Random Normal population in vector p
# 2. Random Sample n = 30 from pop
# 3. Smooth the curves
# 4. Notice the population mean is very close to 0 with a large N (.0014)
# during the last run.  Sample mean is -0.515.  Every time we run the script
# pop mean would be close to 0.  Sample mean will have more variance between runs
# giving different estimate erro

p <- rnorm(1000000, mean=0, sd=1)
s <- sample(p,5)

pframe <- data.frame(feature = p)
sframe <- data.frame(feature = s)

#p1 <- ggplot(pframe, aes(x=feature)) + geom_density()

plot <- ggplot() + 
  # pop
  geom_density(data=pframe, aes(x=feature), adjust=5) +
  # sample
  geom_density(data=sframe, aes(x=feature), adjust=5) + 
  scale_fill_manual( values = c("red","blue"))

print(plot)
cat(sprintf("Pop Mean %s ", mean(p)))
cat(sprintf("Sample Mean %s ", mean(s)))    