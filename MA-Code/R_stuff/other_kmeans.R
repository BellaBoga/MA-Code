setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
df <- read.csv("final_nw_results.csv", header=TRUE, sep=",")
df <- scale(df$NWND)
head(df, n = 3)
set.seed(123)
km.res <- kmeans(df, 4, nstart = 25)
print(km.res)
aggregate(df, by=list(cluster=km.res$cluster), mean)
dd <- cbind(df, cluster = km.res$cluster)
head(dd)
km.res$cluster
head(km.res$cluster, 4)
km.res$size
km.res$centers
