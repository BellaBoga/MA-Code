#####TRANSPARENT COLOURS#########
## Transparent colors
## Mark Gardener 2015
## www.dataanalytics.org.uk

t_col <- function(color, percent = 50, name = NULL) {
  
  #	  color = color name
  #	percent = % transparency
  #	   name = an optional name for the color
  
  ## Get RGB values for named color
  rgb.val <- col2rgb(color)
  
  ## Make new color using input color as base and alpha set by transparency
  t.col <- rgb(rgb.val[1], rgb.val[2], rgb.val[3],
               max = 255,
               alpha = (100-percent)*255/100,
               names = name)
  
  ## Save the color
  invisible(t.col)
  
}
## END

mycol1 <- t_col("pink", perc = 90, name = "lt.pink")
mycol2 <- t_col("red", perc = 70, name = "lt.pink")
mycol3 <- t_col("blue", perc = 70, name = "lt.pink")

#########FUNCTIONS#########
plot_histogram <- function(df, feature) {
  plt <- ggplot(df, aes(x=eval(parse(text=feature)))) +
    geom_histogram(aes(y = ..density..), alpha=0.7, fill="#33AADE", color="black") +
    geom_density(alpha=0.3, fill="red") +
    geom_vline(aes(xintercept=mean(eval(parse(text=feature)))), color="black", linetype="dashed", size=1) +
    labs(x=feature, y = "Density")
  print(plt)
}



plot_multi_histogram <- function(df, feature, label_column) {
  plt <- ggplot(df, aes(x=eval(parse(text=feature)), fill=eval(parse(text=label_column)))) +
    geom_histogram(alpha=0.7, position="identity", aes(y = ..density..), color="black") +
    geom_density(alpha=0.7) +
    geom_vline(aes(xintercept=mean(eval(parse(text=feature)))), color="black", linetype="dashed", size=1) +
    labs(x=feature, y = "Density")
  plt + guides(fill=guide_legend(title=label_column))
}
####preprocessing
setwd("/home/bella/Dropbox/Vorträge/15_07_2019_Oberseminar")
iran <- read.table("final_romance_nw.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
dknow <- read.table("mean_values_ll1.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
####################################################################
merger <- data.frame("Merged.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)
################################################################


library(ggrepel)
library(ggplot2)
library(wesanderson)

ggplot(iran, aes(x=reorder(Language_Pairs, Score), y=Score)) +
  geom_point() +
  geom_text(aes(label=Language_Pairs),hjust=0, vjust=0)+
  geom_label_repel(aes(label = Language_Pairs),
                   box.padding   = 0.35, 
                   point.padding = 0.5,
                   segment.color = 'grey50') +
  xlab("Language Pairs")+ # for the x axis label
  ylab("Score")+
  ggtitle("Venice Venetian")+
  theme(plot.title = element_text(color="#993333", size=14, face="bold"))+  #geom_smooth(method=lm, aes(fill=MAX))+
  geom_smooth(method=lm, se=FALSE)+
theme(axis.text.x = element_text( color="#993333", 
                                 size=10,angle = 45),
      axis.text.y = element_text( color="#993333", 
                                 size=10, angle = 45))
  
###########################################################################

hist(merger$Scores_Sc2,xlim=c(-10,30),ylim=c(0,50),breaks=5,
     col=mycol3,main="",xlab="number",ylab="Score")
par(new=TRUE)
hist(merger$Scores_Sc3,xlim=c(-10,30),ylim=c(0,50),breaks=5,
     col=mycol2,main="",xlab="",ylab="")
par(new=TRUE)
hist(merger$Scores_Sc4,xlim=c(-10,30),ylim=c(0,50),breaks=5,
     col=mycol1,main="",xlab="",ylab="")
legend(-10,50, c("Sc1_Sc2","Sc1_Sc3","Sc1_Sc4"), col=c(mycol3,mycol2,mycol1), lwd=5)
############################################################
ggplot(data = rom, aes(x = Language_Pairs, fill = MAX)) + 
  geom_bar()+ coord_flip()
#########################################################
library(plotly)
library(lattice)



d <- density(iran$Score)
plot(d,xlab = "NW-Scores", main="Distribution of Mean Values - Ferrarese Emiliano")
polygon(d, col="red", border="blue") 
##################################################################################
setwd("/home/bella/Dropbox/Vorträge/15_07_2019_Oberseminar")
rom <- read.table("final_romance_lev.csv", header=TRUE, sep=",", stringsAsFactors=FALSE)

plot(sort(rom$Score),main="Distribution of Romance Levenshtein Scores", 
     xlab="Language Pairs", ylab="Levenshtein Distance", col = rom$Cluster_number)
