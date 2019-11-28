library(ggridges)
library(ggplot2)

setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
rom <- read.table("test_si_distances.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

rom <- read.table("final_nw_results.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

# Data
library(ggplot2)
ggplot(rom, aes(x = rom$NWND, y =rom$NWND,colour = rom$L1_L2)) +
  geom_point() +
  ggtitle("") +
  facet_wrap( ~ rom$L1_L2)
