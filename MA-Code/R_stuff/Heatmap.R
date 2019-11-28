library(ggplot2)
library(heatmaply)
library(ggdendro)
library(plotly)
#######################################
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
data = read.csv("scores_nw_romance_new_gap")
matrix= as.matrix(scale(data))
data <- data[order(data$Score),]
#######################################


ggplot(data = data, aes(x=L1, y=L2, fill=Score)) + 
  geom_tile()+
  ggtitle("Needleman-Wunsch Scores Romance with New Gap")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
heatmaply(scale(matrix))
