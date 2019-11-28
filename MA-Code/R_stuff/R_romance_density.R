setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
iran <- read.csv("final_nw_results.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
na.omit(iran)
d <- density(iran$NWND,complete.cases(iran$NWND))
plot(d,xlab = "Needleman Wunsch Normalized Divided", main="Distribution of Romance")
polygon(d, col="red", border="blue") 
hist(iran$NWND, breaks = 40)



###### Determine the Distribution
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
iran <- read.table("first_intermediate_final_results.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
library(fitdistrplus)
library(logspline)
descdist(iran, discrete = FALSE,boot=1001)
fnorm<-fitdistcens(iran$NWND, "norm")
bnorm<-bootdistcens(fnorm)
fit.weibull <- fitdist(iran$Score, "weibull")
fit.gamma <- fitdist(iran$Score, "gamma")
fit.norm <- fitdist(iran$Score, "norm")
fit.beta <- fitdist(iran$Score, "beta")

gofstat(list(fit.weibull,fit.gamma,fit.norm))
bootdist(fit.gamma)
plot(fit.gamma)
plotdist(iran$Score, histo = TRUE, demp = TRUE,pch = 19)



