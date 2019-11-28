head(qbb_lat)
plot(qbb_lat$score,ylim=c(-15,30),ylab = "Scores", xlab="Words" ,type ="l",col = "red")
plot(sc1_sc2$score,ylim=c(-15,30),ylab = "Scores", xlab="Words" ,type ="l",col = "red")
lines(sc1_sc3$score, type = 'l', col = "blue")
lines(sc1_sc4$score, type = 'l', col = "green")
lines(qbb_lat$score, type = 'l', col = "black")
legend(1, -10, legend=c("Sicilian1,Sicilian2", "Sicilian1, Sicilian3",  "Sicilian1, Sicilian4","Ancient Latin,Clasical Latin"),
       col=c("red", "blue","green","black"), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')

plot(ita_sc1$score,ylim=c(-15,30),ylab = "Scores", xlab="Words" ,type ="l",col =660)
legend(1, -10, legend=c("Standard Italian, Palermitan Sicilian","Standard Italian, Standard French"),
       col=c(660,"red"), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')

##############################################################
df <- structure(list(Germany = c(1L, 3L, 6L, 1L, 2L), Plastic = c(2L, 
                                      5L, 4L, 2L, 3L)), .Names = c("Germany", "Plastic"), class = "data.frame", row.names = c(NA, 
                                                                                                                                                          -5L))

# Expand right side of clipping rect to make room for the legend
par(xpd=T, mar=par()$mar+c(0,0,0,4))

# Graph data (transposing the matrix) using heat colors,  
# put 10% of the space between each bar, and make labels  
# smaller with horizontal y-axis labels
barplot(t(df), main="Barrier distribution", xlab="Barrier [kcal/mol]", ylab="Mutant count", 
        col=c("blue", "red"), space=0.1, cex.axis=0.8, las=1,
        names.arg=c("Mon","Tue","Wed","Thu","Fri"), cex=0.8) 

# Place the legend at (4,9) using blue and red
legend(4, 9, names(df), lwd=4, col=c("blue", "red"))

# Restore default clipping rect
par(mar=c(5, 4, 4, 2) + 0.1)
#######################################################

#transpose dataframe to matrix
library(dplyr)
library(tidyverse)
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/")
tmp <- read.csv("fml.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
rom1<-spread(tmp,L2,distance_Scores)
write.csv(rom1,"nw_distances_iranian.csv")
###transpose matrix into table
library(reshape2)
tmp.m <- melt(tmp)
tmp.m
na.omit(tmp.m)
write.csv(tmp.m, "table_dummy.csv")
###################
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/Filtered_Data_Romance/")
iran <- read.csv("mean_values_nw_new_gap_romance.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
iran %>% drop_na()
head(iran)
##################################from kmeans
daten <- na.omit(df)
cmdscale(df$Score, k = 2, eig = FALSE, add = FALSE, x.ret = FALSE)
mds1 = cmdscale(df)
na.omit(df)
# plot
plot(mds1[,1], mds1[,2], type = "n", xlab = "", ylab = "", axes = FALSE,
     main = "cmdscale (stats)")
text(mds1[,1], mds1[,2], labels(eurodist), cex = 0.9, xpd = TRUE)
#################
setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/Filtered_Data_Romance/")
df <- read.csv("rom_matrix_lvst", header=TRUE, sep=",")
library(wesanderson)
head(df)
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

iranian.languages = c("av1", "av2", "pb1","pb2" ,"bql","bgp","bgn","ps1", "pb3", "pb4", "wb1", "pt1" ,"wb2" ,"pb5" ,"pb6" , "os1",
                      "pb7", "prs", "gzi", "glk", "hac", "pb8", "os2", "wb3", "pb9" ,"p10", "jdt", "pt2", "ps2", "kiu" ,"zum" ,"ckb", "kmr", "ps3", "lrl" 
                      ,"lsa", "luz", "p11", "p12", "p13", "kfm", "p14", "ps4", "p15", "mnj" ,"ntz", 
                      "p16", "p17", "p18", "oru", "prc", "p19", "pt3" ,"pes", "p20" ,
                      "pt4", "pt5", "srz" , "p21", "sgh", "siy", "sqo", "bcc" ,"sdh" ,"fay" ,"p22", "tgk" ,"tly" ,"p23" ,"p24",
                      "vaf", "ps5" ,"wne" ,"yai" ,"wb5", "yah" ,"ydg", "p25", "diq"
                      
)
dummy.names = c("A","B", "C", "D","E","F","G","H","I","J","K","L")

library(magrittr)
library(dplyr)
library(ggpubr)
library(fpc)
# Cmpute MDS
mds <- df %>%
        dist() %>%          
        cmdscale() %>%
        as_tibble()
colnames(mds) <- c("Dim.1", "Dim.2")
# Plot MDS
ggscatter(mds, x = "Dim.1", y = "Dim.2", 
          label = df$L1,
          size = 1,
          color = Cluster$cluster,
          repel = TRUE)
clust <- kmeans(mds, 4, nstart = 25)$cluster %>%
        as.factor()
mds <- mds %>%
        mutate(groups = clust)
# Plot and color by groups
ggscatter(mds, x = "Dim.1", y = "Dim.2", 
          label = languages.names,
          #col= "GrandBudapest",
          color = "groups",
          #palette = cmap,
          size = 1, 
          ellipse = TRUE,
          ellipse.type = "convex",
          repel = TRUE)
ratio_ss[k] <- clust$tot.withinss / clust$totss
plot(ratio_ss, type = "b", xlab = "k")


