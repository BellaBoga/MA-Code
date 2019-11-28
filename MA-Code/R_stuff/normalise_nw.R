setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
rom <- read.csv("final_nw_iranian.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
#Normalized Data to value between 0 and 1
normalized = (rom$Score-min(rom$Score))/(max(rom$Score)-min(rom$Score))
print(normalized)
# Histogram of example data and normalized data
par(mfrow=c(1,2))
hist(rom$Score,          breaks=10, xlab="Data",            col="lightblue", main="")
hist(normalized, breaks=10, xlab="Normalized Data", col="lightblue", main="")

#turn similarities into distances
a <- 1-normalized
write.csv(a, "fml.csv")
write.csv(normalized,"test2.csv")
