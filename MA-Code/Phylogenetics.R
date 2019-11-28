library(ape)
library(ggtree)
library(phangorn)
library(ggplot2)
library(tidyverse)


setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
#table_dummy <- read.table("dummy_matrix.csv",header=TRUE,row.names = 1,sep = ",")
table_nw <- read.csv("matrix_nw_distances_iranian.csv", header=TRUE,row.names = 1,sep=",")
table_lv <- read.table("matrix_lv_romance.csv", header=TRUE,row.names = 1,sep=",")
table_nw <- read.table("test_matrix.phy", skip=1, row.names=1)
mx <- as.matrix(table_nw)
dm <- as.dist(mx)
t <- fastme.bal(dm)
plot(t)
na.omit(table_nw)
clus <- hclust(as.dist(table_lv),method =)
write.tree(phy=as.phylo(t),file="iran_nw.newick")

clus1 <- njs(table_dummy, fs = 15)
clus2 <- upgma(as.matrix(table_lv))

trw <- fastme.bal(as.dist(table_lv))
plot(trw, main = "FastME Tree with Romance Data")
plot(clus,main = "UPGMA Tree with Fictitious Data",xlab = "Cluster")
fastme.ols(clus)
###############################################plotting trees
nwk <- system.file("lvst_tree_nj.newick")
tree <- read.tree(nwk)
ggtree(tree)
#########################################
library("ape")
library("Biostrings")
library("ggplot2")
library("ggtree")
nwk <- system.file("extdata", "sample.nwk", package="ggtree")
tree <- read.tree(nwk)
tree





ggtree(t, layout = "rectangular") + 
  geom_text2(data=table, aes(subset=!isTip, label=label, color="isTip"), hjust=1) + 
  geom_tiplab(size=3, aes(angle=0)) + 
  scale_color_manual(values=c("red", "firebrick")) + 
  geom_hilight(22, "brown") + 
  geom_hilight(20, fill = "steelblue") + 
  geom_hilight(25, fill="darkgreen") + 
  geom_hilight(32, fill="pink") + 
  geom_hilight(30, fill="grey") + 
  geom_hilight(31, fill="purple") + 
  geom_hilight(29, fill="lightblue") + 
  ggtitle("Protein Sequences correlation")

########################test
x <- c(7, 8, 11, 13, 16, 13, 17, 5, 8, 10, 13,
       10, 14, 5, 7, 10, 7, 11, 8, 11, 8, 12,
       5, 6, 10, 9, 13, 8)
M <- matrix(0, 8, 8)
M[lower.tri(M)] <- x
M <- t(M)
M[lower.tri(M)] <- x
dimnames(M) <- list(1:8, 1:8)
tr <- nj(M)
plot(tr, "u")
### a less theoretical example
data(woodmouse)
trw <- fastme.ols(as.dist(table_dummy))
plot(trw, main = "FastME Tree with Fictitious Data")
head(woodmouse)


####################################################
library("ape")
library("Biostrings")
library("ggplot2")
library("ggtree")
nwk <- system.file("extdata", "rom.newick", package="ggtree")
tree <- read.tree(nwk)
tree

