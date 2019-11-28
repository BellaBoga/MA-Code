setwd("/home/bella/Dropbox/Master-Thesis/MA_Thesis_Program/Iranian/")
library(lingtypology)
library(htmlwidgets)
map.feature(df$names,
                 label = df$languages,
                 label.fsize = 10,
                 #label.position = "right",  
                 label.hide = FALSE,
                 label.emphasize = list(1:24, "red"))
                  

saveWidget(m, file="m.html")
df <- data.frame(languages = c("Asturian",
                               "Dalmatian",
                               "Romagnol",
                               "French",
                               "Friulian",
                               "Galician",
                               "Italian",
                               "Catalan",
                               "Ligurian",
                               "Ladin",
                               "Lombard",
                               "Picard",
                               "Piemontese",
                               "Portuguese",
                               "Occitan",
                               "Romansh",
                               "Romanian",
                               "Istro Romanian",
                               "Aromanian",
                               "Megleno Romanian",
                               "Sicilian",
                               "Campidanese Sardinian",
                               "Spanish",
                               "Venetian",
                               "Walloon"))
romance <- read.csv("long_lati_iranian.csv")


map.feature(languages = romance$name,
            #features = romance$dialect,
            #popup = romance$language,
            latitude = romance$latitude,
            longitude = romance$longitude,
            label = romance$code_iso,
            label.fsize = 10,
            label.position = "right",  
            label.hide = FALSE,
            label.emphasize = list(1:95, "red"))
#####################################
