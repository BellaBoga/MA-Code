library(VIM)
library(dplyr)
library(lubridate)
library(boot)
library(tidyr)
library(tidyverse)  
library(cluster) 
library(factoextra) 
library(ggplot2)
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
df <- read.csv("final_nw_iranian.csv", header=TRUE, sep=",")
set.seed(20)
Cluster <- kmeans(df$Score,3 , nstart = 20)
Cluster
Cluster$cluster <- as.factor(Cluster$cluster)
ggplot(df, aes(df$L1, df$L2, color = Cluster$cluster)) + geom_point()+
  ggtitle("Iranian Clusters with Needleman-Wunsch")+
  xlab("L1")+
  ylab("L2")+
  labs("Cluster")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
out <- cbind(df, clusterNum = Cluster$cluster)
head(out)

