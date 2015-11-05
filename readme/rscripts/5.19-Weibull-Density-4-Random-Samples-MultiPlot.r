# Follows example 5.19 from Stats Devore 8th edition
# Material strength for a random specimen.  The goal here is to create
# 4 different random samples of size 10 from a weibull distribution
# and understand how means, variance and std dev vary between samples. Using multiplot
# to display various histrograms and density plots

library("ggplot2")
if(!exists("multiplot", mode="function")) source("util.R")

multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

n <- 1000
shape <- 2
scale <- 5

s1 <- data.frame(str=rweibull(n, shape, scale))
s2 <- data.frame(str=rweibull(n, shape, scale))
s3 <- data.frame(str=rweibull(n, shape, scale))
s4 <- data.frame(str=rweibull(n, shape, scale))


p1 <- ggplot(s1, aes(x=str, colour=str)) + geom_density()

#p2 <- ggplot(s2, aes(x=str)) + 
    #geom_histogram(aes(y=..density..), bindwidth=.5, colour="black", fill="white") 

#m <- multiplot(p1, p2, cosl=2)


print(p1)

