#install.packages("ggplot2")
#C:\temp\tiff\log.txt
library(ggplot2)

dir <- dirname(sys.frame(1)$ofile)
csv <- paste(dir, "file_bytes_compared_to_perimeter_size_1.csv", sep="/")
print(csv)
 
d <- read.csv(file=csv)

s <- ggplot(data = d, aes(y = Bytes, x = Perimeter))
s <- s + geom_point()
s
d

