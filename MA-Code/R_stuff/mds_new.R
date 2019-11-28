library(ggplot2)
library(magrittr)
library(dplyr)
library(ggpubr)
library(fpc)
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
df <- read.csv("matrix_lv_romance.csv", header=TRUE, sep=",")
df2 <- read.csv("final_romance_lev.csv",header = TRUE, sep = ",")
d <- dist(df) # euclidean distances between the rows

#mds
fit <- cmdscale(d,eig=TRUE, k=2) # k is the number of dim
fit # view results

# plot solution
x <- fit$points[,1]
y <- fit$points[,2]
p<-plot(x, y, xlab="Coordinate 1", ylab="Coordinate 2",
     main="Metric MDS", type="n")
text(x, y, labels = languages.names, cex=.7,col=df2$clusternumber) 

pc_dat<- data.frame(type = rownames(df), PC1 = df[,0], PC2= df[,1])
ggplot(p,aes(x=PC1, y=PC2, col=type)) + geom_point() + geom_text(aes(label = type), hjust=0, vjust=0)

#kmeans
set.seed(20)
Cluster <- kmeans(df2$Score,4 , nstart = 20)
Cluster
Cluster$cluster <- as.factor(Cluster$cluster)
cols = as.numeric(as.factor(colnames(Cluster$cluster)))



######################################
langs <- c("qbb",
           "lat",
           "ruq",
           "ruo",
           "rup",
           "ron",
           "dlm",
           "fur",
           "ll1",
           "ll2",
           "ro1",
           "ro2",
           "ro3",
           "ro4",
           "pm1",
           "pm2",
           "pm3",
           "pm4",
           "pm5",
           "lm1",
           "lm2",
           "eg1",
           "eg2",
           "eg3",
           "eg4",
           "li1",
           "li2",
           "li3",
           "ve1",
           "ve2",
           "ve3",
           "ito",
           "ita",
           "itg",
           "itf",
           "nea",
           "src",
           "sro",
           "sc1",
           "sc2",
           "sc3",
           "sc4",
           "ca1",
           "ca2",
           "ca3",
           "ca4",
           "ca5",
           "ca6",
           "spa",
           "ast",
           "por",
           "glg",
           "pr1",
           "pr2",
           "fro",
           "fra",
           "pcd",
           "win")



languages.names <- c("Asturian",
                     "Central Catalan",
                     "North-Western Catalan",
                     "Minorcan Catalan",
                     "Castello de la Plana Catalan",
                     "Valencia Catalan",
                     "Manises Catalan",
                     "Dalmatian",
                     "Ravennate Romagnol",
                     "Ferrarese Emiliano",
                     "Carpigiano Emiliano",
                     "Reggiano Emiliano",
                     "Standard French",
                     "Old French",
                     "Friulian",
                     "Galician",
                     "Standard Italian",
                     "Foligno Italian",
                     "Grosseto Italian",
                     "Old Italian",
                     "Late Classical Latin",
                     "Rapallo Ligurian",
                     "Genoese Ligurian",
                     "Stella Ligurian",
                     "Gardenese Ladin",
                     "Fassano Ladin",
                     "Bergamo Lombard",
                     "Plesio Lombard",
                     "Neapolitan",
                     "Picard",
                     "Lanzo Torinese Piemontese",
                     "Barbania Piemontese",
                     "Carmagnola Piemontese",
                     "Turinese Piemontese",
                     "Vercellese Piemontese",
                     "Standard Portuguese",
                     "Provencal Occitan",
                     "Savoyard Franco-Provencal",
                     "Archaic Latin",
                     "Rumantsch Grischun",
                     "Sursilvan Romansh",
                     "Surmiran Romansh",
                     "Vallader Romansh",
                     "Romanian",
                     "Istro Romanian",
                     "Aromanian",
                     "Megleno Romanian",
                     "Palermitan Sicilian",
                     "Messinese Sicilian",
                     "Catanian Sicilian",
                     "South-Eastern Sicilian",
                     "Castilian Spanish",
                     "Logudorese",
                     "Campidanese",
                     "Venice Venetian",
                     "Primiero Venetian",
                     "Bellunese Venetian",
                     "Walloon"
                     
)
