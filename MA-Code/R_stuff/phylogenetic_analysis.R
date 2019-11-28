#library(devtools)
install_github("liamrevell/phytools")
library(ape)
text.string<-
  "(((((((cow, pig),whale),(bat,(lemur,human))),(robin,iguana)),coelacanth),gold_fish),shark);"
vert.tree<-read.tree(text=text.string)
plot(vert.tree,no.margin=TRUE,edge.width=2)
library(phytools)
