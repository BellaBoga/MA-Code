setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
rom <- read.csv("final_romance_nw.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
head(rom)
########LIKELIHOOD RATIO STATISTICS, BOOTSTRAP,MIXTURE MODEL##########################
library(mixtools)
set.seed(100)
rom_dens = rom$Score
mixmodel = normalmixEM(rom_dens, lambda = NULL, mu = NULL, sigma = NULL, k = 3,
                      mean.constr = NULL, sd.constr = NULL,
                      epsilon = 1e-08, maxit = 100000, maxrestarts=20,
                      verb = FALSE, fast=FALSE, ECM = FALSE,
                      arbmean = TRUE, arbvar = TRUE)
plot(mixmodel,whichplots=2,main2 = "Romance Needleman-Wunsch Data")
lines(density(rom_dens), lty=3, lwd=2)
summary(mixmodel)
####################################################
fit <- kmeans(mydata, 5)


#######################BOOTSTRAP#################
set.seed(100)
x <- as.matrix(rom$Score)
#y <- makemultdata(x, cuts = quantile(x, (1:9)/10))$y
a <- boot.comp(y = rom$Score, max.comp = 3, B = 100, mix.type = "normalmix",
               epsilon = 1e-3)
a
########################SCHWACHSINN ZUM TESTEN#######################
data(rom)
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
LRT <- mclustBootstrapLRT(rom$Score, modelName = "V",level = 0.05,nboot = 999)
LRT
plot(LRT$boot, G = 1, hist.col = "grey", hist.border = "lightgrey", breaks = "Scott", 
     col = "forestgreen", lwd = 2, lty = 3, main = NULL)
#############################UNDVONVORNE######################
abc <-Mclust(rom$Score)
summary(abc)
summary(abc,parameters=TRUE)
plot(abc)
#############################################################
mod5 <- densityMclust(rom$Score)
summary(mod5)
plot(mod5, what = "BIC")
plot(mod5, what = "density")
plot(mod5, what = "density", type = "hdr")
plot(mod5, what = "density", type = "hdr",
     data = rom$Score, points.cex = 0.5)
plot(mod5, what = "density", type = "persp")
mod1dr <- MclustDR(mod5)
summary(mod1dr)
plot(mod1dr, what = "pairs")
plot(mod1dr, what = "boundaries", ngrid = 200)
mod1dr <- MclustDR(mod5, lambda = 1)
summary(mod1dr)
plot(mod1dr, what = "scatterplot")
mod2dr <- MclustDR(mod5)
summary(mod2dr)
plot(mod2dr, what = "scatterplot")
