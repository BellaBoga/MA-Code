setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
rom <- read.csv("final_romance_lev.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
head(rom)
########LIKELIHOOD RATIO STATISTICS, BOOTSTRAP,MIXTURE MODEL##########################
library(mixtools)
set.seed(100)
rom_dens = rom$Score
mixmodel = normalmixEM(rom_dens, lambda = NULL, mu = NULL, sigma = NULL, k = 8,
                      mean.constr = NULL, sd.constr = NULL,
                      epsilon = 1e-08, maxit = 100000, maxrestarts=20,
                      verb = FALSE, fast=FALSE, ECM = FALSE,
                      arbmean = TRUE, arbvar = TRUE)
plot(mixmodel,whichplots=2,main2 = "Iranian Levenshtein Data")
lines(density(rom_dens), lty=3, lwd=2)
summary(mixmodel)
#############################################
library(mclust)
class <- rom
table(class)
X <- rom$Score
head(X)
clPairs(X, class)
BIC <- mclustBIC(rom$Score)
plot(BIC)
summary(BIC)
mod1 <- Mclust(X, x = BIC)
summary(mod1, parameters = TRUE)
plot(mod1, what = "classification")
table(class, mod1$classification)
plot(mod1, what = "uncertainty",main = "Optimal number of k - Romance")
ICL <- mclustICL(X)
summary(ICL)
plot(ICL,main = "Optimal number of k - Romance")


#this basically does what Soeren described but with another package
LRT <- mclustBootstrapLRT(rom$Score, modelName = "V",level = 0.05,nboot = 999)
LRT
######################################################
#################### last approach which gave me 4 components for Romance
abc <-Mclust(rom$Score)
summary(abc)
summary(abc,parameters=TRUE)
plot(abc)